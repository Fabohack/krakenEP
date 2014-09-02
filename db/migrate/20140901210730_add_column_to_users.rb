class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cedula, :string
    add_column :users, :apellido, :string
  end
end
