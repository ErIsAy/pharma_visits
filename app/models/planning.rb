class Planning < ActiveRecord::Base

belongs_to :user
belongs_to :doctor
belongs_to :drugstore
belongs_to :cycle
has_many :visits, :dependent => :destroy
validates :title, presence: true
validates :day, presence: true
# validates :doctor, presence: true
# validates :shift, presence: true
# validates :date_visit, presence: true


validate :doctor_and_drugstore





  SHIFTS =
    [
      ['AM', 'AM'],
      ['PM', 'PM']

    ]

  DAYS =
  [
    ['Semana 1 - Lunes', 0],
    ['Semana 1 - Martes', 1],
    ['Semana 1 - Miercoles', 2],
    ['Semana 1 - Jueves', 3],
    ['Semana 1 - Viernes', 4],

    ['Semana 2 - Lunes', 7],
    ['Semana 2 - Martes', 8],
    ['Semana 2 - Miercoles', 9],
    ['Semana 2 - Jueves', 10],
    ['Semana 2 - Viernes', 11],

    ['Semana 3 - Lunes', 14],
    ['Semana 3 - Martes', 15],
    ['Semana 3 - Miercoles', 16],
    ['Semana 3 - Jueves', 17],
    ['Semana 3 - Viernes', 18],

    ['Semana 4 - Lunes', 21],
    ['Semana 4 - Martes', 22],
    ['Semana 4 - Miercoles', 23],
    ['Semana 4 - Jueves', 24],
    ['Semana 4 - Viernes', 25]
  ]  


  private

    def doctor_and_drugstore
      unless doctor.blank? ^ drugstore.blank?
        errors.add(:base, "Specify a charge or a payment, not both")
      end
    end


end
