class CreateAssemblyLines < ActiveRecord::Migration[6.1]
  def change
    create_table :assembly_lines do |t|

      t.timestamps
    end
  end
end
