//
//  SelectField.swift
//  Socialize
//
//  Created by BigBright on 11/27/23.
//

import SwiftUI

struct SelectField: View {
    @State private var selection = "Male"
       var body: some View {
           VStack {
               Picker("Please choose your gender", selection: $selection) {
                   Text("Male").tag("Male")
                   Text("Female").tag("Female")
               }
               .pickerStyle(SegmentedPickerStyle())
           }
           .padding()
       }
}

struct SelectField_Previews: PreviewProvider {
    static var previews: some View {
        SelectField()
    }
}
