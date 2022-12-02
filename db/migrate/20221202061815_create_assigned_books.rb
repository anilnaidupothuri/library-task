class CreateAssignedBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :assigned_books do |t|
      t.string :Book_Name
      t.string :Student_Name
      t.references :student, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
