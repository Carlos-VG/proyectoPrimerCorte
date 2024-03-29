# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_29_190854) do
  create_table "pedido_productos", force: :cascade do |t|
    t.integer "pedido_id", null: false
    t.integer "producto_id", null: false
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_pedido_productos_on_pedido_id"
    t.index ["producto_id"], name: "index_pedido_productos_on_producto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "clt_nombre", limit: 100
    t.string "clt_direccion", limit: 100
    t.decimal "ped_costo"
    t.date "ped_fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_stocks", force: :cascade do |t|
    t.integer "producto_id", null: false
    t.integer "cantidadDisponible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_product_stocks_on_producto_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre", limit: 50
    t.float "precio"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proveedor_productos", force: :cascade do |t|
    t.integer "producto_id", null: false
    t.integer "proveedor_id", null: false
    t.integer "cantidad"
    t.datetime "fecha_suministro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_proveedor_productos_on_producto_id"
    t.index ["proveedor_id"], name: "index_proveedor_productos_on_proveedor_id"
  end

  create_table "proveedors", force: :cascade do |t|
    t.string "nombre", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pedido_productos", "pedidos"
  add_foreign_key "pedido_productos", "productos"
  add_foreign_key "product_stocks", "productos"
  add_foreign_key "proveedor_productos", "productos"
  add_foreign_key "proveedor_productos", "proveedors"
end
