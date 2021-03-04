class CreateChasses < ActiveRecord::Migration[6.1]
  def change
    create_table :chasses do |t|

      t.timestamps
    end
  end
end
