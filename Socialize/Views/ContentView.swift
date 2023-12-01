//
//  ContentView.swift
//  Socialize
//
//  Created by BigBright on 11/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack (path: $path) {
            NavigationLink(destination: OnboardingView()) {
                VStack {
                    Image("ios_marketing")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
