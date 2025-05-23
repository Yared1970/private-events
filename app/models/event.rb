class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee


  scope :past, -> { where("date < ?", Date.today) }
end
