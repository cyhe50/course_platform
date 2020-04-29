module V1
    class OrdersApi < Grape::API

        # begin
        #     current_user = User.find(params[:user_id])
        # rescue
        #     raise 'invalid user id'
        # end

        resource :orderrecord do
            desc 'get courses list for current_user'
            params do
                requires :user_id
            end
            get do
                current_user = User.find(params[:user_id])
                courses = current_user.courses.all
                present courses, with: V1::Entities::OrdersEntity
            end
            
            desc 'get a specific course for current_user'
            params do
                requires :user_id
                requires :course_id
            end
            route_param :course_id do
                get do
                    current_user = User.find(params[:user_id])
                    course =  current_user.courses.find(params[:course_id])
                    present course
                end
            end

            resource :filter do
                desc 'get courses of specific course_type'
                params do
                    requires :user_id
                    requires :type
                end
                get :course_type do
                    current_user = User.find(params[:user_id])
                    courses = current_user.courses.where(course_type: params[:type] )
                    present courses
                end

                desc 'get all unexpired courses'
                params do
                    requires :user_id
                end
                get :unexpired do
                    current_user = User.find(params[:user_id])
                    courses = current_user.courses.where('exp_date >= ?', Time.now)
                    present courses
                end

            end
        end
    end
end