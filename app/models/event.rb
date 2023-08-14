class Event < ApplicationRecord
  validate :title, presence: true
  validate :description, presence: true
  validate :location, presence: true
  validate :event_datetime, presence: true
  validate :event_type, presence: true
  validate :registration_fee, presence: true
  validate :capacity, presence: true
  validate :status, presence: true
  validate :organizer_id, presence: true
end
