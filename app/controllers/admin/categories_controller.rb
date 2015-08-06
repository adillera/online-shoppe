class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all.paginate(page: params[:page])
  end

  def show
  end

  def new
    @category = Category.new(params[:category])
  end

  def create
    begin
      Category.create(permitted_category_data)
      flash[:success] = t('admin.categories.actions.successfully_created_category')

      redirect_to action: :index
    rescue => e
      flash[:error] = t('admin.categories.actions.failed_to_create_category')
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def permitted_category_data
    params[:category].permit(
      :name
    )
  end
end
