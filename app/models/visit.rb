class Visit < ActiveRecord::Base
  belongs_to :planning
  belongs_to :user
  validates :date_visit, presence: true
end
