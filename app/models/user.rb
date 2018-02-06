# No Doc
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :metric, :visit_done, :planned_visit
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable, :timeoutable
  has_many :plannings
  has_many :doctors
  has_many :centers
  has_many :drugstores
  belongs_to :division
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  attr_writer :login

  def login
    @login || username || email
  end

  def display_name
          "#{self.username}"
  end


  attr_accessor :cir, :cir_max, :cir_onco, :cir_ped, :cir_plast, :cir_proc, :cir_vas,
                :derm, :diabe, :endo, :fis, :gastro, :geria, :intensi, :gin, :hema, :mf, :mg, :mi,
                :nefro, :neuro, :neuro_cir, :orto, :reuma, :uro, :oto



  def calc_speciality
    self.cir = Doctor.where(:user_id => self.id, :speciality => "CIR").count
    self.cir_max = Doctor.where(:user_id => self.id, :speciality => "CIR MAX").count
    self.cir_onco = Doctor.where(:user_id => self.id, :speciality => "CIR ONCO").count
    self.cir_ped = Doctor.where(:user_id => self.id, :speciality => "CIR PED").count
    self.cir_plast = Doctor.where(:user_id => self.id, :speciality => "CIR PLAST").count
    self.cir_proc = Doctor.where(:user_id => self.id, :speciality => "CIR PROC").count
    self.cir_vas = Doctor.where(:user_id => self.id, :speciality => "CIR VAS").count
    self.derm = Doctor.where(:user_id => self.id, :speciality => "DERM").count
    self.diabe = Doctor.where(:user_id => self.id, :speciality => "DIABE").count
    self.endo = Doctor.where(:user_id => self.id, :speciality => "ENDO").count
    self.fis = Doctor.where(:user_id => self.id, :speciality => "FIS").count
    self.gastro = Doctor.where(:user_id => self.id, :speciality => "GASTRO").count
    self.geria = Doctor.where(:user_id => self.id, :speciality => "GER").count + Doctor.where(:user_id => self.id, :speciality => "GERIA").count
    self.intensi  = Doctor.where(:user_id => self.id, :speciality => "INTENSI").count
    self.gin = Doctor.where(:user_id => self.id, :speciality => "GIN").count
    self.hema =  Doctor.where(:user_id => self.id, :speciality => "HEMA").count
    self.mf = Doctor.where(:user_id => self.id, :speciality => "MF").count
    self.mg = Doctor.where(:user_id => self.id, :speciality => "MG").count
    self.mi = Doctor.where(:user_id => self.id, :speciality => "MI").count
    self.nefro = Doctor.where(:user_id => self.id, :speciality => "NEFRO").count
    self.neuro = Doctor.where(:user_id => self.id, :speciality => "NEURO").count
    self.neuro_cir = Doctor.where(:user_id => self.id, :speciality => "NEURO-CIR").count
    self.orto = Doctor.where(:user_id => self.id, :speciality => "ORTO").count
    self.reuma = Doctor.where(:user_id => self.id, :speciality => "REUMA").count
    self.uro = Doctor.where(:user_id => self.id, :speciality => "URO").count
    self.uro = Doctor.where(:user_id => self.id, :speciality => "OTO").count
  end


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end

  DIVISION =
    [
      ['General/Todas', ''],
      ['DISTRITO', 'DISTRITO'],
      ['ZONA ESTE', 'ZONA ESTE'],
      ['ZONA NORTE', 'ZONA NORTE'],
      ['ZONA SUR', 'ZONA SUR']
    ]

    EJE =
    [
      ['General/Todos', ''],
      ['DISTRITO', 'DISTRITO'],
      ['ESTE', 'ESTE'],
      ['NORTE', 'NORTE'],
      ['SUR', 'SUR']
    ]

end
