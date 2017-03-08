class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
#  has_many :likers, through: :likes, source: :user
  
  validates :url, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :url, use: :slugged


end
