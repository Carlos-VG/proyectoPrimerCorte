# app/controllers/proveedor_productos_controller.rb
class ProveedorProductosController < ApplicationController
  before_action :set_proveedor
  before_action :set_proveedor_producto, only: [:show, :edit, :update, :destroy]

  # GET /proveedor_productos
  def index
    @proveedor_productos = @proveedor.proveedor_productos.includes(:producto)
  end

  # GET /proveedor_productos/1
  def show
  end

  # GET /proveedor_productos/new
  def new
    @proveedor_producto = @proveedor.proveedor_productos.build
  end

  # GET /proveedor_productos/1/edit
  def edit
  end

  # POST /proveedor_productos
  def create
    @proveedor_producto = @proveedor.proveedor_productos.build(proveedor_producto_params)

    if @proveedor_producto.save
      redirect_to [@proveedor, @proveedor_producto], notice: 'Producto agregado al proveedor con éxito.'
    else
      render :new
    end
  end

  # PATCH/PUT /proveedor_productos/1
  def update
    if @proveedor_producto.update(proveedor_producto_params)
      redirect_to [@proveedor, @proveedor_producto], notice: 'Proveedor producto actualizado con éxito.'
    else
      render :edit
    end
  end

  # DELETE /proveedor_productos/1
  def destroy
    @proveedor_producto.destroy
    redirect_to proveedor_proveedor_productos_url(@proveedor), notice: 'Producto eliminado del proveedor con éxito.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proveedor
      @proveedor = Proveedor.find(params[:proveedor_id])
    end

    def set_proveedor_producto
      @proveedor_producto = @proveedor.proveedor_productos.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proveedor_producto_params
      params.require(:proveedor_producto).permit(:producto_id, :cantidad, :fecha_suministro)
    end
end
