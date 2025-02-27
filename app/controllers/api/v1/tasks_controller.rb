# frozen_string_literal: true

class Api::V1::TasksController < ApplicationController
  def index
    tasks = Task.all
    Rails.logger.debug "Tasks found: #{tasks.count}"
    render status: :ok, json: { tasks: }
  end

  def create
    task = Task.new(task_params)
    task.save!
    render_notice(t("successfully_created"))
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end
end
