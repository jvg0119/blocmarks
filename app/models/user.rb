class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics, dependent: :nullify  
  has_many :bookmarks, dependent: :nullify
  has_many :likes, dependent: :destroy

  enum role: { regular: 0, admin: 1 }
  #enum role: [ :regular, :admin ] 

  after_initialize { self.role ||= 'regular' }

  def liked(bookmark)  # returns a like object if exist or nil if not exist
  	#self.likes.where(bookmark_id: bookmark.id).first
  	likes.where(bookmark_id: bookmark.id).first
  end

end
