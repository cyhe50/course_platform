class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :subject
      t.integer :price
      t.string :currency
      t.string :type
      t.boolean :published
      t.string :url
      t.text :intro
      t.integer :exp_time

      t.timestamps
    end
  end
end
