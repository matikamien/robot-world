class AddAssemblyLinesToCarFactory < ActiveRecord::Migration[6.1]
  def self.up
    add_column :assembly_lines, :car_factory_id, :integer
    add_index 'assembly_lines', ['car_factory_id'], :name => 'index_car_factory_id'
  end

  def self.down
    remove_column :assembly_lines, :car_factory_id
  end
end
