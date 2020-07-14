class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |att| att["username"].blank?}

  def user_attributes=(user_attributes)
    if !user_attributes["username"].empty?
      user_attributes.values.each do |user_attribute|
        user = User.find_or_create_by(username: user_attribute)
        self.user = user
      end
    end
  end

  def user_id=(user_attribute)
    if !user_attribute.empty?
      user = User.find_or_create_by(user_attribute)
      self.user = user
    end
  end

end
