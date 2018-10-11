class DojosController < ApplicationController
  def index
  	@dojo = Dojo.all
  	@dojocount = Dojo.all.count
  end

  def dojo
  	redirect_to "/dojos"
  end

  def create
  	@dojo = Dojo.create(dojo_params)
		if @dojo.valid?
			redirect_to "/"
		else
			flash[:error] = @dojo.errors.full_messages
			redirect_to "/dojos/new"
		end
  end

  def show
  	@dojo = Dojo.find(params[:id])
    @student = Student.where(dojo_id: params[:id])
    p @student
  	render "show"
  end

  def edit
  	@dojo = Dojo.find(params[:id])
  	render "edit"
  end

  def update
  	@dojo = Dojo.update(params[:id],dojo_params)
		if @dojo.valid?
			redirect_to "/dojos/#{@dojo.id}"
		else
			flash[:error] = @dojo.errors.full_messages
			redirect_to "/dojos/#{@dojo.id}/edit"
		end
  end

  def destroy
  	dojo = Dojo.find(params[:id])
  	dojo.destroy
  	redirect_to "/dojos"
  end

  private
  	def dojo_params
  		params.require(:dojo).permit(:branch, :street, :city, :state)
	end
end
