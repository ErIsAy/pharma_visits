class Cycle < ActiveRecord::Base
  require 'open-uri'
  has_many :plannings
  # before_create :save_metrics
  # before_destroy :delete_report
  after_create :clean_plannings_visit


# def delete_report
#   @cycle_id = Cycle.last.id
#   @report_id = MetricUpload.where(name: "#{Cycle.last.name}_#{Cycle.last.id}").first.id
#   MetricUpload.find(@report_id).destroy!
# end

def save_metrics

  MetricUpload.create(name: "#{Cycle.last.name}",
                      attachment: FileIO.new(open("https://gupharma.herokuapp.com/report/visits.pdf?cycle_id=#{Cycle.last.id}", {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read, "#{Cycle.last.name}_#{Cycle.last.id}.pdf"))
  
end

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

class FileIO < StringIO
  def initialize(stream, filename)
    super(stream)
    @original_filename = filename
  end

  attr_reader :original_filename
end
