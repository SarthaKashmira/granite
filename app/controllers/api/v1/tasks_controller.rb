# frozen_string_literal: true

class Api::V1::TasksController < ApplicationController
  before_action :load_task!, only: %i[show update]
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

  def show
    render_json({ task: @task })
  end

  def update
    @task.update!(task_params)
    render_notice(t("successfully_updated"))
  end

  private

    def load_task!
      @task = Task.find_by!(slug: params[:slug])
    end

    def task_params
      params.require(:task).permit(:title)
    end
end
