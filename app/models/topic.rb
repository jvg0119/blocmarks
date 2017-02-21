class Topic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true
  
end
