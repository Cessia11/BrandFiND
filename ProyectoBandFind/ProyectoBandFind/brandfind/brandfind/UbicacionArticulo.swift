import SwiftUI

struct UbicacionArticuloView: View {
   
    var body: some View {
        NavigationView {
            VStack {
                // Título
                Text("Bershka")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.top, 100)
               
                // Dirección
                Text("P.º Gral. Escalón 3700, San Salvador")
                    .font(.system(size: 16))
                    .padding(.top, 10)
               
                // Imagen del mapa
                Image("mapa")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding(.top, 20)
            }
            .navigationBarTitle("BRANDFIND", displayMode: .inline)
            .navigationBarItems(
                leading: Image("bag").resizable().frame(width: 30, height: 30),
                trailing: Button(action: {
                    // Acción del menú
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            )
        }
    }
   
    func showMenu() {
        
        print("Menú presionado")
    }
}

// Fondo con gradiente
struct GradientBackground: View {
    var body: some View {
        GeometryReader { geometry in
            let colors: [Color] = [.purple, .red]
            LinearGradient(gradient: Gradient(colors: colors),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .frame(width: geometry.size.width, height: geometry.safeAreaInsets.top + 44)
                .edgesIgnoringSafeArea(.top)
        }
    }
}

struct UbicacionArticuloView_Previews: PreviewProvider {
    static var previews: some View {
        UbicacionArticuloView()
    }
}
