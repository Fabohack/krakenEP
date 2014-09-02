class RemoveColumnsToProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :descripcion, :string
    remove_column :projects, :presupuesto, :integer
  end
end
