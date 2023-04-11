# == Schema Information
#
# Table name: overrides
#
#  id          :bigint           not null, primary key
#  event_id    :bigint           not null
#  employee_id :bigint           not null
#  start_date  :datetime         not null
#  start_time  :time             not null
#  duration    :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Override < ApplicationRecord
  belongs_to :event
  belongs_to :employee
  validates :start_date, :start_time, :duration, presence: true
end
