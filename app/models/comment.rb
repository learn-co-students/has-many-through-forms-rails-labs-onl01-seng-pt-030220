class Comment < ActiveRecord::Base
  belongs_to :user

  accepts_nested_attributes_for :user, reject_if: lambda {|attributes| attributes['username'].blank? }

  belongs_to :post

end
