class CreateConcreteDefects < ActiveRecord::Migration[6.1]
  def change
    create_table :concrete_defects do |t|

      t.timestamps
    end
  end
end
