//
//  LoginModel.swift
//  Socialize
//
//  Created by BigBright on 11/27/23.
//

import Foundation
import JWTDecode

func getUserIdFromAuthToken(authToken: String) -> String? {
    do {
        let jwt = try decode(jwt: authToken)
        let userId = jwt.body["id"] as? String
        return userId
    } catch {
        print("Error decoding JWT: \(error)")
        return nil
    }
}



extension LoginView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var email: String = ""
        @Published var password: String = ""
        
        @Published var authSuccessful: Bool = false
        
        @Published var errorMessage: String = ""
        
        @Published var isLoading: Bool = false
        
        
        func attemptLogin(userData: UserData) async {
            isLoading = true
            defer {
                isLoading = false
            }
            do {
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
                    let token = try await AuthenticationService().login(email, password)
                    let userData = UserData.shared
                    userData.resetUserData()
                    userData.authToken = token
                    userData.user_id = getUserIdFromAuthToken(authToken: token) ?? ""
                    userData.email = email
                    print("^#$#", userData.email)
                    authSuccessful = true
                }
               
            } catch let error {
                if type(of: error) == AuthenticationService.self.AuthenticationError.self {
                    errorMessage = error.localizedDescription
                } else {
                    print("Application error: ", error.localizedDescription)
                    errorMessage = "Connection error"
                }
                authSuccessful = false
            }
        }
    }
}

