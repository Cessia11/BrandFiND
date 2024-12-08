import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            // Fondo de degradado
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.red.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
           
            VStack {
                // Imagen arriba del botón
                Spacer()
                Image("bag")
                    .resizable()
                    .frame(width: 150, height: 150)
               
                Spacer().frame(height: 20)
               
                // Botón de Continuar con Google
                Button(action: {
                   
                }) {
                    HStack {
                        Image("google") // Asegúrate de que la imagen esté en Assets.xcassets
                            .resizable()
                            .frame(width: 24, height: 24)
                       
                        Text("Continuar con Google")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(8)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 30)
            }
            .padding(.top, 50)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
