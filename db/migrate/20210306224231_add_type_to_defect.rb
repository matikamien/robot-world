class AddTypeToDefect < ActiveRecord::Migration[6.1]
  def change
    add_column :defects, :type, :string
  end
end
