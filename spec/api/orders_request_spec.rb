require 'rails_helper'

describe "Api::OrdersRequest" do
    context 'GET /api/v1/orderrecord' do
        it 'returns courses ordered by current_user' do
            user = User.create(username: 'spec_test',password: '123')
            course1 = Course.create(subject: 'test1',course_type: 'test type')
            course2 = Course.create(subject: 'test2',course_type: 'test type')

            Record.create(user_id: user.id,course_id: course1.id)
            Record.create(user_id: user.id,course_id: course2.id)

            get "/api/v1/orderrecord?user_id=#{user.id}"
            expect(response.status).to eq(200)
            # expect(JSON.parse(response.body)).to eq []
        end
    end
    context 'GET /api/v1/orderrecord/:course_id' do
        it 'return a specific course with record model' do
            user = User.create(username: 'spec_test',password: '123')
            course1 = Course.create(subject: 'test1',course_type: 'test type')
            Record.create(user_id: user.id,course_id: course1.id)

            get "/api/v1/orderrecord/#{course1.id}/?user_id=#{user.id}"
            expect(response.status.to_json).to eq status.to_json

        end
    end
    context 'GET /api/v1/orderrecord/filter' do
        it 'return courses filtered by course_type' do
            user = User.create(username: 'spec_test',password: '123')
            
        end

        it 'return unexprired courses' do
        end
    end
end