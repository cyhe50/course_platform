module V1
    module Authentication
        class Sessions < Grape::API
            version 'v1', using: :path
            format :json
            prefix :api

            helpers do
                def permitted_params
                    @permitted_params ||= declared(params, include_missing: false, include_parent_namespaces: false)
                    # ActionController::Parameters.new(declared(params, include_missing: false)).permit!   
                end
            end
            resource :signup do
                
                desc 'check if user is valid'
                params do
                    requires :user, type: Hash do
                        requires :email, type: String
                        requires :password, type: String
                        requires :password_confirmation, type: String
                    end
                end
                post do
                    user = User.new(permitted_params[:user])
                    if user.save
                        header 'access_token', user.ensure_authentication_token
                        {status: 'sign up !'}.to_json   
                    else
                        error!({error_code: 401, error_message: user.errors.messages}, 401)            
                    end
                end

            end

            resource :sessions do

                desc "Authenticate user and return user object / access token (log in)"
                params do
                    requires :email, type: String, desc: "User email"
                    requires :password, type: String, desc: "User password"
                end
                post do
                    email = params[:email]
                    password = params[:password]

                    if email.nil? or password.nil?
                        error!({error_code: 404, error_message: "Invalid Email or Password."}, 401)
                        return
                    end
                    
                    user = User.where(email: email.downcase).first
                    if user.nil?
                        error!({error_code: 404, error_message: "Invalid Email or Password"}, 401)
                    end

                    if !user.valid_password?(password)
                        error!({error_code: 404, error_message: "Invalid Email or Password."}, 401)
                        return
                    else
                        raise 'error authentication token' if !user.ensure_authentication_token
                        user.save

                        header 'access_token', user.ensure_authentication_token
                        {status: 'log in !'}.to_json
                    end
                end

                desc "Destroy the access token (log out)"
                delete 'logout' do
                    access_token = headers['Access-Token']
                    user = User.where(authentication_token: access_token).first
                    if user.nil?
                        error!({error_code: 404, error_message: "Invalid access token."}, 401)
                        return
                    else
                        user.reset_authentication_token
                        {status: 'log out !'}.to_json
                    end
                    
                end
            end

        end
    end
end