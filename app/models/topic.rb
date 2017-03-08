class Topic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  validates :slug, uniqueness: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_slug?
  	new_record?
  end

  # before_validation :generate_slug
  # before_validation :remove_slug

  # def remove_slug
  # 	self.slug = nil
  # end

  # def to_param
  # 	"#{id}-#{self.title}".parameterize
  # end
  # def to_param
  # 	slug
  # end
  
	# def generate_slug
	# 	self.slug ||= title.parameterize if title
	# end  

end
