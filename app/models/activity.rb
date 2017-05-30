class Activity < ApplicationRecord
  belongs_to :user
  has_many :jinshuju_entries
end
