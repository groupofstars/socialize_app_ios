//
//  CaptionTextField.swift
//  Socialize
//
//  Created by BigBright on 11/25/23.
//

import SwiftUI

struct CaptionTextField: View {
    let caption: String
    @Binding var text: String
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack(alignment: .leading){
                    ZStack(alignment: .leading) {
                        TextField(
                            "",
                            text: $text
                        )
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                        
                    }
                    .padding(17)
                    .frame(height: 55)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color(red: 8/255, green: 37/255, blue: 105/255))
                    )
                    Text(caption)
                        .font(.system(size: 11))
                        .kerning(0.066)
                        .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                        .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .leading)

                }
            }
//            .frame(width: geometry.size.width * 0.8)
                // Align center
        } // End of Geometry Reader
        .frame(height: 80)
    }
}

struct CaptionTextField_Previews: PreviewProvider {
    static var previews: some View {
        CaptionTextField(caption: "Username", text: .constant(""))
    }
}
