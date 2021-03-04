class AddPartsToCar < ActiveRecord::Migration[6.1]
  def self.up
    add_column :parts, :car_id, :integer
    add_index 'parts', ['car_id'], :name => 'index_car_id'
  end

  def self.down
    remove_column :parts, :car_id
  end
end
