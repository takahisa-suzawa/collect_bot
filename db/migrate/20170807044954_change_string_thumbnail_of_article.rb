class ChangeStringThumbnailOfArticle < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :thumbnail, :string
  end
end
