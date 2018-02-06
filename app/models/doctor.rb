# No-Doc
class Doctor < ActiveRecord::Base
  validates :firstname, :lastname, presence: true
  validates :center_id, presence: true
  belongs_to :center
  belongs_to :user
  has_many :plannings, :dependent => :destroy

  def display_name
          "#{self.firstname} #{self.lastname}"
  end

  CATEGORIES = [
    ['A','A'],
    ['B','B'],
    ['C','C'],
    ['Otra','Otra']
  ]

  SPECIALTIES =
    [
      ['General/Todas', ''],
      ['CIR', 'CIR'],
      ['CIR MAX', 'CIR MAX'],
      ['CIR ONCO', 'CIR ONCO'],
      ['CIR PED', 'CIR PED'],
      ['CIR PLAST', 'CIR PLAST'],
      ['CIR PROC', 'CIR PROC'],
      ['CIR VAS', 'CIR VAS'],
      ['DERM', 'DERM'],
      ['DIABE', 'DIABE'],
      ['ENDO', 'ENDO'],
      ['FIS', 'FIS'],
      ['GASTRO', 'GASTRO'],
      ['GER', 'GER'],
      ['INTENSI', 'INTENSI'],
      ['GIN', 'GIN'],
      ['HEMA', 'HEMA'],
      ['MF', 'MF'],
      ['MG', 'MG'],
      ['MI', 'MI'],
      ['NEFRO', 'NEFRO'],
      ['NEURO', 'NEURO'],
      ['NEURO-CIR', 'NEURO-CIR'],
      ['ORTO', 'ORTO'],
      ['REUMA', 'REUMA'],
      ['URO', 'URO'],
      ['OTO', 'OTO']
    ]

end
