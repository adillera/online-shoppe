class Admin::ProductsController < AdminController
  def index
    @products = Product.all.paginate(page: params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @image = Image.find(@product.thumbnail_id)
  end

  def new
    @product = Product.new(params[:product])
  end

  def create
    begin
      product = Product.create(permitted_product_data)

      if params.has_key?(:image)
        image = product.images.create(permitted_image_data)

        product.update_attribute(:thumbnail_id, image.id)
      end

      redirect_to action: :index
    rescue => e
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    begin
      product = Product.find(params[:id])
      product.update_attributes(permitted_product_data)

      flash[:success] = t('admin.products.actions.sucessfully_updated_the_product')
    rescue => e
      flash[:error] = t('admin.products.actions.failed_to_delete_product')
    end

    redirect_to action: :index
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
      :is_active,
      :thumbnail_id,
      :category_id
    )
  end

  def permitted_image_data
    params.require(:image).permit(
      :photo, data: {}
    )
  end
end
