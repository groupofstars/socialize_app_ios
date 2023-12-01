//
//  SubmitButton.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct SubmitButton: View {
    @EnvironmentObject var userData: UserData
    
    let text: String
    let submitAction: () async -> Void
    
    var body: some View {
        Button(action: {
            Task {
                await submitAction()
            }
        }) {
            Text(text)
                .font(.system(size: 18, weight: .bold))
                .padding(.vertical, 17)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
        }
        .background(Color(red: 8/255, green: 37/255, blue: 105/255))
        .cornerRadius(100)
        .frame(height: 50, alignment: .center)
        }
    
    
}
//struct SubmitButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SubmitButton()
//    }
//}
