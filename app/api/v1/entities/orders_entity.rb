module V1
    module Entities
        class OrdersEntity < Grape::Entity
            expose :id
            expose :subject
            expose :price
            expose :currency
            expose :course_type
            expose :published
            expose :url
            expose :intro
        end
    end
end