class Post < ActiveRecord::Base
  has_many :post_categories #all this does is add methods
    #what methods
    # #post_categories
    # #post_categories <<
    # #post_categories.delete
    # #post_category_ids=ids
  has_many :categories, through: :post_categories #all this does is add methods
    #what methods
    # #category_ids=ids
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments

  def categories_attributes=(categories_hashes)
    categories_hashes.each do |index, category_attributes|
      if category_attributes[:name].present? 
          #do not create a category if it doesn't have a name
          #how do I check if this post has this category already?
        category = Category.find_or_create_by(name: category_attributes[:name])
        if !self.categories.include?(category)
        #inefficient, returns all categories
        #self.categories << category if category.valid?
        self.post_categories.build(:category => category)
        end
      end
    end
  end

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
