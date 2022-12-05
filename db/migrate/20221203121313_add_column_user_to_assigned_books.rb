class AddColumnUserToAssignedBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :assigned_books, :user, foreign_key: true
    add_column :assigned_books, :assigned, :boolean

    add_reference :students, :user, foreign_key: true
  end
end
