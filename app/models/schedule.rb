class Schedule < ActiveRecord::Base
  belongs_to :user
  has_many :rules

  validates :user_id, presence: true
end
