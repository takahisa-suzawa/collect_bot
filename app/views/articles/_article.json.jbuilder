json.extract! article, :id, :url, :title, :postedDate, :content, :thumbnail, :created_at, :updated_at
json.url article_url(article, format: :json)
