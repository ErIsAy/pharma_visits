class Cycle < ActiveRecord::Base
  has_many :plannings
  after_create :clean_plannings_visit




def clean_plannings_visit
  Planning.all.each do |x|
    x.visited = false
    # byebug
    x.save
  end
end


end
