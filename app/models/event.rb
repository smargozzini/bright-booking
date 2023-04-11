# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  start_date  :datetime         not null
#  end_date    :datetime
#  start_time  :time             not null
#  duration    :float            not null
#  recurrence  :integer          default("daily"), not null
#  employee_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Event < ApplicationRecord
  belongs_to :employee
  has_many :overrides, dependent: :destroy
  validates :start_date, :start_time, presence: true

  enum recurrence: { daily: 0 }

  # rubocop:disable Metrics/AbcSize
  def print_event_for_day(day)
    override = overrides.where(start_date: day).last
    date = day.strftime('%Y-%m-%d')
    start_time = override ? override.start_time : self.start_time
    duration = override ? override.duration : self.duration
    end_time = start_time + duration.hours
    employee = override ? override.employee_id : employee_id
    "Event #{id} | Date: #{date} | Shift time: #{start_time.strftime('%H:%M')} - #{end_time.strftime('%H:%M')} | Duration: #{duration} hrs | Employee: #{employee}"
  end
  # rubocop:enable Metrics/AbcSize
end
