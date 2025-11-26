class DropUsersTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
