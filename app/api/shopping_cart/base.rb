module ShoppingCart
    class Base < Grape::API
        mount ShoppingCart::V1::Carts
    end
end
