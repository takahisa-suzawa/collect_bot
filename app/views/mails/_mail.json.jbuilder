json.extract! mail, :id, :title, :report_id, :created_at, :updated_at
json.url mail_url(mail, format: :json)
