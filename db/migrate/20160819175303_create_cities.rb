class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :state
      t.string :city
      t.string :country
      t.string :image

      t.timestamps
    end
  end
end
