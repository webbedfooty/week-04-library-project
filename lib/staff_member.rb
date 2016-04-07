# Staff_member.rb

# + name must be present
# + email must be present and unique
# + should be assigned to a library

class Staff_member < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  belongs_to :library

end
