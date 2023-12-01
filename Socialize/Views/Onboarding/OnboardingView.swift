//
//  OnboardingView.swift
//  social_wifi
//
//  Created by BigBright on 11/19/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var gotoNext: Bool = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Image("image_arm")
                    .resizable()
                    .frame(width: 221, height: 223)
                Spacer()
                VStack (alignment: .leading){
                    HStack{
                        Text("with Socialize in one")
                            .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                            .font(.system(size: 32, weight: .bold))
                    }
                    HStack(spacing: 10) {
                        Text(" click")
                            .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                            .font(.system(size: 32, weight: .bold))
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 25, height: 16)
                            .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                    }
                    .padding(.leading, -geometry.size.width * 0.015)
                }
                Spacer()
                HStack{
                    Spacer()
                    CustomeButton(text: "Next", Button_width: 343, status: true) {
                        gotoNext = true
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationDestination(isPresented: $gotoNext) {
                       OnboardingView2()
                   }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
