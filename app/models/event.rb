class Event < ActiveRecord::Base
  belongs_to :user
  has_many   :comments, :dependent => :destroy
  has_many   :repeat, dependent: :destroy

  attr_accessible :content, :start_date, :end_date, :recurrence, :title

  validates :content, :start_date, :end_date, :recurrence, :title, presence: true
  
  after_save :dates
  before_update { self.repeat.destroy_all }

  def dates
    date = self.start_date
    duration = self.start_date..self.end_date
    
    while duration.include?(date)
      self.repeat.create(date: date)
      date = next_date(date)
    end
  end

  def next_date(date)
    case recurrence
    when 'Each day' || ""
      date.next_day
    when 'Each week'
      date.advance(days:7)
    when 'Each month'
      date.next_month
    when 'Each year'
      date.next_year
    end
  end
end
