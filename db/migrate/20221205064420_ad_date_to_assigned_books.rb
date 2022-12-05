class AdDateToAssignedBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :assigned_books, :Returned_date, :date
  end
end
