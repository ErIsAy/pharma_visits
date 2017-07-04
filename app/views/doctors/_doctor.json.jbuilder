json.extract! doctor, :id, :firstname, :lastname, :speciality,
              :suite, :phone_ext, :email, :birthday, :category,
              :center_id, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
