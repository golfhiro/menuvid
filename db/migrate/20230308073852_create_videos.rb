class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :video_id, null: false, unique: true
      t.string :title, null: false, unique: true
      t.string :thumbnail, null: false, unique: true

      t.timestamps
    end
  end
end
