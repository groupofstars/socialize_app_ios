//
//  RegisterView.swift
//  Socialize
//
//  Created by BigBright on 11/25/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = ViewModel()
    @StateObject var userData = UserData()
    @State private var gotoPast: Bool = false
    @State private var gotoLogin: Bool = false
    @State private var gotoNext:Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            Text("Register Your Socialize")
                .font(.system(size: 25, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
                .frame(width: 324, height: 35, alignment: .top)
                .padding(.top, 2)
            Spacer()
            if gotoNext == false {
                
                CaptionTextField(caption: "UserName", text: $viewModel.username)
                CaptionTextField(caption: "Email", text: $viewModel.email)
                CaptionTextField(caption: "Instagram Profile Link", text: $viewModel.instagram)
                CaptionTextField(caption: "Facebook Profile Link", text: $viewModel.facebook)
                Spacer()
                CustomeButton(text: "Next", Button_width: 350, status:true ){
                                       gotoNext = true
                                   }
            } else {
                CaptionTextField(caption: "TicTok Profile Link", text: $viewModel.tictok)
                CaptionTextField(caption: "SnapChat Profile Link", text: $viewModel.snapchat)
                ViewableSecureField(caption: "Password", text: $viewModel.password)
                ViewableSecureField(caption: "Confirm_Password", text: $viewModel.confirmedPassword)
                Spacer()
                CustomeButton(text: "Back", Button_width: 350, status:true ){
                                       gotoNext = false
                                   }
                SubmitButton(text: "Register", submitAction: { await viewModel.attemptCreateAccount(userData: self.userData)})
            }
            HStack(){
               Spacer()
               Text("Already have an account?")
                   .font(Font.custom("Public Sans", size: 14))
                   .multilineTextAlignment(.trailing)
                   .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
               Text("Login")
                   .font(Font.custom("Public Sans", size: 14))
                   .multilineTextAlignment(.trailing)
                   .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                   .onTapGesture {
                       // Perform action when the text is tapped
                       gotoLogin = true
                   }
               Spacer()
           }
           Spacer()
               .frame(height:25)
        }
        .navigationDestination(isPresented: $gotoLogin) {
                       LoginView()
            }
        .navigationDestination(isPresented: $viewModel.authSuccessful) {
                LoginView()
            }
        .navigationBarBackButtonHidden(true)
        .padding(18)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
