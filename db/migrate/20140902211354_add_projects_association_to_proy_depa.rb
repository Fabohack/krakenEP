class AddProjectsAssociationToProyDepa < ActiveRecord::Migration
  def change
  end

  def self.up
      add_column :projects, :proy_depa_id, :integer
      add_index 'projects', ['proy_depa_id'], :name => 'index_proy_depa_id' 
  end

  def self.down
      remove_column :projects, :proy_depa_id
  end
end
