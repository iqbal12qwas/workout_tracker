class Exercise < ActiveRecord::Base
    
    validates :duration_in_min, presence: true
    validates :duration_in_min, numericality: { only_integer: true }
    validates :workout, presence: true
    validates :workout_date, presence: true
    validates :user_id, presence: true
    belongs_to :user
    
    default_scope { where('workout_date > ?', 7.days.ago).order(workout_date: :desc) }
  
end