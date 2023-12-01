//
//  OnboardingView.swift
//  social_wifi
//
//  Created by BigBright on 11/19/23.
//

import SwiftUI

struct OnboardingView2: View {
    @State private var gotoNext: Bool = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Image("Icons")
                    .resizable()
                    .frame(width: 260, height: 200)
                Spacer()
                VStack (alignment: .leading){
                    HStack{
                        Text("Discover All the Nearby")
                            .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                            .font(.system(size: 32, weight: .bold))
                    }
                    HStack(spacing: 10) {
                        Text(" Profiles")
                            .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                            .font(.system(size: 32, weight: .bold))
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
                .padding(18)
                Spacer()
            }
        }
        .navigationDestination(isPresented: $gotoNext) {
                       OnboardingView3()
                   }
    }
}

struct OnboardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView2()
    }
}
