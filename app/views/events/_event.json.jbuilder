date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

json.id event.id
json.title "#{event.doctor.center.name} - #{event.doctor.firstname} #{event.doctor.firstname}"
json.start event.start.strftime(date_format)
json.end event.end.strftime(date_format)
# json.visited event.visited
# json.note event.note

json.color event.color unless event.color.blank?
json.allDay event.all_day_event? ? true : false

json.update_url event_path(event, method: :patch)
json.edit_url edit_event_path(event)

# json.id planning.id
# json.title planning.title
# # json.date_visit planning.date_visit
# json.start planning.date_visit
# json.end planning.date_visit

