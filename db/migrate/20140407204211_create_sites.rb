class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :base_url
      t.string :search_string
      t.string :logo_img
      t.string :background_img
      t.integer :user_id

      t.timestamps
    end
  end
end
