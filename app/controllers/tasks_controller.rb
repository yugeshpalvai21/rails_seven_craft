class TasksController < ApplicationController
  def index
    @tasks= Task.all
  end

  def sort
    params[:tasks].each_with_index do |id, index|
      Task.find(id).update(position: index + 1)
    end

    head :ok
  end
end
