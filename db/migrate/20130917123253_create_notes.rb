class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
      t.references :user
      t.references :article

      t.timestamps
    end
    add_index :notes, :user_id
    add_index :notes, :article_id
  end
end
