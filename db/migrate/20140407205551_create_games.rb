class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :guide_links
      t.string :cover_img
      t.string :platform
      t.string :year
      t.integer :site_id

      t.timestamps
    end
  end
end
