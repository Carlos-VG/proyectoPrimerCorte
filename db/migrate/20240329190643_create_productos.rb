class CreateProductos < ActiveRecord::Migration[7.1]
  def change
    create_table :productos do |t|
      t.string :nombre, limit: 50
      t.float :precio
      t.text :descripcion

      t.timestamps
    end
  end
end
