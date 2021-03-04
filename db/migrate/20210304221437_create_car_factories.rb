class CreateCarFactories < ActiveRecord::Migration[6.1]
  def change
    create_table :car_factories do |t|

      t.timestamps
    end
  end
end
