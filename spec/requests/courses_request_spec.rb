require 'rails_helper'

RSpec.describe "Courses", type: :request do

    describe "GET #new and POST #create" do
        it "create a Course and render to the course's page" do
            get new_course_path
            expect(response).to render_template(:new)

            post courses_path, :params => {:course => {:subject => "new spec test",:price => 1, :currency => 'NTD', :course_type => "spec test type", :published =>1, :url => "#", :intro => "123123123", :exp_time => "30"}}
            expect(response).to redirect_to(assigns(:course))
            follow_redirect!
            expect(response).to render_template(:show)
        end
    end

    describe "GET #index" do
        it "assigns @courses" do
            course = Course.create(subject: 'index test',course_type: 'test type')
            get courses_path
            expect(assigns(:courses)).to eq([course])
        end
        it "render to the index page" do
            course = Course.create(subject: 'index test',course_type: 'test type')
            get courses_path
            expect(response).to render_template(:index)
        end
    end 

    describe "GET #show" do
        it "assigns @course" do
            course = Course.create(subject: 'show test',course_type: 'test type')
            get course_path(course.id)
            expect(assigns(:course)).to eq(course)
        end
        it "render to show page" do
            course = Course.create(subject: 'show test',course_type: 'test type')
            get course_path(course.id)
            expect(response).to render_template(:show)
        end
    end

    describe "GET #edit and PUT #update" do
        it "update a course and render to show page" do
            course = Course.create(subject: 'edit test',course_type: 'test type')
            get edit_course_path(course.id)
            expect(assigns(:course)).to eq(course)

            put course_path(course.id), :params => {:course => {:subject => "new spec test",:price => 1, :currency => 'NTD', :course_type => "spec test type", :published =>1, :url => "#", :intro => "123123123", :exp_time => "30"}}
            expect(response).to redirect_to(assigns(:course))
            follow_redirect!
            expect(response).to render_template(:show)

        end
    end
    describe "DELETE #destroy" do
        it "assigns @course" do
            course = Course.create(subject: 'delete test',course_type: 'test type')
            delete course_path(course.id)
            expect(assigns(:course)).to eq(course)
        end
        it "delete a record" do
            course = Course.create(subject: 'delete test',course_type: 'test type')
            expect {delete course_path(course.id)}.to change { Course.count }.by(-1)
        end
        it "redirects to courses_path" do
            course = Course.create(subject: 'delete test',course_type: 'test type')
            delete course_path(course.id)
            expect(response).to redirect_to(courses_path)
        end
    end
end
