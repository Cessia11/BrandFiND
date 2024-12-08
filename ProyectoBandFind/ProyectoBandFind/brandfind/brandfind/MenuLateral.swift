// MenuLateral.swift
import SwiftUI

struct MenuLateral: View {
    @Binding var isMenuVisible: Bool

    let menuItems = [
        ("Categorías", "list.bullet"),
        ("Damas", "figure.dress"),
        ("Caballeros", "figure.walk"),
        ("Niñas", "person.fill"),
        ("Niños", "person.fill"),
        ("Tiendas", "bag.fill"),
        ("Cerrar sesión", "arrowshape.turn.up.left")
    ]

    var body: some View {
        VStack {
            createHeaderView()
                .frame(height: 200)
                .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.red]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))

            List(menuItems, id: \.0) { menuItem in
                HStack {
                    Image(systemName: menuItem.1)
                        .foregroundColor(.purple)
                    Text(menuItem.0)
                }
                .onTapGesture {
                    print("\(menuItem.0) selected")
                }
            }
            .listStyle(InsetGroupedListStyle())

            Spacer()
        }
        .frame(width: 250)
        .background(Color.white)
        .edgesIgnoringSafeArea(.vertical)
        .onTapGesture {
            withAnimation {
                isMenuVisible = false  // Cerrar el menú si se toca fuera de él
            }
        }
    }

    // Encabezado del Drawer
    func createHeaderView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .background(Color.gray.opacity(0.5))
                    .clipShape(Circle())
                    .padding(.top, 40)
            }
            Text("Usuario")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 10)
            Text("usuario@correo.com")
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding(.leading, 20)
    }
}
