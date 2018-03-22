class Event < ApplicationRecord
  has_and_belongs_to_many :users
  mount_uploaders :photos, PhotoUploader

  validates :event_name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end

