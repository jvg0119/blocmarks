class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics, dependent: :nullify  
  has_many :bookmarks, dependent: :nullify

  enum role: { regular: 0, admin: 1 }
  #enum role: [ :regular, :admin ] 

  after_initialize { self.role ||= 'regular' }

end
