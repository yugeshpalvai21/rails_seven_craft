class TasksController < ApplicationController
  http_basic_authenticate_with name: Rails.application.credentials.dig(:staging, :basic_auth, :name),
                               password: Rails.application.credentials.dig(:staging, :basic_auth, :password) if Rails.env.staging?
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
