class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user, optional: true
  validates :url, presence: true
end
