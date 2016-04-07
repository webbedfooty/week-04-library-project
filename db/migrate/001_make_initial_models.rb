class MakeInitialModels < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :isbn, null: false
    end

    create_table :libraries do |t|
      t.string :branch_name, null: false
      t.string :phone_number, null: false
      t.string :address, null: false
    end

    create_table :staff_members do |t|
      t.string :name, null: false
      t.string :email, null: false
    end

    create_table :patrons do |t|
      t.string :name, null: false
      t.string :email, null: false
    end
  end

end
