module Base
    class API < Grape::API
        format :json
        prefix :api
        version 'v1', using: :path

        mount V1::ShoppingCart::Carts => '/shoppingcart/'
        mount V1::Auth::Authenticator => '/auth/'
    end
end
