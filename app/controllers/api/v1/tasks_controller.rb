# frozen_string_literal: true

class Api::V1::TasksController < ApplicationController
  def index
    tasks = Task.all
    Rails.logger.debug "Tasks found: #{tasks.count}"
    render status: :ok, json: { tasks: }
  end
end
