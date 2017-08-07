json.extract! article, :id, :url, :title, :post_date, :content, :image, :created_at, :updated_at
json.url article_url(article, format: :json)
