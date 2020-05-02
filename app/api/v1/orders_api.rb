module V1
    class OrdersApi < Grape::API

        resource :orderrecord do
            desc 'get courses list for current_user'
            get do
                courses = current_user.courses.all
                present courses, with: V1::Entities::OrdersEntity
            end
            
            desc 'get a specific course for current_user'
            route_param :course_id do
                get do
                    course =  current_user.courses.find(params[:course_id])
                    present course, with: V1::Entities::SingleOrderEntity
                end
            end

            resource :filter do
                desc 'get courses of specific course_type'
                params do
                    requires :type
                end
                get :course_type do
                    courses = current_user.courses.where(course_type: params[:type] )
                    present courses, with: V1::Entities::OrdersEntity
                end

                desc 'get all unexpired courses'
                get :unexpired do
                    courses = current_user.courses.where('exp_date >= ?', Time.now)
                    present courses, with: V1::Entities::OrdersEntity
                end

            end
        end
    end
end