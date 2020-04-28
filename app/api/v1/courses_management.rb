module V1
    class CoursesManagement < Grape::API

        resource :management do
            resource :courses do
                desc 'Create'
                params do
                    requires :subject, type: String
                    requires :price, type: Integer
                    requires :currency, type: String
                end
                post do
                    Course.create!({ subject: params[:subject], price: params[:price],
                    currency: params[:currency], course_type: params[:course_type], published: params[:published],
                    url: params[:url], intro: params[:intro], exp_time: params[:exp_time]})
                end

                desc 'Read all'
                get do
                    courses = Course.all
                    present courses
                end

                route_param :id do
                    desc 'Read a single course'
                    get do
                        course = Course.find(params[:id])
                        present course
                    end

                    desc 'Update'
                    put do
                        Course.find(params[:id]).update({ subject: params[:subject], price: params[:price],
                        currency: params[:currency], course_type: params[:course_type], published: params[:published],
                        url: params[:url], intro: params[:intro], exp_time: params[:exp_time]})
                    end

                    desc 'Delete'
                    delete do
                        course = Course.find(params[:id])
                        course.destroy
                    end

                end 

            end
        end
    end
end