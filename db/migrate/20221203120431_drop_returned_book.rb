class DropReturnedBook < ActiveRecord::Migration[6.0]
  def change
    drop_table :returned_books
  end
end
