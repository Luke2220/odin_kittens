class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    
    @kitten = Kitten.new(kitten_params)

    if @kitten.save!
      redirect_to kitten_path(@kitten.id)
    else
      render new_kitten_path
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit

  end

private

def kitten_params
params.require(:kitten).permit(:id,:age,:name,:softness,:cuteness)
end

end
