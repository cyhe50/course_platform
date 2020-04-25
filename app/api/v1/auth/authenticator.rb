module V1
    module Auth
        class Authenticator < Grape::API
            resource :auth do
                get do
                end
            end
        end
    end
end