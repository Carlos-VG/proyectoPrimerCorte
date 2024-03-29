class Proveedor < ApplicationRecord
    has_many :proveedor_productos
    has_many :productos, through: :proveedor_productos
end
