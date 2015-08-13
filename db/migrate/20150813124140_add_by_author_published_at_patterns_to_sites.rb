class AddByAuthorPublishedAtPatternsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :image_pattern, :string

    add_column :sites, :by_author_pattern, :string
    add_column :sites, :published_at_pattern, :string
    add_column :sites, :header_pattern, :string
    add_column :sites, :article_pattern, :string

    rename_column :sites, :featured_patterns, :featured_pattern
    rename_column :sites, :patterns, :pattern


  end
end
