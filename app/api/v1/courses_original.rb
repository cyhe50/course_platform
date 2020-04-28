module V1
    class CoursesOriginal < Grape::API

        resources :original do
            resources :courses do

                desc 'Read all'
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

                    desc 'buy a courses'
                    post do
                        # Record.create()
                    end
                end
            end
        end
    end
end