module V1
    module ShoppingCart
        class Carts < Grape::API

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

                resource :purchases do
                    desc 'purchase a course and create a record'
                    # params do

                    # end
                    get do

                    end
                end
            end
        end
    end
end