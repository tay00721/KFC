//
//  ErrorHelper.swift
//  KFC1
//
//  Created by Mac on 2/5/2563 BE.
//  Copyright © 2563 Mac. All rights reserved.
//

import Foundation

enum GeneralError: Error{
    case EmailInvalid
    case EmailInvalidWhenRegister
    case ConfirmEmailInvalid
    case PasswordInvalid
    case PasswordInvalidWhenRegister
    case ConfirmPasswordInvalid
    case CannotFoundUser
    case NameInvalid
    case EmailNotMatching
    case PasswordNotMatching
    case EmailNotfound
}

final class ErrorHelper {
    class func errorMessage(generalError:GeneralError) -> String {
        switch generalError {
        case .EmailInvalid,.PasswordInvalid,.CannotFoundUser:
            return "Email or Password are incorrect, Please try again."
        case .ConfirmEmailInvalid:
            return "Confirm Email is incorrect, Please try again"
        case .EmailInvalidWhenRegister:
            return "Email is incorrect, Please try again."
        case .EmailNotMatching:
            return "Email and Confirm Email not matched, Plase try again"
        case .ConfirmPasswordInvalid:
            return "Confirm Password is incorrect, Please try again"
        case .PasswordInvalidWhenRegister:
            return "Password is incorret, Please try again."
        case .PasswordNotMatching:
            return "Password and Confirm Password not match, Please try again"
        case .NameInvalid:
            return "Name not found, Please try again"
        case .EmailNotfound:
            return "Email not found, Please try again"
        }
        
    }
}
