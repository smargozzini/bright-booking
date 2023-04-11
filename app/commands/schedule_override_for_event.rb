class ScheduleOverrideForEvent < PowerTypes::Command.new(
  :event_id, :override_type, :override_employee_id, :override_start_date,
  :new_end_date, :new_start_time, :new_duration
)
  def perform
    if @override_type == 'TODAY_FORWARD'
      if @override_start_date && @new_end_date
        override_each_day(@override_start_date, @new_end_date)
      else
        end_event_and_create_new_one
      end
    elsif @override_type == 'TODAY_ONLY'
      create_override_for_day(@override_start_date)
    end
  end

  private

  def end_event_and_create_new_one
    event = Event.find(@event_id)
    ActiveRecord::Base.transaction do
      ScheduleEventForEmployee.for(
        employee_id: @override_employee_id || event.employee_id, start_date: @override_start_date || event.start_date,
        end_date: @new_end_date || event.end_date, start_time: @new_start_time || event.start_time,
        duration: @new_duration || event.duration
      )
      event.update!(end_date: @override_start_date)
    end
  end

  def override_each_day(start_date, end_date)
    ((start_date.to_date)..(end_date.to_date)).each do |day|
      create_override_for_day(day)
    end
  end

  def create_override_for_day(day)
    event = Event.find(@event_id)
    Override.create!(
      event: event,
      employee: Employee.find_or_create_by(id: @override_employee_id),
      start_date: day,
      start_time: @new_start_time || event.start_time,
      duration: @new_duration || event.duration
    )
  end
end
