json.extract! doctor, :id, :firstname, :lastname, :speciality, :center_id, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
