class Producto < ApplicationRecord
    has_many :pedido_productos
    has_many :pedidos, through: :pedido_productos
    has_one :product_stock
    has_many :proveedor_productos
end
