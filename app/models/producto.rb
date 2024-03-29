class Producto < ApplicationRecord
    has_one :product_stock, dependent: :destroy
    has_many :pedido_productos, dependent: :destroy
    has_many :pedidos, through: :pedido_productos
    has_many :proveedor_productos, dependent: :destroy
    has_many :proveedores, through: :proveedor_productos
end
