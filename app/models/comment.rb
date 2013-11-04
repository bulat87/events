class Comment < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  attr_accessible :body
  validates :user_id, :event_id, :body, presence: true
end
