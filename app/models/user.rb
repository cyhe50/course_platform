class User < ApplicationRecord
    has_many :records
    has_many :courses, through: :records

    has_secure_password
end
