class Division < ActiveRecord::Base
  has_many :users
  belongs_to :eje
end
