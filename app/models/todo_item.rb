class TodoItem < ApplicationRecord
  belongs_to :todo_list

  validates :content, presence: true
  validates :priority, presence: true, numericality: true, inclusion: {in: 1..3}

  def completed?
    is_completed
  end
end
