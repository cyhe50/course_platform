class AddCourseDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :price, :integer, :default => 1
    change_column :courses, :currency, :string, :default => 'NTD'
    change_column :courses, :url, :string, :default => '/'
    change_column :courses, :exp_time,  :integer,  :default => 1
  end
end
