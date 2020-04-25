module ShoppingCart
    module V1
        class Carts < Grape::API
            version 'v1', using: :path
            format :json
            prefix :api

            helpers do
                def current_user
                  @current_user ||= User.authorize!(env)
                end
          
                def authenticate!
                  error!('401 Unauthorized', 401) unless current_user
                end
              end

              
            resource :courses do
                desc 'get courses list'
                get do
                    courses = Course.all
                    present courses
                end

                # resource :records do
                #     desc 'purchase a course and create a record'
                #     params do

                #     end
                # end
            end
        end
    end
end