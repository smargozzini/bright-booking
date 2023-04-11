# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Employee < ApplicationRecord
  has_many :events, dependent: :destroy

  after_create :set_name

  private

  def set_name
    update(name: "Employee #{id}")
  end
end
