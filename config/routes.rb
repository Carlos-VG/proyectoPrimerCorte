Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Rutas para Pedidos
  resources :pedidos do
    # Rutas anidadas para PedidoProductos, para crear y eliminar desde el contexto de un Pedido
    resources :pedido_productos, only: [:create, :destroy]
  end

  # Rutas para Productos
  resources :productos do
    # Ruta singular para ProductStock, ya que cada Producto tiene un único stock asociado
    resource :product_stock, only: [:show, :edit, :update, :destroy]
  end

  # Rutas para Proveedores
  resources :proveedores do
    # Rutas anidadas para ProveedorProductos, para manejar los productos que cada Proveedor ofrece
    resources :proveedor_productos, except: [:show] # Se ajusta según las acciones necesarias
  end

  # Si necesitas acceder a ProveedorProductos directamente (no a través de Proveedores),
  # puedes definir rutas no anidadas también.
  resources :proveedor_productos, only: [:index, :show, :edit, :update]

  # Rutas para PedidoProductos no anidadas, por si necesitas acceder a ellas directamente
  resources :pedido_productos, only: [:index, :show, :edit, :update]

  # Rutas para ProductStock no anidadas, si es necesario acceder a ellas fuera del contexto de un Producto específico
  resources :product_stocks, only: [:index, :show, :new, :create, :edit, :update]

  # Defines the root path route ("/")
  root to: "home#index"
end
