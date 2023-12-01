//
//  AuthenticationService.swift
//  Socialize
//
//  Created by BigBright on 11/27/23.
//

import Foundation

fileprivate struct LoginResponse: Decodable {
    let code: Int
    let accessToken: String?
    let message: String?
//    struct Message: Decodable {
//        let email: String
//    }
//    struct Tocken: Decodable {
//        let accessToken: String
//    }
}

fileprivate struct ForgetResponse: Decodable {
    let code: Int
    let message: String
}

fileprivate struct RegisterResponse: Decodable {
    let status_code: Int
    let accessToken: String?
    let message: String?
}

fileprivate struct ForgetBodyParams: Codable {
    let email: String
    init(_ email: String) {
        self.email = email
    }
}

fileprivate struct ResetBodyParams: Codable {
    let email: String
    let password: String
    let confirmPassword: String
    let verifyCode: String
    init(_ email: String, _ password: String, _ confirmPassword: String, _ verifyCode: String) {
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.verifyCode = verifyCode
    }
}

fileprivate struct LoginBodyParams: Codable {
    let email: String
    let password: String
  
    init(_ email: String, _ password: String) {
        self.email = email
        self.password = password
    }
}


fileprivate struct RegisterBodyParams: Codable {
    let username: String
    let password: String
    let instagram: String
    let facebook: String
    let tictok: String
    let snapchat: String
    let email: String
    
    init(_ username: String, _ password: String, _ instagram: String, _ facebook: String, _ tictok: String, _ snapchat: String, _ email: String) {
        self.username = username
        self.email = email
        self.tictok = tictok
        self.snapchat = snapchat
        self.password = password
        self.instagram = instagram
        self.facebook = facebook
    }
}

class AuthenticationService {
    public func login(_ email: String, _ password: String) async throws -> String {
        let apiEndpoint = URL(string: "http://192.168.105.94:5000/api/users/login")!
        
        var request = URLRequest(url: apiEndpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let bodyParams = LoginBodyParams(email, password)

        let bodyData = try JSONEncoder().encode(bodyParams)
        
        request.httpBody = bodyData
        
        let session = URLSession.shared
        let (responseData, _) = try await session.data(for: request)
        let decoded = try JSONDecoder().decode(LoginResponse.self, from: responseData)
        if decoded.code != 200 {
            throw AuthenticationError(status_code: decoded.code, serverMessage: decoded.message!)
        }
        return decoded.accessToken!
    }
    
    public func registerAccount(_ username: String, _ password: String,_ tictok: String, _ instagram: String, _ facebook: String,_ snapchat: String , _ email: String) async throws -> String {
        // Regular expression checking should be done in the ViewModel of Register
        let apiEndpoint = URL(string: "http://192.168.105.94:5000/api/users/register")!
        
        var request = URLRequest(url: apiEndpoint)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let bodyParams = RegisterBodyParams(username, password, instagram, facebook, tictok, snapchat, email )
        print("-1", bodyParams)
        let bodyData = try JSONEncoder().encode(bodyParams)
        
        request.httpBody = bodyData
        
        let session = URLSession.shared
        
        let (responseData, _) = try await session.data(for: request)
        let decoded = try JSONDecoder().decode(RegisterResponse.self, from: responseData)
        
        if decoded.status_code != 201 {
            if decoded.message != nil {
                throw AuthenticationError(status_code: decoded.status_code, serverMessage: decoded.message!)
            }
            throw AuthenticationError(status_code: decoded.status_code, serverMessage: "Could not create account")
        }
        
        return decoded.accessToken!
    }
    
    // Errors
    public struct AuthenticationError: LocalizedError {
        public let status_code: Int?
        public var errorDescription: String?
        
        init(status_code: Int, serverMessage: String) {
            self.status_code = status_code
            self.errorDescription = serverMessage
        }
    }
    
}
