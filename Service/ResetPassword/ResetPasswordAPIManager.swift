//
//  ResetPasswordAPIManager.swift
//  KFC1
//
//  Created by Mac on 4/5/2563 BE.
//  Copyright © 2563 Mac. All rights reserved.
//

import Foundation

protocol ResetPasswordAPIManager{
    func resetPassword(optionalEmail: String?)
  func  setResetPasswordAPIManagerDelegate (_ delegate: ResetPasswordAPIManagerDelegate?)
}

protocol ResetPasswordAPIManagerDelegate{
    func didResetPasswordCompletion()
    func didResetPasswordFailture(error:Error)
}

final class ResetPasswordAPIManagerImplementation: ResetPasswordAPIManager{
    
    var delegate: ResetPasswordAPIManagerDelegate?
    let apiClient: ResetPasswordAPIClient
    init (apiClient: ResetPasswordAPIClient = ResetPasswordAPIClientImplementation()){
        self.apiClient = apiClient
    }
    
    func setResetPasswordAPIManagerDelegate (_ delegate: ResetPasswordAPIManagerDelegate?){
        self.delegate = delegate
    }
    
    func resetPassword(optionalEmail: String?){
        apiClient.resetPassword(optionalEmail: optionalEmail)
        {(status,optionalError) in
             if let error = optionalError {
                      self.delegate?.didResetPasswordFailture(error: error)
                      return
                  }
            if status {
                      self.delegate?.didResetPasswordCompletion()
                  }
        }
    }
}
