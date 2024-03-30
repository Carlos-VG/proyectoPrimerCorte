class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all
  end

  def show
    @pedido = Pedido.find(params[:id])
  end

  def new
    @pedido = Pedido.new
    @productos = Producto.all
  end

  def edit
    @pedido = Pedido.find(params[:id])
  end

  def create
    @pedido = Pedido.new(pedido_params)
    calcular_costo_total

    if @pedido.save
      redirect_to @pedido, notice: 'Pedido creado correctamente.'
    else
      render :new
    end
  end

  def update
    @pedido = Pedido.find(params[:id])
    if @pedido.update(pedido_params)
      redirect_to @pedido, notice: 'Pedido actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy
    redirect_to pedidos_url, notice: 'Pedido eliminado con éxito.'
  end

  private

  def pedido_params
    params.require(:pedido).permit(:clt_nombre, :clt_direccion, :ped_fecha, :ped_costo)
  end

  def calcular_costo_total
    total_costo = 0

    if params[:productos].present?
      params[:productos].each do |producto_id, detalles|
        producto = Producto.find(producto_id)
        cantidad = detalles[:cantidad].to_i
        total_costo += producto.precio * cantidad
      end
    end
    @pedido.ped_costo = total_costo
  end
end
