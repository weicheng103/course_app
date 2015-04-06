class CoursesController < ApplicationController
	def index
		@courses = Course.all		
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		@course.save

		redirect_to :action => :index
	end

	def show
		@course = Course.find(params[:id])
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		@course.update(course_params)

		redirect_to :action => :index
	end	

	def destroy
		@course = Course.find(params[:id])
		@course.destroy

		redirect_to :action => :index
	end

	def search
		@course = Course.find(params[:name, :teacher, :time])
	end

 	private

 	def course_params
 		params.require(:course).permit(:name, :teacher, :classroom, :time, :credit)
 	end

end
