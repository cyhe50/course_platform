module V1
    class UserAuthApi < Grape::API
        prefix 'api'
        format :json
        version 'v1', using: :path
        
        rescue_from :all, backtrace: true
        # error_formatter :json, ErrorFormatter

        before do
            error!("401 Unauthorized, 401") unless authenticated
        end

        helpers do
            def warden
                env['warden']
            end
            def authenticated
                return true if warden.authenticated?
                headers['Access-Token'] && @user = User.find_by_authentication_token(headers['Access-Token'])
            end

            def current_user
                warden.user || @user
            end

        end

        mount V1::CoursesOriginalApi
        mount V1::OrdersApi
    end
end