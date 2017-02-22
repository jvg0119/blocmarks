class Topic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  
end
