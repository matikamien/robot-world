class CreateDefects < ActiveRecord::Migration[6.1]
  def change
    create_table :defects do |t|

      t.timestamps
    end
  end
end
