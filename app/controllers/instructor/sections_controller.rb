class Instructor::SectionsController < ApplicationController

  def new
     @course = Course.find(params[:course_id])
     @section = Section.new
  end

  def create
    @course = Course.find(params[:course_id])
    @section = @course.sections.create(sections_params)
    redirect_to instructor_course_path(@course)
  end

  private

  def sections_params
    params.require(:section).permit(:title)
  end

end