class AddTypeToAssemblyLines < ActiveRecord::Migration[6.1]
  def change
    add_column :assembly_lines, :type, :string
  end
end
