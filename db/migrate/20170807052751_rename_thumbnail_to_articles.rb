class RenameThumbnailToArticles < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :thumbnail, :image
  end
end
