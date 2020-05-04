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
                        record = current_user.records.where(course_id: params[:id]).last
                        if record && record.payment_status && record.order_status
                            present  :bought, true
                        end
                        present :course, @course, with: V1::Entities::SingleCourseEntity
                    end

                    desc 'make order'
                    post do
                        is_published?
                        record = current_user.records.where(course: @course).last
                        if record
                            if !record.payment_status
                                error!({error_code: 400, error_message: "Order is exist, but you need to pay first"})
                            else
                                if record.order_status
                                    error!({error_code:  400, error_message: "the course is still avaliable"}, 400)
                                end
                            end
                        end
                        record = Record.new(user: current_user, course: @course, order_status: 1, payment_status: 1, exp_date: Time.zone.now + @course.exp_time.days + 8.hours )
                        if record.save
                            present record.course_id
                        else
                            error!({error_code: 401, error_message: record.errors.messages}, 401)            
                        end
                    end
                end
            end
        end
    end
end