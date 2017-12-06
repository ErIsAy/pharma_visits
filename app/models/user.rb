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


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
