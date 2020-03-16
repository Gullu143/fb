class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
     

   has_one_attached :image
   has_many :posts
   has_many :comments
   acts_as_voter
   has_friendship
   
    def not_friends
        potential = []
        User.all.each do |user|
            if(self.friends_with?(user) != true && self != user && self.friends.include?(user) != true && self.pending_friends.include?(user) != true && self.requested_friends.include?(user) != true)
                potential << user
            end
        end
        potential
    end
    
    def friend_requests?
        self.requested_friends.any?
    end
end
