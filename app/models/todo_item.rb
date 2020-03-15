class TodoItem < ApplicationRecord
  belongs_to :todo_list

  validates :content, presence: true

  def completed?
    is_completed
  end
end
