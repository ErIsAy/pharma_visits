json.array! @events do |event|
  # date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  date_format = '%Y-%m-%dT%H:%M:%S'
  json.id event.id
  if event.title == nil 
    json.title "Plan sin Titulo"
  else
    json.title "#{event.doctor.center.name} - #{event.doctor.firstname} #{event.doctor.firstname}"
  end
  json.cycle Cycle.last.period.strftime(date_format)
  # byebug
  # json.start event.date_visit.strftime(date_format) if event.date_visit != nil
  # json.end event.date_visit + 1.hours if event.date_visit != nil
  
  # fix date, find if next month is available, ie: if 31 exist in next month, move to least one.  
  valid = DateTime.new(@now.year, @period.month, event.date_visit.next_month.day, 0, 0, 0, @now.zone)
  # after = valid.next_month.to_date

  json.start DateTime.new(@now.year, @period.month, valid.day, 0, 0, 0, @now.zone)
  json.end DateTime.new(@now.year, @period.month, valid.day, 0, 0, 0, @now.zone)
  json.color event.visited? ? 'Green' : 'Orange'
  # json.start event.start.strftime(date_format)
  # json.end event.end.strftime(date_format)
  # json.visited event.visited
  # json.note event.note
  # json.color event.color unless event.color.blank?
  # json.allDay event.all_day_event? ? true : false
  # json.update_url event_path(event, method: :patch)
  # json.edit_url edit_event_path(event)
end

# json.array! @plannings do |planning|
#   # date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
#   json.id planning.id
#   json.title planning.title
#   # json.date_visit planning.date_visit
#   json.start planning.date_visit
#   json.end planning.date_visit + 1.hours if planning.date_visit != nil
#   # json.start event.start.strftime(date_format)
#   # json.end event.end.strftime(date_format)
#   # json.visited event.visited
#   # json.note event.note
#   # json.color event.color unless event.color.blank?
#   # json.allDay event.all_day_event? ? true : false
#   # json.update_url event_path(event, method: :patch)
#   # json.edit_url edit_event_path(event)
# end