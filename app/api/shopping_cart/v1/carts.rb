module ShoppingCart
    module V1
        class Carts < Grape::API
            version 'v1', using: :path
            format :json
            prefix :api

            resource :courses do
                desc 'get courses list'
                get do
                    courses = Course.all
                    present courses
                end

            end
        end
    end
end