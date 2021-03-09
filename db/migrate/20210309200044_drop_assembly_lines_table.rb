class DropAssemblyLinesTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :assembly_lines
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
