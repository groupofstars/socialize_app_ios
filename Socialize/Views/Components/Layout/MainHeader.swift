//
//  MainHeader.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct MainHeader: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack{
            Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("Vector") // Replace "Vector" with your actual image asset name
                            .frame(width: 40, height: 35)
                            .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                            .background(Color(red: 8/255, green: 37/255, blue: 105/255))
                            .cornerRadius(100)
                            .foregroundColor(.white)
                    }
            
                }
            Spacer()
            Text("Subscribe") // Replace this with your custom content
                .frame(width: 91, height: 35)
                .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                .background(Color(red: 8/255, green: 37/255, blue: 105/255))
                .cornerRadius(100)
                .foregroundColor(.white)
        }
//        .padding()
    }
    


struct MainHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainHeader()
    }
}
