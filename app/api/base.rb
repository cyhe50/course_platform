module Base
    class API < Grape::API
        format :json
        prefix :api
        version 'v1', using: :path

        # courses_original_api , orders_api are mounted in user_auth_api
        mount V1::UserAuthApi
        mount V1::Authentication::Sessions
    end
end
