class OutputsController < ApplicationController
  def index
    return render json: User.all
  end

  def new
    return render "new"
  end

  def edit
    @user = User.find(params[:id])
    return render "edit"
  end

  def show
    @user = User.find(params[:id])
    return render "show"
  end

  def total
    render text: "#{User.all.count}"
  end

  def create
    User.create(name: params[:name])
    return redirect_to "users"
  end

  def update
    user = User.find(params[:id])
    user.update(name: params[:name])
    return redirect_to "/users/#{user.id}"
  end
end
