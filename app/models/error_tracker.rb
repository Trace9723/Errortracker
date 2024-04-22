class User < ApplicationRecord
    has_many :error_trackers
end

class ErrorTracker < ApplicationRecord
    belongs_to :user

    validates :name, presence: true
    validates :priority, presence: true
end
