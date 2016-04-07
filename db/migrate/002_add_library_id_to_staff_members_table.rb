#002_add_library_id_to_staff_members_table.rb
class AddLibraryIdToStaffMembersTable < ActiveRecord::Migration
  def change
    add_column :staff_members, :library_id, :integer
  end
end
