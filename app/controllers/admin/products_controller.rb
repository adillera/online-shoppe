class Admin::ProductsController < AdminController
  def index
    @products = Product.all.paginate(page: params[:page])
  end

  def show
  end

  def new
    @product = Product.new(params[:product])
  end

  def create
    begin
      product = Product.create(permitted_product_data)
      product.images.create(permitted_image_data)

      redirect_to action: :index
    rescue => e
    end
  end

  def edit
  end

  def update
  end

  def destroy
    product = Product.find(params[:id])

    if product.delete
      flash[:success] = t('admin.products.actions.successfully_deleted_product')
    else
      flash[:error] = t('admin.products.actions.failed_to_delete_product')
    end

    redirect_to action: :index
  end

  private
  def permitted_product_data
    params.require(:product).permit(
      :name,
      :description,
      :price,
      :is_active
    )
  end

  def permitted_image_data
    params.require(:image).permit(
      :photo, data: {}
    )
  end
end
