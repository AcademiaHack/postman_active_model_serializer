class CreateParagraphs < ActiveRecord::Migration[5.0]
  def change
    create_table :paragraphs do |t|
      t.text :text
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
