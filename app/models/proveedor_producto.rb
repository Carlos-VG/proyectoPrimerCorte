class ProveedorProducto < ApplicationRecord
  belongs_to :producto
  belongs_to :proveedor
end
