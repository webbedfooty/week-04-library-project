#003_add_library_id_to_books_table.rb
class AddLibraryIdToBooksTable < ActiveRecord::Migration
  def change
    add_column :books, :library_id, :integer
  end
end
