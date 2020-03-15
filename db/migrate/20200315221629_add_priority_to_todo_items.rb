class AddPriorityToTodoItems < ActiveRecord::Migration[6.0]
  def change
    add_column :todo_items, :priority, :integer
  end
end
