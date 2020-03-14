class TodoItemsController < ApplicationController
  before_action :set_todo_list, only: [:create, :destroy]

  # POST /todo_lists/:todo_list_id/todo_items
  # POST /todo_lists/:todo_list_id/todo_items.json
  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    if @todo_item.save
      redirect_to @todo_list
    else
      render 'new'
    end
  end

  # DELETE /todo_lists/:todo_list_id/todo_items/1
  # DELETE /todo_lists/:todo_list_id/todo_items/1.json
  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:success] = "Todo list item was deleted."
    else
      flash[:error] = "Todo list item could not be deleted."
    end

    redirect_to @todo_list
  end

private
  # Use callbacks to share common setup or constraints between actions
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end
  # Only allow trusted parameters through.
  def todo_item_params
    params.require(:todo_item).permit(:content)
  end
end
