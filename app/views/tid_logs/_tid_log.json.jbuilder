json.extract! tid_log, :id, :title, :body, :public, :user_id, :created_at, :updated_at
json.url tid_log_url(tid_log, format: :json)
