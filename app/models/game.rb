class Game < ApplicationRecord
  has_many :moves
  belongs_to :user1 ,class_name: 'User'
  belongs_to :user2 ,class_name: 'User'

  def the_winner
    case winner
    when 0
      nil
    when 1
      user1
    when 2
      user2
    end
  end

  def set_winner(user)
    if(user == user1)
      self.update(winner: 1)
    end
  end
end
