# No-Doc
class Doctor < ActiveRecord::Base
  validates :firstname, :lastname, presence: true
  belongs_to :center
end
