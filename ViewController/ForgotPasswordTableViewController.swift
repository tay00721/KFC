//
//  ForgotPasswordTableViewController.swift
//  KFC1
//
//  Created by Mac on 4/5/2563 BE.
//  Copyright © 2563 Mac. All rights reserved.
//

import UIKit

class ForgotPasswordTableViewController: UITableViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    var resetPasswordAPIManager: ResetPasswordAPIManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated:true, completion:nil)
    }

    private func setupData(){
        setupResetPasswordServices()
    }
    
    private func setupResetPasswordServices(){
        resetPasswordAPIManager = ResetPasswordAPIManagerImplementation()
        resetPasswordAPIManager?.setResetPasswordAPIManagerDelegate(self)
    }
    
    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
        resetPasswordAPIManager?.resetPassword(optionalEmail: emailTextField.text)
    }
    
}

extension ForgotPasswordTableViewController: ResetPasswordAPIManagerDelegate{
    func didResetPasswordCompletion() {
           let alertController = UIAlertController(title: "Success", message: "Link has been sent", preferredStyle: .alert)
           let confirmAction = UIAlertAction(title: "Confirm", style: .default)
           { (_) in
               self.dismiss(animated: true, completion: nil)
           }
           alertController.addAction(confirmAction)
           present(alertController, animated: true, completion: nil)
   }
    func didResetPasswordFailture(error:Error) {
           let alertController = UIAlertController(title: "Warning", message: ErrorHelper.errorMessage(generalError: error as! GeneralError), preferredStyle: .alert)
           let confirmAction = UIAlertAction(title: "Confirm", style: .cancel, handler: nil)
           
           alertController.addAction(confirmAction)
           present(alertController, animated: true, completion: nil)
       }
}
