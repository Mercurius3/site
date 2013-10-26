module EventsHelper
  def calendar_builder(events)
    build_calendar(group_events_per_month(events)) if events
  end

  def event_calendar_item(event)
    name = "<strong>#{event.product.category.name}</strong> #{l event.eventdate, format: :long}"
    if event.starttime && event.endtime
      date = " : #{l event.starttime, format: :time} - #{l event.endtime, format:	:time} "
    else
      date = " "
    end
    event = "#{link_to event.product.name, event.product}: #{event.name}"
    name + date + event
  end

  def group_events_per_month(events)
    events_per_month = []
    hash = events.group_by { |f| f.eventdate.beginning_of_month }
    hash.each { |key, value| events_per_month << value }
    events_per_month
  end

  def build_calendar(months)
    calendar = ""
    months.each do |events|
      # Add month header to calendar
      calendar << "<h2>#{t('date.month_names')[events.first.eventdate.month].capitalize}</h2>"
      # Each month has many events
      events.each do |event|
        calendar << "#{event_calendar_item(event)}<br />"
      end
      calendar << "<br />"
    end
    sanitize calendar
  end
end
