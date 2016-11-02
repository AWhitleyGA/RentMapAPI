class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :state
      t.string :zip
      t.integer :rent
      t.timestamps
    end
  end
end
