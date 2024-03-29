class Pedido < ApplicationRecord
    has_many :pedido_productos, dependent: :destroy
    has_many :productos, through: :pedido_productos
end
