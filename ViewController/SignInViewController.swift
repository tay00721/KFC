//
//  SignInViewController.swift
//  KFC1
//
//  Created by Mac on 2/5/2563 BE.
//  Copyright © 2563 Mac. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var signinAPIManager: SigninAPIManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupData()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func signinButtonTapped(_ sender: Any) {
        signinAPIManager?.signin(optionalEmail: emailTextField.text, optionalPassword: passwordTextField.text)
    }
    private func setupView(){
        setupTextField()
    }
    private func setupTextField(){
        let textField = [emailTextField,passwordTextField]
        textField.forEach{$0?.delegate = self}
    }
    private func setupData(){
        setupServices()
    }
    private func setupServices(){
        signinAPIManager = SigninAPIManagerImplementation()
        signinAPIManager?.setSigninAPIManagerDelegate(self)
    }
    
}
extension SignInViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField {
            signinAPIManager?.signin(optionalEmail: emailTextField.text, optionalPassword: passwordTextField.text)
            passwordTextField.resignFirstResponder()
        }
        return true
    }
}

extension SignInViewController:SigninAPIManagerDelegate{
    func didSigninCompletion(user: User) {
        let alertController = UIAlertController(title: "Success", message: "Login Finished", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
       }
    
    func didSigninFailure(error: Error) {
        let alertController = UIAlertController(title: "Warning", message: ErrorHelper.errorMessage(generalError: error as! GeneralError), preferredStyle: .alert )
        let confirmAction = UIAlertAction(title: "Confirm", style: .cancel, handler: nil)
        alertController.addAction(confirmAction)
        present(alertController,animated: true,completion: nil)
    }
}
