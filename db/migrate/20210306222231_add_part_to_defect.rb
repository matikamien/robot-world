class AddPartToDefect < ActiveRecord::Migration[6.1]
  def change
    add_reference :defects, :part, index: true
  end
end
