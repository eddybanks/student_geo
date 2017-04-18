class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.integer :banner
      t.date :date_of_birth
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
