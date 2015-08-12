class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :icon
      t.string :url
      t.string :patterns
      t.string :featured_patterns
      t.integer :score
      t.string :description

      t.timestamps null: false
    end
  end
end
