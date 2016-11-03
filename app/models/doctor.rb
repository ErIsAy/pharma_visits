class Doctor < ActiveRecord::Base

  validates :firstname, :lastname, presence: true


end
