class DropCarFactoriesTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :car_factories
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
