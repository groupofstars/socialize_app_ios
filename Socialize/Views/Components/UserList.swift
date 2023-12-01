//
//  UserList.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct UserList: View {
//    let imageNames = ["instagram", "facebook", "tictok", "snapchat"]
    @State private var gotoDetail: Bool = false
    var imageNames : Array<String>
    var avatarName : String
    var email : String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(red: 210/255, green: 210/255, blue: 210/255))
                .frame(height: 84)
                .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 4)
            HStack{
                Image(avatarName)
                    .frame(width:60)
                    .padding(.top, 18)
                    .padding([.bottom, .leading], 10)
                Spacer()
                    .frame(width:23)
                VStack(alignment: .leading){
                    Text("more details")
                        .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                        .font(.system(size: 21, weight: .bold))
                    HStack{
                        ForEach(imageNames, id: \.self) { imageName in
                                        Image(imageName)
                                    }
                    }
                }
                Spacer()
                Image("right")
                    .padding(.trailing, 10)
                    .onTapGesture {
                        gotoDetail = true
                    }
            }
        }
        .navigationDestination(isPresented: $gotoDetail) {
            TargetView(email: email)
        }
    }
   
}

//struct UserList_Previews: PreviewProvider {
//    static var previews: some View {
//        UserList(imageNames:["instagram", "facebook", "tictok", "snapchat"], avatarName: "user_1")
//    }
//}
