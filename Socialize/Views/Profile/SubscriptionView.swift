//
//  SubscriptionView.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct SubscriptionView: View {
    var body: some View {
        VStack{
            Image("hand")
            Text("Start Using Socialize\n with Premium Benefits")
//                .font(.custom("Nunito", size: 24))
                .font(.system(size: 28, weight: .bold))
                .fontWeight(.black) // this is closest to font-weight of 900
                .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255)) // #082569
                .multilineTextAlignment(.center)
            HStack{
                
            }
            
        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}
