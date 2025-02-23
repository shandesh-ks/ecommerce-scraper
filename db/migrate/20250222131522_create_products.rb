class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :price, precision: 10, scale: 2
      t.string :size
      t.string :url
      t.json :available_offers
      t.decimal :offer_percentage, precision: 5, scale: 2
      t.decimal :rating, precision: 3, scale: 2
      t.json :specifications
      t.text :reviews
      t.integer :no_of_reviews
      t.integer :no_of_ratings
      t.datetime :last_scraped_at

      t.timestamps
    end
  end
end
