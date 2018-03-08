class Event < ApplicationRecord
  has_and_belongs_to_many :users, join_table: "users_events"

  validates :event_name, presence: true
  validates :description, presence: true
  validates :event_date, presence: true
  validates :event_time_start, presence: true
  validates :event_time_end, presence: true
end

