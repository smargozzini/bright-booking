class PrintEventForRange < PowerTypes::Command.new(:start_date, :num_days)
  # rubocop:disable Metrics/MethodLength
  def perform
    initial_date = @start_date.to_date
    final_date = @start_date.to_date + (@num_days.days - 1.day)
    result = []
    (initial_date..final_date).each do |day|
      result << "========== #{day.strftime('%Y-%m-%d')} =========="
      Event.where(
        '(start_date <= ? AND end_date > ?) OR (start_date <= ? AND end_date is NULL)', day, day, day
      ).each do |event|
        result << event.print_event_for_day(day)
      end
    end

    puts result.join('
      ')
  end
  # rubocop:enable Metrics/MethodLength
end
