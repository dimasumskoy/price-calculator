class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas, id: false do |t|
      t.integer :area
      t.integer :price
    end
  end
end
