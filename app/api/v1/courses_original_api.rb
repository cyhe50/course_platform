module V1
    class CoursesOriginalApi < Grape::API

        resource :original do
            resource :courses do

                desc 'Read all in published'
                get do
                    courses = Course.where(published: true)
                    present courses
                end

                route_param :id do

                    desc 'Read single'
                    get do
                        course = Course.find(params[:id])
                        present course
                    end

                    desc 'make order'
                    post do
                        # current_user = User.find()
                        # course = Course.find(params[:id])
                        # Record.create(user: current_user, course: course, order_status: 0, payment_status: 0, exp_date: Time.zone.now + course.exp_time.days )

                    end
                end
            end
        end
    end
end