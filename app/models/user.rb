class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #:authentication_keys => [:username]

  # validates :name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
  # validates :profile, presence: true, length: { maximum: 50 }
  # validates_uniqueness_of :name
  # validates_presence_of :name



  has_many :books, dependent: :destroy
  attachment :profile_image
end
