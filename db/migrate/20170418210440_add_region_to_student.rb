class AddRegionToStudent < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :region, foreign_key: true
  end
end
