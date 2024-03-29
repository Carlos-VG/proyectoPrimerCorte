# app/controllers/proveedores_controller.rb
class ProveedoresController < ApplicationController
  before_action :set_proveedor, only: [:show, :edit, :update, :destroy]

  # GET /proveedores
  def index
    @proveedores = Proveedor.all
  end

  # GET /proveedores/1
  def show
    @proveedor = Proveedor.find(params[:id])
  end

  # GET /proveedores/new
  def new
    @proveedor = Proveedor.new
  end

  # GET /proveedores/1/edit
  def edit
    @proveedor = Proveedor.find(params[:id])
  end

  # POST /proveedores
  def create
    @proveedor = Proveedor.new(proveedor_params)
    if @proveedor.save
      redirect_to @proveedor, notice: 'Proveedor fue creado con éxito.'
    else
      render :new
    end
  end

  # PATCH/PUT /proveedores/1
  def update
    if @proveedor.update(proveedor_params)
      redirect_to @proveedor, notice: 'Proveedor fue actualizado con éxito.'
    else
      render :edit
    end
  end

  # DELETE /proveedores/1
  def destroy
    @proveedor.destroy
    redirect_to proveedores_url, notice: 'Proveedor fue eliminado con éxito.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_proveedor
      @proveedor = Proveedor.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'Proveedor no encontrado.'
      redirect_to proveedores_path
    end

    # Only allow a list of trusted parameters through.
    def proveedor_params
      params.require(:proveedor).permit(:nombre)
    end
end
