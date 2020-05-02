module V1
    module Entities
        class RecordEntity < Grape::Entity
            expose :order_status
            expose :payment_status
            expose :exp_date
        end
    end
end

module V1
    module Entities
        class SingleOrderEntity < Grape::Entity
            expose :id
            expose :subject
            expose :price
            expose :currency
            expose :course_type
            expose :published
            expose :url
            expose :intro
            expose :exp_time
            expose :records, using: RecordEntity
        end
    end
end
