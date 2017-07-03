RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    # redirect_to main_app.root_path unless warden.user.admin == true
    redirect_to main_app.root_path unless current_user && current_user.admin?
  end
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true
  config.main_app_name = ["Gupharma", "Administración"]
  config.label_methods.unshift(:display_name)

  config.excluded_models = [Event]

  config.model 'User' do
    label "Usuario"
    label_plural "Usuarios"

    include_fields :username, :email, :admin, :password, :division_id, :created_at

    field :username do
      label "Nombre de Usuario"
    end

    field :email do
      label "Correo"
    end

    field :admin do
      label "Administrador"
    end

    field :created_at do
      label "Creado"
    end

    field :password do
      label "Contraseña"
    end

    field :division_id, :enum do
      label 'Division'
      enum do
        Division.all.collect {|p| [p.name, p.id]}
      end
    end

    # fields :created_at, :updated_at do          # adding and configuring
    #   label do
    #     "#{label} (timestamp)"
    #   end
    # end
  end

  config.model 'Center' do
    label "Centro"
    label_plural "Centros"

    include_fields :name, :address, :city, :phone

    field :name do
      label 'Nombre'
    end

    field :address do
      label 'Dirección'
    end

    field :city do
      label 'Ciudad'
    end

    field :phone do
      label 'Teléfono'
    end

  end

  config.model 'Doctor' do
    label "Doctor"
    label_plural "Doctores"

    include_fields :firstname, :lastname, :speciality, :suite, :center_id
    field :firstname do
      label 'Nombre'
    end
    field :lastname do
      label 'Apellido'
    end
    field :speciality do
      label 'Especialidad'
    end
    field :suite do
      label 'Suite'
    end
    field :center_id, :enum do
      enum do
        Center.all.collect {|p| [p.name, p.id]}
      end
    end

  end

  config.model 'Drugstore' do
    label "Farmacia"
    label_plural "Farmacias"

    include_fields :name, :phone, :address, :city, :service_person
    field :name do
      label "Farmacia"
    end
    field :phone do
      label "Teléfono"
    end
    field :address do
      label "Dirección"
    end
    field :city do
      label "Ciudad"
    end
    field :service_person do
      label "Personal"
    end
  end

  config.model 'Planning' do
    label "Plan"
    label_plural "Planes"
    include_fields :title, :date_visit, :shift, :visited, :note, :user_id
    field :title do
      label 'Título'
    end
    field :date_visit do
      label 'Fecha de Visita'
    end
    field :shift do
      label 'Hora'
    end
    field :visited do
      label 'Estado (Visitado/Pendiente)'
    end
    field :note do
      label 'Nota'
    end
    field :user_id, :enum do
      label 'Usuario'
      enum do
        User.all.collect {|p| [p.username, p.id]}
      end
    end
  end

  config.model 'Division' do
    label "División"
    label_plural "Divisiones"

    include_fields :name, :created_at
    field :name do
      label 'Nombre'
    end
    field :created_at do
      label 'Creada'
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    # pdf

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end


end
