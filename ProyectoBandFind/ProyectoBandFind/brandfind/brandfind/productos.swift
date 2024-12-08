import SwiftUI

// Pantalla de inicio de sesión
struct LoginScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Fondo con degradado
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.red.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
               
                VStack {
                    Spacer()
                   
                    // Botón para ver productos
                    NavigationLink(destination: ProductGridScreen()) {
                        Text("Ver Productos")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .padding(.horizontal, 16)
                    }
                   
                    Spacer()
                }
            }
            .navigationBarTitle("Inicio de Sesión", displayMode: .inline)
        }
    }
}

// Pantalla de productos
struct ProductGridScreen: View {
    @State private var searchQuery: String = ""
    @State private var isMenuVisible: Bool = false  // Estado para mostrar/ocultar el menú lateral
    
    let products: [Product] = [
        Product(name: "Falda negra", image: "falda"),
        Product(name: "Camisa manga larga", image: "product2"),
        Product(name: "Zapatos de vestir", image: "product3"),
        Product(name: "Sombrero playero", image: "product4")
    ]
   
    var filteredProducts: [Product] {
        if searchQuery.isEmpty {
            return products
        } else {
            return products.filter { $0.name.lowercased().contains(searchQuery.lowercased()) }
        }
    }
   
    var body: some View {
        ZStack {
            // Fondo blanco
            Color.white.edgesIgnoringSafeArea(.all)
            
            // Vista del menú lateral
            if isMenuVisible {
                MenuLateral(isMenuVisible: $isMenuVisible)  // Usamos el menú lateral aquí
                    .transition(.move(edge: .trailing))  // Cambiar a .trailing para que aparezca desde la derecha
                    .zIndex(1)  // Asegurarse de que el menú esté encima del contenido
            }
            
            VStack {
                // Barra de búsqueda
                TextField("Buscar productos...", text: $searchQuery)
                    .padding(12)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(45)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
               
                // Grid de productos
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(filteredProducts) { product in
                            ProductCard(product: product)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                }
            }
        }
        .navigationBarTitle("BRANDFIND", displayMode: .inline)
        .navigationBarItems(
            leading: Image("bag").resizable().frame(width: 30, height: 30),
            trailing: Button(action: {
                withAnimation {
                    isMenuVisible.toggle()  // Cambiar la visibilidad del menú lateral
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
            }
        )
    }
}

// Modelo de Producto
struct Product: Identifiable {
    let id = UUID() // Proporciona un identificador único para cada producto
    var name: String
    var image: String
}

// Vista para mostrar cada producto
struct ProductCard: View {
    let product: Product
   
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
           
            Text(product.name)
                .font(.headline)
                .padding(.top, 8)
               
            NavigationLink(destination: DescripArticuloView(productName: product.name, productImage: product.image)) {
                Text("Más Detalles")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(15)
                    .padding(.horizontal, 8)
            }
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 4)
    }
}

// Vista de detalle del producto
struct DescripArticulo: View {
    let productName: String
    let productImage: String
    
    var body: some View {
        VStack {
            Image(productImage)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
            
            Text(productName)
                .font(.largeTitle)
                .padding(.top, 16)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Detalles", displayMode: .inline)
    }
}
