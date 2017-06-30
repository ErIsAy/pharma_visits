# No-Doc
class Doctor < ActiveRecord::Base
  validates :firstname, :lastname, presence: true
  validates :center_id, presence: true
  belongs_to :center
  has_many :plannings

  SPECIALTIES =
    [
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
      ['GERIA', 'GERIA'],
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
      ['URO', 'URO']
    ]

end
