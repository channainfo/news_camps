class CreateSiteContents < ActiveRecord::Migration
  def change
    create_table :site_contents do |t|
      t.string :url
      t.string :title
      t.string :description
      t.string :content
      t.string :keywords
      t.string :media
      t.string :icon

      t.timestamps null: false
    end
  end
end
