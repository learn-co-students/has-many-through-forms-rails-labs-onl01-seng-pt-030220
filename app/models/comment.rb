class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
 # accepts_nested_attributes_for :user


  def user_attributes=(user_attributes)

    if !user_attributes[:username].empty?
      user = User.find_or_create_by(:username => user_attributes[:username],:email => user_attributes[:email])
      user.comments << self 
    end
  end

end

