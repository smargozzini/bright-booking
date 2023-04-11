class ScheduleEventForEmployee < PowerTypes::Command.new(
  :employee_id, :start_date, :end_date, :start_time, :duration
)
  def perform
    Event.create!(
      employee: employee,
      start_date: @start_date,
      end_date: @end_date,
      start_time: @start_time,
      duration: @duration
    )
  end

  private

  def employee
    @employee ||= Employee.find_or_create_by(id: @employee_id)
  end
end
