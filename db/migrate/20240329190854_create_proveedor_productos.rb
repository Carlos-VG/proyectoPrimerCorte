class CreateProveedorProductos < ActiveRecord::Migration[7.1]
  def change
    create_table :proveedor_productos do |t|
      t.references :producto, null: false, foreign_key: true
      t.references :proveedor, null: false, foreign_key: true
      t.integer :cantidad
      t.datetime :fecha_suministro

      t.timestamps
    end
  end
end
