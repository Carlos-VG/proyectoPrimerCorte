class Pedido < ApplicationRecord
    has_many :pedido_productos
    has_many :productos, through: :pedido_productos
end
