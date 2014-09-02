class AddColumnasToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :descripcion, :string
    add_column :projects, :presupuesto, :integer
  end
end
