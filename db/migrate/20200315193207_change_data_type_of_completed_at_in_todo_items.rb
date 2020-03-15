class ChangeDataTypeOfCompletedAtInTodoItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :todo_items, :completed_at
  end
end
