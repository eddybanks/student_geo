class AddColumnsToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :street_line1, :string
    add_column :students, :street_line2, :string
    add_column :students, :street_line3, :string
    add_column :students, :postal_code, :string
  end
end
