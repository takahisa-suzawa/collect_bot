class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :url
      t.text :title
      t.timestamp :postedDate
      t.text :content
      t.binary :thumbnail

      t.timestamps
    end
  end
end
