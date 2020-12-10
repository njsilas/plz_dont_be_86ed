class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :drink
      t.integer :quantity
      t.integer :server_id
      t.timestamps null: false
    end
  end
end
