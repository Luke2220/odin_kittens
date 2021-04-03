class KittensController < ApplicationController

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json{render :json => @kittens}
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    
    @kitten = Kitten.new(kitten_params)

    if @kitten.save!
      redirect_to kitten_path(@kitten.id)
      flash[:notice] = "Kitten successfully created"
    else
      flash.now[:alert] = "Could not create kitten"
      render new_kitten_path
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json{render :json => @kitten}
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update!(kitten_params)
      flash[:notice] = "Kitten successfully updated"
      redirect_to kitten_path(@kitten.id)
    else
      flash.now[:alert] = "Kitten could not be updated"
      render edit_kitten_path(@kitten.id)
    end
  end
    def destroy
      @kitten = Kitten.find(params[:id])

      if @kitten.destroy!
        flash[:notice] = "Kitten destroyed"
        redirect_to kittens_path
      else
        flash.now[:alert] = "Kitten could not be destroyed"
        redirect_to kitten_path(@kitten.id)
      end
    end

  end

private

def kitten_params
params.require(:kitten).permit(:id,:age,:name,:softness,:cuteness)
end


