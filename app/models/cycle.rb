class Cycle < ActiveRecord::Base
  has_many :plannings
  after_create :clean_plannings_visit




def clean_plannings_visit
  Planning.all.each do |planning|
    # restart the visited flag.
    planning.visited = false
    # calculate next day for next cycle.
    if planning.day != nil
      planning.date_visit = Chronic.parse("first monday of this #{Date::MONTHNAMES[Cycle.last.period.month]}") + planning.day.days
    end
    planning.save
  end
end


end
