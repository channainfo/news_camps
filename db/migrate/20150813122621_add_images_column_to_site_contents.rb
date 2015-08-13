class AddImagesColumnToSiteContents < ActiveRecord::Migration
  def change
    add_column :site_contents, :images, :text, array: true, default: []
  end
end
