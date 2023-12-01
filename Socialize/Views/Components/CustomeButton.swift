//
//  CustomeButton.swift
//  social_wifi
//
//  Created by BigBright on 11/19/23.
//

import SwiftUI

struct CustomeButton: View {
    var text: String
    var Button_width: CGFloat
    var status: Bool
    var clicked: (() -> Void)
    var Button_color: Color {
        return status ? Color(red: 8/255, green: 37/255, blue: 105/255) : Color.gray.opacity(0.3)
    }
    var Text_color: Color {
        return status ? Color.white : Color.gray
    }
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .font(.system(size: 18, weight: .bold))
                .padding(.vertical, 17)
                .foregroundColor(Text_color)
                .frame(maxWidth: .infinity)
        }
        .background(Button_color)
        .cornerRadius(100)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
        .frame(width: Button_width, height: 69, alignment: .center)
        .frame(height: 69, alignment: .center)
    }
}

//struct CustomeButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomeButton(text:"Next",  buttonWidth: 350, status: true)
//    }
//}
