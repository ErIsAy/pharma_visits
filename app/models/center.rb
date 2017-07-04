# No Doc
class Center < ActiveRecord::Base
  # validates :name, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :doctors

  CITIES =
    [ ['Todas', ''],
      ['Azua', 'Azua'],
      ['Baní', 'Baní'],
      ['Barahona', 'Barahona'],
      ['Bonao', 'Bonao'],
      ['Elías Piña', 'Elías Piña'],
      ['Dajabón', 'Dajabón'],
      ['Hato Mayor', 'Hato Mayor'],
      ['Jimaní', 'Jimaní'],
      ['La Romana', 'La Romana'],
      ['La Vega', 'La Vega'],
      ['Mao', 'Mao'],
      ['Moca', 'Moca'],
      ['Monte Plata', 'Monte Plata'],
      ['Nagua', 'Nagua'],
      ['Neiba', 'Neiba'],
      ['Pedernales', 'Pedernales'],
      ['Sabaneta', 'Sabaneta'],
      ['Salcedo', 'Salcedo'],
      ['Higüey', 'Higüey'],
      ['San Cristóbal', 'San Cristóbal'],
      ['Puerto Plata', 'Puerto Plata'],
      ['Monte Cristi', 'Monte Cristi'],
      ['Macorís', 'Macorís'],
      ['San José de Ocoa', 'San José de Ocoa'],
      ['San Juan de la Maguana', 'San Juan de la Maguana'],
      ['San Pedro de Macorís', 'San Pedro de Macorís'],
      ['Samaná', 'Samaná'],
      ['Santa Cruz del Seibo', 'Santa Cruz del Seibo'],
      ['Santiago de los Caballeros', 'Santiago de los Caballeros'],
      ['Santo Domingo', 'Santo Domingo'],
      ['Santo Domingo Este', 'Santo Domingo Este']
    ]
end
