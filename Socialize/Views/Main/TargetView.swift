//
//  TargetView.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct TargetView: View {
    
    @Environment(\.openURL) var openURL
    var email : String
    var userData = UserData.shared.users
    
    var body: some View {
        VStack{
            MainHeader()
            Image("avatar")
//                .frame(width:170, height: 170)
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 238/255, green: 238/255, blue: 238/255)) // #EEE
                        .frame(width: 185, height: 43)
                        .rotationEffect(.degrees(0.093))
                        if let user = userData.first(where: { $0.email == email }) {
                            Text(user.username) // Assuming 'username' is a property of the user
                        } else {
                            Text("User_name") // Fallback text if no matching user is found
                        }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 238/255, green: 238/255, blue: 238/255)) // #EEE
                        .frame(width: 67, height: 43)
                        .rotationEffect(.degrees(0.093))
                    Image("lock")
                }
            }
            Spacer()
                .frame(height:28)
            ScrollView {
                VStack{
                    
                    if let user = userData.first(where: { $0.email == email }) {
                                // Check if the Instagram property is not empty and display the button if it's not
                                if !user.instagram.isEmpty {
                                    Button(action: {
                                        // Attempt to create a URL from the Instagram string
                                        if let url = URL(string: user.instagram) {
                                            openURL(url)
                                        }
                                    }) {
                                        Image("insta")
                                            .frame(width:30)
                                        Text("INSTGRAM")
                                            .frame(width:180, height: 43)
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold))
                                        Image("w_right")
                                            .frame(width:30)
                                        
                                    }
                                    .frame(width: 352, height: 70)
                                    .background(
                                        LinearGradient(gradient: Gradient(colors: [.white, Color.white.opacity(0.96), Color.white.opacity(0)]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                        .overlay(
                                            RadialGradient(gradient: Gradient(colors: [Color(hex: "#FF1B90"),
                                                                                       Color(hex: "#F80261"),
                                                                                       Color(hex: "#ED00C0"),
                                                                                       Color(hex: "#C500E9"),
                                                                                       Color(hex: "#7017FF"),
                                                                                       Color(hex: "#7017FF")]),
                                                           center: .bottomTrailing, startRadius: 0, endRadius: 500)
                                        )
                                    )
                                    .cornerRadius(11)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 11)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 4, y: 4)
                                    // Add any modifiers for the button here if needed
                                }
                            }
                    if let user = userData.first(where: { $0.email == email }) {
                        // Check if the Instagram property is not empty and display the button if it's not
                        if !user.snapchat.isEmpty {
                            Button(action: {
                                // Attempt to create a URL from the Instagram string
                                if let url = URL(string: user.snapchat) {
                                    openURL(url)
                                }
                            }) {
                                Image("snapchat")
                                    .frame(width:30)
                                Text("SNAPCHAT")
                                    .frame(width:180, height: 43)
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .bold))
                                Image("w_right")
                                    .frame(width:30)
                                
                            }
                            .frame(width: 352, height: 70)
                            .background(
                                Color(hex: "#FFFC00")
                            )
                            .cornerRadius(11)
                            .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 4, y: 4)
                        }
                    }
                    
                    
                    if let user = userData.first(where: { $0.email == email }) {
                        // Check if the Instagram property is not empty and display the button if it's not
                        if !user.tictok.isEmpty {
                            Button(action: {
                                // Attempt to create a URL from the Instagram string
                                if let url = URL(string: user.tictok) {
                                    openURL(url)
                                }
                            }) {
                                Image("ttok")
                                    .frame(width:30)
                                Text("TIKTOK")
                                    .frame(width:180, height: 43)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                                Image("w_right")
                                    .frame(width:30)
                                
                            }
                            .frame(width: 352, height: 70)
                            .background(
                                Color(hex: "#000")
                            )
                            .cornerRadius(11)
                            .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 4, y: 4)
                        }
                    }
                    
                    if let user = userData.first(where: { $0.email == email }) {
                        // Check if the Instagram property is not empty and display the button if it's not
                        if !user.facebook.isEmpty {
                            Button(action: {}) {
                                Image("fbook")
                                    .frame(width:30)
                                Text("FACEBOOK")
                                    .frame(width:180, height: 43)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .bold))
                                Image("w_right")
                                    .frame(width:30)
                                
                            }
                            .frame(width: 352, height: 70)
                            .background(
                                Color(hex: "#1877F2")
                            )
                            .cornerRadius(11)
                            .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 4, y: 4)
                        }
                    }
                    
//                    Button(action: {}) {
//                        Image("telegram")
//                            .frame(width:30)
//                        Text("TELEGRAM")
//                            .frame(width:180, height: 43)
//                            .foregroundColor(.white)
//                            .font(.system(size: 20, weight: .bold))
//                        Image("w_right")
//                            .frame(width:30)
//
//                    }
//                    .frame(width: 352, height: 70)
//                    .background(
//                        Color(hex: "#26A4E3")
//                    )
//                    .cornerRadius(11)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 11)
//                            .stroke(Color.black, lineWidth: 1)
//                    )
//                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 4, y: 4)
                }
            }
            
        }
        .padding()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

//struct TargetView_Previews: PreviewProvider {
//    static var previews: some View {
//        TargetView()
//    }
//}
