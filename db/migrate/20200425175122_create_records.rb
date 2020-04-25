class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.boolean :order_status
      t.boolean :payment_status
      t.datetime :exp_date

      t.timestamps
    end
  end
end
