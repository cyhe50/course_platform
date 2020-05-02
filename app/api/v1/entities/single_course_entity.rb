module V1
    module Entities
        class SingleCourseEntity < Grape::Entity
            expose :id
            expose :subject
            expose :price
            expose :currency
            expose :course_type
            expose :url
            expose :intro
            expose :exp_time
        end     
    end
end