class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.text :text
      t.references :notificable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
