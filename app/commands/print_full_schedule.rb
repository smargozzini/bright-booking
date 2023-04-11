class PrintFullSchedule < PowerTypes::Command.new()
  def perform
    dates = Event.pluck(:start_date, :end_date).flatten.uniq.compact
    return 'No events found' if dates.empty?

    initial_date = dates.min.to_date
    final_date = dates.max.to_date
    PrintEventForRange.for(start_date: initial_date, num_days: (final_date - initial_date).to_i)
  end
end
