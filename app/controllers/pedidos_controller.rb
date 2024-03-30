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
    
    # Inicia la transacción
    Pedido.transaction do
      # Calcula el costo total del pedido
      total_costo = calcular_costo_total_del_pedido(params[:productos])

      # Configura el costo total
      @pedido.ped_costo = total_costo

      if @pedido.save
        # Ahora, asumiendo que tienes los ids y cantidades de los productos, crea los PedidoProducto
        params[:productos].each do |producto_id, cantidad|
          # Solo añade productos con una cantidad mayor a cero
          if cantidad.to_i > 0
            producto = Producto.find(producto_id)
            @pedido.pedido_productos.create!(producto_id: producto.id, cantidad: cantidad)
          end
        end

        redirect_to @pedido, notice: 'El pedido ha sido creado exitosamente.'
      else
        render :new
      end
    end
  rescue => e
    render :new, alert: "Hubo un problema al crear el pedido: #{e.message}"
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

  def calcular_costo_total_del_pedido(productos)
    total_costo = 0
    productos.each do |producto_id, cantidad|
      producto = Producto.find(producto_id)
      total_costo += producto.precio * cantidad.to_i
    end
    total_costo
  end
  
end
