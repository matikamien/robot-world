class DropNoDefectTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :no_defects
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
