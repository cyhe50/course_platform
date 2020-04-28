module Base
    class API < Grape::API
        format :json
        prefix :api
        version 'v1', using: :path

        mount V1::Orders
        mount V1::CoursesManagement
        mount V1::CoursesOriginal

    end
end
