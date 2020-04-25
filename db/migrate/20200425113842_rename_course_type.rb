class RenameCourseType < ActiveRecord::Migration[5.1]
  def change
    rename_column :courses, :type, :course_type
  end
end
