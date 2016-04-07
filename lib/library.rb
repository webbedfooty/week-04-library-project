# Library.rb

# + branch name   must be present and unique
# + address       must be present and unique
# + phone number  must be present and unique

class Library < ActiveRecord::Base

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :address, presence: true, uniqueness: {case_sensitive: false}
  validates :phone, presence: true, uniqueness: true

  has_many :staff_members
  has_many :books

end
