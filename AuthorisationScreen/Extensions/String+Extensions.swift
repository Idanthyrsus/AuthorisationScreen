//
//  String+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 15.03.2023.
//

import Foundation

extension String {
    func validateEmail() -> Bool {
        let emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        return applyPredicateToRegex(regexStr: emailRegex)
    }
    
    func validatePassword(min: Int = 8, max: Int = 8) -> Bool {
        // Minimum 8 characters. At least 1 letter and 1 number
        var passRegex = ""
        if min >= max {
            passRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(min),}$"
        } else {
            passRegex =  "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(min), \(max)}$"
        }
        return applyPredicateToRegex(regexStr: passRegex)
    }
    
    func applyPredicateToRegex(regexStr: String) -> Bool {
        let trimmedstring = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedstring)
        return isValidateOtherString
    }
}
