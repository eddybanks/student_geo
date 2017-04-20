class CreateHighSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :high_schools do |t|
      t.string :name
      t.string :act_code
      t.string :street_line1
      t.string :street_line2
      t.string :street_line3
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
