//
//  ProfileView.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var gotoDetail : Bool = false
    @State private var gotoHome: Bool = false
    
    var body: some View {
        VStack(spacing: 18) {
            Spacer()
            createCard(height: 140.474, content: profileContent)
            createCard(height: 230, content: policyContent)
            createCard(height: 140.474, content: followUsContent)
            Spacer()
            HStack{
                Image("home2")
                    
                Spacer()
                
                Image("mebtn")
                    .onTapGesture{
                        gotoHome = true
                    }
            }
        }
        .navigationDestination(isPresented: $gotoDetail) {
            DetailView()
        }
        .padding(18)
    }
    
    var profileContent: some View {
        VStack(alignment: .leading){
            twoItemsRow(text: "Set Up your profile and get 5\nUnlock")
            Divider()
            twoItemsRow(text: "My Favorite Profiles")
        }
        
    }
    
    var policyContent: some View {
        VStack(alignment: .leading){
            twoItemsRow(text: "TOS and Privacy Policy")
            Spacer().frame(height:20)
            Divider()
            Spacer().frame(height:20)
            twoItemsRow(text: "Account Management")
            Spacer().frame(height:20)
            Divider()
            Spacer().frame(height:20)
            twoItemsRow(text: "Contact Developer")
        }
    }
    
    var followUsContent: some View {
        VStack(alignment: .leading){
            Text("Follow Us On:")
                .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                .font(.system(size: 20, weight: .bold))
            Spacer().frame(height:30)
            HStack{
                Image("snap3").onTapGesture { gotoDetail = true }
                Spacer()
                Image("fbook3").onTapGesture { gotoDetail = true }
                Spacer()
                Image("insta3").onTapGesture { gotoDetail = true }
                Spacer()
                Image("ttok3").onTapGesture { gotoDetail = true }
            }
        }
    }
    
    func twoItemsRow(text: String) -> some View {
        HStack{
            Text(text)
                .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                .font(.system(size: 20, weight: .bold))
            Spacer()
            Image("right").onTapGesture { gotoDetail = true }
        }
    }

    func createCard(height: CGFloat, content: some View) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(red: 210/255, green: 210/255, blue: 210/255, opacity: 0.58))
                .frame(height: height)
                .rotationEffect(.degrees(0.093))
                .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 4)
//                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
            content
                .padding(23)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
