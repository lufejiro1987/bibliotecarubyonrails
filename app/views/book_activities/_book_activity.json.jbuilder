json.extract! book_activity, :id, :book_id, :date, :activity, :created_at, :updated_at
json.url book_activity_url(book_activity, format: :json)
