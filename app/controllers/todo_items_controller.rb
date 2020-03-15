class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:complete, :create, :incomplete]

  # PATCH  /todo_lists/:todo_list_id/todo_items/:todo_item_id/complete
  # PATCH  /todo_lists/:todo_list_id/todo_items/:todo_item_id/complete.json
  def complete
    @todo_item = @todo_list.todo_items.find(params[:todo_item_id])
    @todo_item.update_attributes(:is_completed => true)
    if @todo_item.save
      flash[:success] = "Todo list item completed."
    else
      flash[:error] = "Todo list item could not be marked complete."
    end
    redirect_to @todo_list
  end

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
    if @todo_item.destroy
      flash[:success] = "Todo list item was deleted."
    else
      flash[:error] = "Todo list item could not be deleted."
    end

    redirect_to @todo_list
  end

  # PATCH  /todo_lists/:todo_list_id/todo_items/:todo_item_id/incomplete
  # PATCH  /todo_lists/:todo_list_id/todo_items/:todo_item_id/incomplete.json
  def incomplete
    @todo_item = @todo_list.todo_items.find(params[:todo_item_id])
    @todo_item.update_attributes(:is_completed => false)
    if @todo_item.save
      flash[:success] = "Todo list item marked incomplete."
    else
      flash[:error] = "Todo list item could not be marked incomplete."
    end
    redirect_to @todo_list
  end

private
  # Use callbacks to share common setup or constraints between actions
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  # Only allow trusted parameters through.
  def todo_item_params
    params.require(:todo_item).permit(:content)
  end
end
