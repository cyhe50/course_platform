module V1
    class CoursesOriginalApi < Grape::API

        helpers do
            def is_published?
                @course = Course.find(params[:id])
                error!("404 Course Not Found, 404") if @course.published == false
            end
        end

        resource :original do
            resource :courses do

                desc 'Read all in published'
                get do
                    courses = Course.where(published: true)
                    present courses, with: V1::Entities::AllCoursesEntity
                end

                route_param :id do

                    desc 'Read single in published'
                    get do
                        is_published?
                        present @course, with: V1::Entities::SingleCourseEntity
                    end

                    desc 'make order'
                    post do
                        is_published?
                        Record.create(user: current_user, course: @course, order_status: 1, payment_status: 1, exp_date: Time.zone.now + @course.exp_time.days )
                    end
                end
            end
        end
    end
end