//
//  ViewableSecureField.swift
//  Socialize
//
//  Created by BigBright on 11/27/23.
//

import SwiftUI

struct ViewableSecureField: View {
    let caption: String
    @Binding var text: String

//    @State private var password: String = ""
    
    @State private var isSecure: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading){
                ZStack(alignment: .leading) {
                    if isSecure == true {
                        SecureField(
                            "",
                            text: $text
                        )
                        .foregroundColor(Color.black)
                        .overlay(alignment: .trailing) {
                            Image(systemName: isSecure == true ? "eye.slash" : "eye")
                                .onTapGesture {
                                    isSecure.toggle()
                                }.padding([.trailing], 10)
                        }
                    } else {
                        TextField(
                            "",
                            text: $text
                        )
                        .foregroundColor(Color.black)
                        .overlay(alignment: .trailing) {
                            Image(systemName: isSecure == true ? "eye.slash" : "eye")
                                .onTapGesture {
                                    isSecure.toggle()
                                }.padding([.trailing], 10)
                        }
                    }
                }
                .padding(17)
                .frame(height: 55)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color(red: 8/255, green: 37/255, blue: 105/255))
                )
                Text(caption)
                  .font(Font.custom("Poppins", size: 11))
                  .kerning(0.066)
                  .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                  .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .leading)
            }
            .frame(width: geometry.size.width)
        } // End of GeometryReader
        .frame(height: 100)
    }
}

struct ViewableSecureField_Previews: PreviewProvider {
    static var previews: some View {
        ViewableSecureField(caption: "Password", text: .constant(""))
    }
}
