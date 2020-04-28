class Course < ApplicationRecord
    has_many :records
    has_many :users, through: :records

    validates :subject,:course_type, presence: true 
    validates_numericality_of :price,:exp_time, :greater_than => 0
    
end
