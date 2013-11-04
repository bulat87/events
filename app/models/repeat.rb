class Repeat < ActiveRecord::Base
  attr_accessible :date, :event_id

  belongs_to :event

  validates :event_id, :date, presence: true
end
