module Base
    class API < Grape::API
        format :json
        prefix :api
        version 'v1', using: :path

        mount V1::OrdersApi
        mount V1::CoursesOriginalApi

    end
end
