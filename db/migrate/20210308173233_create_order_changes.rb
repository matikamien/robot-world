class CreateOrderChanges < ActiveRecord::Migration[6.1]
  def change
    create_table :order_changes do |t|
      t.integer :order_id
      t.string :car_model

      t.timestamps
    end
  end
end
