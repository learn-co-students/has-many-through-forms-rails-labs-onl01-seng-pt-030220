class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user, reject_if: :all_blank

  # def user_attributes=(attributes)
  #   attributes.values.each do |attr|
  #     user = User.find_or_create_by(attr)
  #     self.user << user
  #   end
  # end

end
