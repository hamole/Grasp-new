class AddSelectionToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :selection, :string
    add_column :notes, :block, :integer
  end
end
