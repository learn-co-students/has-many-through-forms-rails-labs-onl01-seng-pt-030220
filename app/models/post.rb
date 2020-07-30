class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      # self.categories << category
      self.post_categories.build(category: category)
    end
  end

  #from Meg's solution:
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
