import SwiftUI

struct DescripArticuloView: View {
    
    @State private var selectedZone = 0
    @State private var selectedStore = 0
    @State private var selectedSize = 0
    @State private var isLocationViewActive = false // Estado para controlar la navegación
    @State private var isMenuVisible = false  // Estado para mostrar el menú lateral
    
    // Variables para recibir los parámetros
    var productName: String
    var productImage: String // Se recibe el nombre de la imagen como parámetro
    
    let zones = ["Zona 1", "Zona 2", "Zona 3"]
    let stores = ["Tienda 1", "Tienda 2", "Tienda 3"]
    let sizes = ["S", "M", "L"]
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {  // Agregamos ScrollView para permitir desplazamiento
                    VStack(spacing: 20) {
                        
                        // Picker para seleccionar zona, tienda y talla
                        HStack {
                            Picker("Zona", selection: $selectedZone) {
                                ForEach(0..<zones.count) { index in
                                    Text(self.zones[index]).tag(index)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            
                            Picker("Tienda", selection: $selectedStore) {
                                ForEach(0..<stores.count) { index in
                                    Text(self.stores[index]).tag(index)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            
                            Picker("Talla", selection: $selectedSize) {
                                ForEach(0..<sizes.count) { index in
                                    Text(self.sizes[index]).tag(index)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                        }
                        .padding()
                        
                        // Nombre del producto
                        Text(productName)
                            .font(.system(size: 40, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding(.top, 20)
                        
                        // Imagen del producto
                        Image(productImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding()
                        
                        // Botón para ver ubicación
                        NavigationLink(destination: UbicacionArticulo(), isActive: $isLocationViewActive) {
                            Button(action: {
                                showLocation()
                            }) {
                                Text("Ver Ubicación")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.bottom, 20)
                        
                        Spacer()
                    }
                    .padding()  // Añadir padding general al contenido para que no quede pegado a los bordes
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
            
            // Vista del menú lateral
            if isMenuVisible {
                MenuLateral(isMenuVisible: $isMenuVisible)  // Usamos el menú lateral aquí
                    .transition(.move(edge: .trailing))  // Cambiar a .trailing para que aparezca desde la derecha
                    .zIndex(1)  // Asegurarse de que el menú esté encima del contenido
            }
        }
    }
    
    // Función para activar la navegación
    func showLocation() {
        isLocationViewActive = true
    }
}

// Vista de ubicación
struct UbicacionArticulo: View {
    var body: some View {
        Text("Aquí se mostrará la ubicación de la tienda")
            .font(.title)
            .padding()
    }
}

struct DescripArticuloView_Previews: PreviewProvider {
    static var previews: some View {
        DescripArticuloView(productName: "Producto Ejemplo", productImage: "mapa")
    }
}
