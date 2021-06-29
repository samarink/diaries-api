class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :text, null: false
      t.references :diary

      t.timestamps
    end
  end
end
