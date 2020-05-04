//
//  ResetPasswordAPIClient.swift
//  KFC1
//
//  Created by Mac on 4/5/2563 BE.
//  Copyright © 2563 Mac. All rights reserved.
//

import Foundation

protocol ResetPasswordAPIClient {
    func resetPassword (optionalEmail:String?, completion: @escaping(_ status: Bool, _ error:Error?) -> () )
}

final class ResetPasswordAPIClientImplementation: ResetPasswordAPIClient {
    func resetPassword(optionalEmail: String?, completion: @escaping (Bool, Error?) -> ()) {
               guard let email = optionalEmail, email.count != 0 else {
             completion(false, GeneralError.EmailInvalid)
             return
    }
     completion(true,nil)
        
    func resetPassword (optionalEmail:String?, completion: @escaping(_ user:User?, _ error:Error?) -> () ){
         let userFiltered = users.filter{$0.email == email }
              guard let currentUser = userFiltered.first else {
                  completion(nil, GeneralError.EmailNotfound)
                  return
              }
              completion(currentUser,nil)
        }
    }
}
