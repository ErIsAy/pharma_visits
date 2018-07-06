json.extract! doctor, :id, :firstname, :lastname, :speciality,
              :suite, :phone_ext, :email, :birthday, :category,
              :center_id, :sec_name, :sec_phone, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
