class AddTblNumToOrder < ActiveRecord::Migration[5.2]
  def change
  add_column :orders, :tbl_num, :integer
  end
end
