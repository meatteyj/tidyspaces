json.extract! testimonial, :id, :content, :user_id, :created_at, :updated_at
json.url testimonial_url(testimonial, format: :json)
