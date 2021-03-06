class CreateNoDefects < ActiveRecord::Migration[6.1]
  def change
    create_table :no_defects do |t|

      t.timestamps
    end
  end
end
