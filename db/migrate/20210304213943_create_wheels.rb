class CreateWheels < ActiveRecord::Migration[6.1]
  def change
    create_table :wheels do |t|

      t.timestamps
    end
  end
end
