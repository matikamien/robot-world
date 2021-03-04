class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.decimal :price
      t.decimal :cost_price
      t.string :model
      t.integer :year

      t.timestamps
    end
  end
end
