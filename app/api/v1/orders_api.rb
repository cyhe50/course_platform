module V1
    class OrdersApi < Grape::API

        resource :orderrecord do
            desc 'get courses list for current_user'
            get do
                records = current_user.records.all
                present records, with: V1::Entities::OrdersEntity
            end
            
            desc 'get a specific course for current_user'
            route_param :record_id do
                get do
                    record =  current_user.records.find(params[:record_id])
                    present record, with: V1::Entities::SingleOrderEntity
                end
            end

            resource :filter do

                desc 'get all unexpired courses'
                get :unexpired do
                    records = current_user.records.where('exp_date >= ?', Time.zone.now + 8.hours)
                    present records, with: V1::Entities::OrdersEntity
                end

            end
        end
    end
end