class AddAssemblyStageToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :assembly_stage, :integer
  end
end
