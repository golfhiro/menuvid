class CreateDishGenreTags < ActiveRecord::Migration[7.0]
  def change
    create_table :dish_genre_tags do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :genre_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
