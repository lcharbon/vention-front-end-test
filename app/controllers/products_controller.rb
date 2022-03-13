class ProductsController < ApplicationController
  before_action :set_product, only: %i[ add_to_cart remove_from_cart ]

  # GET /products
  def index
    if cookies[:cart_id]
      @cart = Cart.find_by_id cookies[:cart_id]  
    end

    if @cart.nil?
      @cart = Cart.create
      cookies[:cart_id] = @cart.id
    end

    @cart_products = @cart.products.to_a
    @products = Product.all
  end

  # POST /products
  def create
    @product = Product.new product_params

    respond_to do |format|
      if @product.save
        turbo_stream.prepend(
            "products",
            partial: "products/product",
            locals: { 
              product: @product,
              in_cart: false
            }
        )
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # POST /products/:id/add_to_cart
  def add_to_cart
    cart = Cart.find_by_id cookies[:cart_id]

    if cart.present? && @product.present?
      if cart.add_product @product
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.update(
              "product_#{@product.id}_controls",
              partial: "products/cart_controls",
              locals: { 
                product: @product,
                in_cart: true
              }
            )
          end
        end
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # POST products/:id/remove_from_cart
  def remove_from_cart
    cart = Cart.find_by_id cookies[:cart_id]

    if cart.present? && @product.present?
      if cart.remove_product @product
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.update(
              "product_#{@product.id}_controls",
              partial: "products/cart_controls",
              locals: { 
                product: @product,
                in_cart: false
              }
            )
          end
        end
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :rating, :featured_photo)
    end
end
