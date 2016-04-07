#004_add_patron_id_to_books_table.rb
class AddPatronIdToBooksTable < ActiveRecord::Migration
  def change
    add_column :books, :patron_id, :integer
  end
end
