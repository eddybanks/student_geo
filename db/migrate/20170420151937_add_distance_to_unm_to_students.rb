class AddDistanceToUnmToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :distance_to_unm, :float
  end
end
