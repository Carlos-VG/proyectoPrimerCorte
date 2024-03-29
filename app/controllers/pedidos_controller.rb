class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all
  end

  def show
    @pedido = Pedido.find(params[:id])
  end

  def new
    @pedido = Pedido.new
  end

  def edit
    @pedido = Pedido.find(params[:id])
  end

  def create
    @pedido = Pedido.new(pedido_params)
    if @pedido.save
      redirect_to @pedido, notice: 'Pedido creado con éxito.'
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
    params.require(:pedido).permit(:clt_nombre, :clt_direccion, :ped_costo, :ped_fecha)
  end
end
