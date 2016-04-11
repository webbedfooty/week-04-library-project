# Book.rb

# + title    must be present
# + author   must be present
# + ISBN     must be present and unique
# +
# + location must be present and unique
#     ...as indicated by either library_id or patron_id, showing where
#     it is and specifically who has it (which library or which patron)

class Book < ActiveRecord::Base

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true

  belongs_to :library
  belongs_to :patron

end
