class StudentsController < ApplicationController
	def index
		@student = Student.where(dojo_id: params[:id])
	end

	def show
		@student = Student.find(params[:id])
		@dojo = Dojo.find(@student.dojo_id)
		@cohort = @dojo.students.where.not(id: @student.id)
		render "showstudent"
	end

	def create
		@student = Student.create(student_params)
		if @student.valid?
			redirect_to "/dojos/#{params[:dojo_id]}"
		else
			flash[:error] = @student.errors.full_messages
			redirect_to "/dojos/#{params[:dojo_id]}/students/new"
		end
	end

	def new
		@dojo = Dojo.find(params[:dojo_id])
		render "newstudent"
	end

	def edit
		@dojo = Dojo.find(params[:id])
		@student = Student.find(params[:id])
		render "editstudent"
	end

	def update
  		@student = Student.update(params[:id],student_params)
			if @student.valid?
				redirect_to "/dojos/#{@student.dojo_id}/students/#{@student.id}"
			else
				flash[:error] = @student.errors.full_messages
				redirect_to "/dojos/#{@student.dojo_id}/students/#{@student.id}/edit"
			end
	end

	def destroy
		student = Student.find(params[:id])
		student.destroy
		redirect_to "/dojos"
	end

	private
  	def student_params
  		params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
	end
end
