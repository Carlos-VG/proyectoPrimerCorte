class Proveedor < ApplicationRecord
    has_many :proveedor_productos, dependent: :destroy
    has_many :productos, through: :proveedor_productos
end
