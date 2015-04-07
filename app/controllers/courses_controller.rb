class CoursesController < ApplicationController
	def index
		@courses = Course.all

		if params[:name].present?
			@courses = @courses.where("name like ?","%#{params[:name]}%")
		end	

		if params[:teacher].present?
			@courses = @courses.where("teacher like ?","%#{params[:teacher]}%")
		end	

		if params[:time].present?
			@courses = @courses.where("time like ?","%#{params[:time]}%")
		end	


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
		@course = Course.where(:name => :name_s)
	
	end

 	private

 	def course_params
 		params.require(:course).permit(:name, :teacher, :classroom, :time, :credit)
 	end

end
