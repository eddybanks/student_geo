json.extract! student, :id, :banner, :date_of_birth, :address, :latitude, :longitude, :created_at, :updated_at
json.url student_url(student, format: :json)
