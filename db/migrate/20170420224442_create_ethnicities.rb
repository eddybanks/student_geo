class CreateEthnicities < ActiveRecord::Migration[5.0]
  def change
    create_table :ethnicities do |t|
      t.string :ipeds_value

      t.timestamps
    end
  end
end
