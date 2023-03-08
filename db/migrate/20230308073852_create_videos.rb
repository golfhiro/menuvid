class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :video_id, null: false
      t.string :title, null: false
      t.string :thumbnail, null: false

      t.timestamps
    end
  end
end
