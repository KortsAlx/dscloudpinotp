//
//  ContentView.swift
//  CustomFrameworkApp
//
//  Created by Brandon Alexis Martinez Cortes on 22/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfCells: Int = 5
     @State private var currentlySelectedCell = 0

     var body: some View {
         
         VStack{
             
             HStack{
                 Text("Código de seguridad")
                     .font(.title3)
                                .fontWeight(.semibold)
                                .padding(26)
                                .fixedSize()

             }
             .frame(maxWidth: .infinity, alignment: .leading)
             
             
             Image("celular")
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: 160, height: 160)
                          .clipped()
                          .padding(.bottom, 65)
                          .padding(.top, 50)
             Text("Introduce el codigó de seguridad")
                           .font(.caption)
                           .fontWeight(.semibold)
                           .fixedSize()
                           .padding(10)
             HStack {
                 
                 
                 ForEach(0 ..< self.numberOfCells) { index in
                     CharacterInputCell(currentlySelectedCell: self.$currentlySelectedCell, index: index)
                 }
             }
             .frame(maxWidth: .infinity, alignment: .leading)
             .padding([.trailing, .leading], 26)

             Text("Solicita un nuevo codigo en XX segundos")
                 .font(.caption)
                            .fontWeight(.semibold)
                            .fixedSize()
                            .padding(10)
             
             
             VStack{
                 Button(action: {
                     print("Click ")
                          }, label: {
                              Text("Validar código")
                                  .font(.title3)
                                  .fontWeight(.light)
                                  .foregroundColor(.white)
                                  .padding()
                                  .shadow(radius: 0)
                                  .padding(20)
                                  .multilineTextAlignment(.trailing)
                                  .frame(minWidth: 80, maxWidth: .infinity, minHeight: 20)
                                  .background(Color.gray.opacity(0.4))
                                  .cornerRadius(6)



                          })
                 .frame(width: 340, height: 50 ,alignment: .center)

                 Button(action: {
                     print("Click ")
                          }, label: {
                              Text("Reenviar codigo")
                                  .font(.title3)
                                  .fontWeight(.light)
                                  .foregroundColor(.white)
                                  .padding()
                                  .shadow(radius: 0)
                                  .padding(20)
                                  .multilineTextAlignment(.trailing)
                                  .frame(minWidth: 80, maxWidth: .infinity, minHeight: 20)
                                  .background(Color.gray.opacity(0.4))
                                  .cornerRadius(6)



                          })
                 .frame(width: 340, height: 50 ,alignment: .center)

                 
             }
             .padding(26)
             .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)

             
             
         }
         .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
         
     }
}



struct CharacterInputCell: View {
    @State private var textValue: String = ""
    @Binding var currentlySelectedCell: Int

    var index: Int

    var responder: Bool {
        return index == currentlySelectedCell
    }

    var body: some View {
        CustomTextField(text: $textValue, currentlySelectedCell: $currentlySelectedCell, isFirstResponder: responder)
            .frame(height: 30)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding([.trailing, .leading], 12)
            .padding([.vertical], 16)
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.05), lineWidth: 2)
                    .background(Color.gray.opacity(0.3))
            )
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct ValidationOTPView: View {
    @State var correo: String = ""
    @State var telefono: String = ""
    
    var body: some View {

        VStack{
            
            HStack{
                Text("Verificación de datos")
                    .font(.title3)
                               .fontWeight(.semibold)
                               .padding(26)
                               .fixedSize()
                
                

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Text("Verifica que los datos sean correctos, de no ser así te sugerimos actualizarlos para enviar de nuevo código de acceso.")
                .font(.subheadline)
                           .fontWeight(.semibold)
                           .padding(26)
            
                
            TextField("Correo Electronico", text: $correo)
                .padding()
                .background(Color.gray.opacity(0.05))
                .cornerRadius(5.0)
                .padding(.bottom, 5)
                .padding(.all, 20)
                .foregroundColor(.gray)
            
            
            TextField("Télefono", text : $telefono)
                .padding()
                .background(Color.gray.opacity(0.05))
                .cornerRadius(5.0)
                .padding(.bottom, 5)
                .padding(.all, 20)

            
            VStack{
                
                Button(action: {
                             print("Click ")
                         }, label: {
                             Text("Continuar")
                                 .font(.title3)
                                 .fontWeight(.light)
                                 .foregroundColor(.white)
                                 .padding()
                                 .shadow(radius: 0)
                                 .padding(20)
                                 .multilineTextAlignment(.trailing)
                                 .frame(minWidth: 80, maxWidth: .infinity, minHeight: 20)
                                 .background(Color.red.opacity(1.5))
                                 .cornerRadius(6)



                         })
                .frame(width: 340, height: 50 ,alignment: .center)
                
            }
            .padding(26)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
        
           

    }
    
}

struct ValidationOTPView_Previews: PreviewProvider {
    static var previews: some View {
        ValidationOTPView()
    }
}
