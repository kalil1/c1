class Meeting < ApplicationRecord
    validates :name, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validate :no_overlapping_meetings
  
    private
  
    def no_overlapping_meetings
      overlapping_meetings = Meeting.where("start_time < ? AND end_time > ?", end_time, start_time)
      if overlapping_meetings.exists?
        errors.add(:base, "This meeting overlaps with another scheduled meeting.")
      end
    end
  end
  