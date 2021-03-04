class CreateLasers < ActiveRecord::Migration[6.1]
  def change
    create_table :lasers do |t|

      t.timestamps
    end
  end
end
