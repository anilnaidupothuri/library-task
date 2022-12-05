class RemoveColumnFromAssignedBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :assigned_books, :Student_Name
    remove_column :assigned_books, :Book_Name
  end
end
