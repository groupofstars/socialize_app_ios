//
//  OnboardingView.swift
//  social_wifi
//
//  Created by BigBright on 11/19/23.
//

import SwiftUI

struct OnboardingView3: View {
    @State private var gotoRegister: Bool = false
    @State private var gotoLogin: Bool = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Image("tool")
                    .resizable()
                    .frame(width:370, height: 240)
                Spacer()
                VStack (alignment: .leading, spacing: 10){
                    HStack{
                        Text("Ready to Get Started ?")
                            .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                            .font(.system(size: 32, weight: .bold))
                    }
                    .padding(18)
                        Text(" Join our community and embark on a journey\n of discovery.")
                            .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                            .font(.system(size: 16, weight: .bold))
                            .padding(18)
                }
                
                
                Spacer()
                VStack(alignment: .center){
                    Text(" By clicking “Get Started” you agreeing to the\n          Terms of Services & Privacy Policy")
                        .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                        .font(.system(size: 13))
                    HStack{
                        Spacer()
                        VStack{
                            CustomeButton(text: "Register", Button_width: 343, status: true) {
                                gotoRegister = true
                                
                            }
                            CustomeButton(text: "Login", Button_width: 343, status: true) {
                                gotoLogin = true
                                
                            }
                        }
                        Spacer()
                    }
                    .padding(18)
                }
                Spacer()
            }
        }
        .navigationDestination(isPresented: $gotoRegister) {
                       RegisterView()
                   }
        .navigationDestination(isPresented: $gotoLogin) {
                       LoginView()
                   }
    }
}

struct OnboardingView3_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView3()
    }
}
