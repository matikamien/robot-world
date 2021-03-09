class AddLocationToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :location, :integer
  end
end
