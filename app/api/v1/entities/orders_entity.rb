module V1
    module Entities
        class OrdersEntity < Grape::Entity
            expose :id
            expose :subject
            expose :course_type
            expose :exp_time
            expose :records, using: V1::Entities::RecordEntity
        end
    end
end