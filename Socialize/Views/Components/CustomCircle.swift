//
//  CustomCircle.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct CustomCircle: View {
    var width: CGFloat
    var height: CGFloat
    var overlayColor: Color
  
    var body: some View {
        Circle()
            .fill(Color.white)
            .overlay(Circle().stroke(overlayColor, lineWidth: 0.8))
            .frame(width: width, height: height)
    }
}

