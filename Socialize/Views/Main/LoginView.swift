//
//  LoginView.swift
//  Socialize
//
//  Created by BigBright on 11/27/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = ViewModel()
    @StateObject var userData = UserData()
    @State private var gotoPast: Bool = false
    @State private var gotoLogin: Bool = false
    @State private var gotoRegister: Bool = false
    @State private var gotoNext:Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            Text("Login Your Socialize")
                .font(.system(size: 25, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
                .frame(width: 324, height: 35, alignment: .top)
                .padding(.top, 2)
            Spacer()
            
            CaptionTextField(caption: "Email", text: $viewModel.email)
            ViewableSecureField(caption: "Password", text: $viewModel.password)
            Spacer()
            
            if viewModel.errorMessage != "" {
                Text(viewModel.errorMessage)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color.red)
            }
            SubmitButton(text: "Login", submitAction: { await viewModel.attemptLogin(userData: self.userData)})
            Group{
                Spacer()
                    .frame(height: 18)
                HStack(){
                    Spacer()
                    Text("Don’t have an account?")
                        .font(Font.custom("Public Sans", size: 14))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
                    Text("Register")
                        .font(Font.custom("Public Sans", size: 14))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
                        .onTapGesture {
                            // Perform action when the text is tapped
                            gotoRegister = true
                        }
                    Spacer()
                }
                Spacer()
                    .frame(height: 20)
            }
        }
        .padding(18)
        .navigationDestination(isPresented: $viewModel.authSuccessful) {
                ScanView().environmentObject(userData)
            }
        .navigationDestination(isPresented: $gotoRegister) {
                RegisterView()
            }
        }
    }


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
