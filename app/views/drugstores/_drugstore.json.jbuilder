json.extract! drugstore, :id, :name, :phone, 
:address, :city, :service_person, :sales_person,
:created_at, :updated_at
json.url drugstore_url(drugstore, format: :json)
