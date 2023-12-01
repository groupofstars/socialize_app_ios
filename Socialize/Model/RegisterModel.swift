//
//  RegisterModel.swift
//  Socialize
//
//  Created by BigBright on 11/27/23.
//

import Foundation

extension RegisterView {
    @MainActor class ViewModel: ObservableObject {
        // Input variables
        @Published var username: String = ""
        @Published var instagram: String = ""
        @Published var facebook: String = ""
        @Published var snapchat: String = ""
        @Published var tictok: String = ""
        
        @Published var password: String = ""
        @Published var confirmedPassword: String = ""
        
        @Published var email: String = ""
        @Published var phone: String = ""
        
        @Published var authSuccessful: Bool = false
        
        @Published var location: String = ""
        
        @Published var isLoading: Bool = false
        
        @Published var errorMessage: String = ""
        
        func attemptCreateAccount(userData: UserData) async {
            print("##$#$")
            if password != confirmedPassword {
                errorMessage = "Passwords do not match"
                return
            }
            // Do regular expression checking
            let validator = InputValidator()
           
//            if validator.validateUsername(username: username) == false {
//                errorMessage = "Invalid username. Username must be at least 6 characters and can only contain alphanumeric characters and at least one alphabet character"
//                return
//            }
            
            if validator.validateEmail(email: email) == false {
                errorMessage = "Invalid Email. Allowed: www@ww.com"
                return
            }
            
//            if validator.validatePassword(password: password) == false {
//                errorMessage = "Invalid password. Password must be at least 6 characters. Only symbols allowed: !,@,#,$,%,^,&,*,(,),{,},<,>,.,;"
//            }
            
//            if location != "" {
//                if validator.validateLocation(location: location) == false {
//                    errorMessage = "Invalid location entered"
//                }
//            }
            print("##$#$3434")
            do {
                print("##$#$444555")
                isLoading = true
                defer {
                    isLoading = false
                }
                if email.isEmpty && !password.isEmpty {
                    errorMessage = "Email field is required"
                    return
                } else if !email.isEmpty && password.isEmpty {
                    errorMessage = "Password field is required"
                    return
                } else if email.isEmpty && password.isEmpty {
                    errorMessage = "Neither email nor password received"
                    return
                } else {
                    let authToken = try await AuthenticationService().registerAccount(username, password, tictok, instagram, facebook, snapchat, email)
                    let userData = UserData.shared
                    userData.resetUserData()
                    userData.authToken = authToken
                    authSuccessful = true
                }
            } catch let error {
                print(error.localizedDescription)
                if type(of: error) == AuthenticationService.self.AuthenticationError.self {
                    print("API Call Error")
                    errorMessage = error.localizedDescription
                } else {
                    print("SwiftUI Error")
                    errorMessage = "The application encountered an error"
                }
            }
        }
        
    }
}
