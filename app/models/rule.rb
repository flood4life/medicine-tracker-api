class Rule < ActiveRecord::Base
  belongs_to :schedule

  validates :schedule_id, presence: true
end
