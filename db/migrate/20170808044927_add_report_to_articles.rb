class AddReportToArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :report, foreign_key: true
  end
end
