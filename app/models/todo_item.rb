class TodoItem < ApplicationRecord
  belongs_to :todo_list

  def completed?
    is_completed
  end
end
