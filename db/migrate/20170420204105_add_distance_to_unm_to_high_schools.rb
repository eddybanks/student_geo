class AddDistanceToUnmToHighSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :high_schools, :distance_to_unm, :float
  end
end
