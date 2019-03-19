class LessonsController < ApplicationController
  # Lessons controller for non instructor views
  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
