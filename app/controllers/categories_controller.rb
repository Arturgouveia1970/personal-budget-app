class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
    @payments = @category.payments.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    if current_user.nil?
      redirect_to categories_path
      return
    end
    @category = Category.new(category_params)
    @category.author_id = current_user.id

    if @category.save
      flash[:success] = "'#{@category.name}' created successfully !!"
      redirect_to categories_path(user_id: current_user.id)
    else
      flash.now[:error] = "Couldn't create '#{@category.name} !!'"
      redirect_to new_user_category_path(current_user)
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
