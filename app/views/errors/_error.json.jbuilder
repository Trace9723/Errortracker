json.extract! error, :id, :name, :priority, :description, :person_assigned, :date_found, :created_at, :updated_at
json.url error_url(error, format: :json)
