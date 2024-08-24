class TasksController < ApplicationController
  def index
    @tasks= Task.order(:position)
  end

  def sort
    params[:task].each_with_index do |id, index|
      Task.find(id).update(position: index + 1)
    end

    head :ok
  end
end
