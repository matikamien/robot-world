class CreateEngines < ActiveRecord::Migration[6.1]
  def change
    create_table :engines do |t|

      t.timestamps
    end
  end
end
