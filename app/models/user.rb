class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable

  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :user1_games, class_name: 'Game',
           foreign_key: 'user1_id'
  has_many :user2_games, class_name: 'Game',
           foreign_key: 'user2_id'
end
