//
//  Validator.swift
//  MyPayTabs
//
//  Created by Soufian Hossam on 6/18/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

enum ValidationRule {
    case emptyField(String)
    case phoneNumber(String)
    case password(String)
    case confirmPassword(String, String)
    case email(String)
    case integer(String)
    case nonZero(String)
}

enum ValidationCount {
    static let phoneNumber = 11
    static let password = 5
}

struct Validator {
    func isValid(against rule: ValidationRule) -> Bool {
        switch rule {
        case .emptyField(let value):
            return validate(emptyField: value)
            
        case .password(let value):
            return validate(password: value)
            
        case .confirmPassword(let password, let confirmPassword):
            return validate(password: password, confirmPassword: confirmPassword)
            
        case .phoneNumber(let value):
            return validate(phoneNumber: value)
            
        case .email(let value):
            return validate(email: value)
            
        case .integer(let value):
            return validate(integer: value)
            
        case .nonZero(let value):
            return validate(nonZero: value)
        }
    }
    
    private func validate(password: String) -> Bool {
        return password.count >= ValidationCount.password
    }
    
    private func validate(password: String, confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    
    private func validate(phoneNumber: String) -> Bool {
        return phoneNumber.count == ValidationCount.phoneNumber && phoneNumber.hasPrefix("01")
    }
    
    private func validate(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    private func validate(emptyField: String) -> Bool {
        return emptyField.trimmingCharacters(in: .whitespacesAndNewlines) != ""
    }
    
    private func validate(integer: String) -> Bool {
        return Int(integer) != nil ? true : false
    }
    
    private func validate(nonZero: String) -> Bool {
        guard let number = Int(nonZero) else { return false }
        return number > 0
    }
}
