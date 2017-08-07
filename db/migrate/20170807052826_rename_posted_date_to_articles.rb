class RenamePostedDateToArticles < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :postedDate, :post_date
  end
end
