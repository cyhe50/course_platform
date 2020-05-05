module V1
    module Entities
        class CourseEntity < Grape::Entity
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

module V1
    module Entities
        class OrdersEntity < Grape::Entity
            expose :id
            expose :order_status
            expose :payment_status
            expose :exp_date
            expose :created_at
            expose :course, using: CourseEntity
        end
    end
end