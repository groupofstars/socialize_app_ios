//
//  InputValidator.swift
//  Socialize
//
//  Created by BigBright on 11/27/23.
//

import Foundation

class InputValidator {
    
    public func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return (emailPredicate.evaluate(with: email))
    }
    
    public func validateUsername(username: String) -> Bool {
        if username.count < 6 {
            return false
        }
        // Pound sign used to create raw strings (escape character does not escape literals"
        let regex = try! NSRegularExpression(pattern: #"^[0-9]*[a-zA-Z]([0-9a-zA-Z]|([._\-][0-9a-zA-Z]))*$"#) // Error propagation is disabled
        return validateRegex(regex: regex, string: username)
    }
    
    
    public func validatePassword(password: String) -> Bool {
        if password.count < 6 {
            return false
        }
        let regex = try! NSRegularExpression(pattern: #"^[0-9a-zA-Z!@#\$%&\*_\-;.\/\{\}\[\]~()]+$"#)
        return validateRegex(regex: regex, string: password)
    }
    
    
    public func validateLocation(location: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: #"^[a-zA-Z, ]*$"#)
        return validateRegex(regex: regex, string: location)
    }
    
    
    private func validateRegex(regex: NSRegularExpression, string: String) -> Bool {
        let strRange = NSRange(location: 0, length: string.utf8.count)
        if regex.firstMatch(in: string, options: [], range: strRange) != nil {
            return true
        }
        return false
    }
    
}
