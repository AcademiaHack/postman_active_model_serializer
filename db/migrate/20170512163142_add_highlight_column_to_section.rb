class AddHighlightColumnToSection < ActiveRecord::Migration[5.0]
  def change
    add_column(:sections, :highlight, :boolean, default: :false)
  end
end
