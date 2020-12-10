class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
