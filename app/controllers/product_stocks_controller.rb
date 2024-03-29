# app/controllers/product_stocks_controller.rb
class ProductStocksController < ApplicationController
  before_action :set_producto
  before_action :set_product_stock, only: [:show, :edit, :update]

  # GET /product_stocks/1
  def show
  end

  # GET /product_stocks/1/edit
  def edit
  end

  # PATCH/PUT /product_stocks/1
  def update
    if @product_stock.update(product_stock_params)
      redirect_to @producto, notice: 'El stock del producto fue actualizado con éxito.'
    else
      render :edit
    end
  end

  private
    # Set the product for which the stock is being managed
    def set_producto
      @producto = Producto.find(params[:producto_id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Producto no encontrado.'
      redirect_to productos_path
    end

    # Set the product's stock to be shown or edited
    def set_product_stock
      @product_stock = @producto.product_stock
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Stock del producto no encontrado.'
      redirect_to producto_path(@producto)
    end

    # Only allow a list of trusted parameters through
    def product_stock_params
      params.require(:product_stock).permit(:cantidadDisponible)
    end
end
