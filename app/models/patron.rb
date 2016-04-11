# Patron.rb

# + name  must be present
# + email must be present and unique

class Patron < ActiveRecord::Base

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  has_many :books

end
