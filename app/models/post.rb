class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def commentors
   self.comments.map { |comment| comment.user }.uniq { |user| user.username }
  #  new_array = []
  #   self.comments.each do |comment|
  #     new_array << comment.user
  #   end
  #   new_array.uniq do |user|
  #       user.username
  #   end
   
  end


end
