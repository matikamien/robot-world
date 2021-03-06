class DropConcreteDefectTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :concrete_defects
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
