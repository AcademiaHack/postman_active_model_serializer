class CreateBirthRegistries < ActiveRecord::Migration[5.0]
  def change
    create_table :birth_registries do |t|
      t.string :place
      t.date :registry_date
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
