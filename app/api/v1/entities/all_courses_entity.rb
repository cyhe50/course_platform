module V1
    module Entities
        class AllCoursesEntity < Grape::Entity
            expose :id
            expose :subject
            expose :course_type
            expose :intro
        end
    end
end