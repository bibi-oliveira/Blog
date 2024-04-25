json.extract! post, :id, :title, :body, :view, :created_at, :updated_at
json.url post_url(post, format: :json)
