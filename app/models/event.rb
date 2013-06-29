class Event < ActiveRecord::Base
  validates_presence_of :organizer_name, :title, :date, {:message => 'Missing required field.'}
  validates_uniqueness_of :title, {:message => 'Title must be unique.'}
  validates :organizer_email, :format => {:with => /.+@.+\..{2,}/, :message => 'Invalid email address.'}
  validates_uniqueness_of :organizer_email, {:message => 'Email address already exists.'}
  validate :date_check
  
  def date_check
    unless date.present? && date > Date.today
      errors.add(:date, "Date must be later than today.")
    end
  end
end
