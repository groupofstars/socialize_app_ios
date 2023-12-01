//
//  DetailView.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack{
            MainHeader()
            HStack{
                Text("3")
                    .font(.custom("Manrope", size: 35))
                    .fontWeight(.heavy)
                    .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)

                VStack{
                    Spacer()
                        .frame(height: 5.5)
                    Text("People in the Favioute :")
                        .font(.custom("Manrope", size: 24))
                        .fontWeight(.heavy)
                        .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                }
                Spacer()
            }
            ScrollView {
                VStack{
//                    UserList(imageNames:["instagram", "facebook", "tictok", "snapchat"], avatarName: "user_1")
//                    UserList(imageNames:["instagram", "facebook", "tictok"], avatarName: "user_2")
//                    UserList(imageNames:["instagram", "facebook"], avatarName: "user_3")
//                    UserList(imageNames:["instagram", "tictok", "snapchat"], avatarName: "user_4")
//                    UserList(imageNames:["instagram"], avatarName: "user_5")
//                    UserList(imageNames:["instagram"], avatarName: "user_5")
                }
            }
            Spacer()
            
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
