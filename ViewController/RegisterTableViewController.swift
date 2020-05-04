//
//  RegisterTableViewController.swift
//  KFC1
//
//  Created by Mac on 4/5/2563 BE.
//  Copyright © 2563 Mac. All rights reserved.
//

import UIKit

class RegisterTableViewController: UITableViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var confirmEmailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var eyePasswordButton: UIButton!
    
    @IBOutlet weak var eyeConfirmPasswordButton: UIButton!
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        registerAPIManager?.register(optionalName: nameTextField.text, optionalEmail: emailTextField.text, optionalConfirmEmail: confirmEmailTextField.text, optionalPassword: passwordTextField.text, optionalConfirmPassword: confirmPasswordTextField.text)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true,
                completion: nil)
    }
    
    var registerAPIManager: RegisterAPIManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    private func setupData(){
        setupRegisterService()
    }
    
    private func setupRegisterService(){
        registerAPIManager = RegisterAPIManagerImplementation()
        registerAPIManager?.setDelegate(self)
    }
    
    @IBAction func eyePasswordButtonTapped(_ sender: Any) {
        updateIsPasswordTextFieldSecureTextEntry()
        updateEyePasswordButton()
    }
    
    @IBAction func eyeConfirmPasswordButtonTapped(_ sender: Any) {
        updateIsConfirmPasswordTextFieldSecureEntry()
        updateEyeConfirmPasswordButton()
    }
    
    private func updateIsPasswordTextFieldSecureTextEntry() {
         passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    private func updateIsConfirmPasswordTextFieldSecureEntry() {
        confirmPasswordTextField.isSecureTextEntry = !confirmPasswordTextField.isSecureTextEntry
    }
    
    private func updateEyePasswordButton() {

        
        eyePasswordButton.setImage(eyePasswordImage(isSecureTextEntry: passwordTextField.isSecureTextEntry), for: .normal)
        
    }
    
    private func updateEyeConfirmPasswordButton() {
        eyeConfirmPasswordButton.setImage(eyePasswordImage(isSecureTextEntry: confirmPasswordTextField.isSecureTextEntry), for: .normal)
    }
    
    private func eyePasswordImage(isSecureTextEntry : Bool) -> UIImage? {
        return isSecureTextEntry ? UIImage(named: "button_eye") : UIImage(named: "button_eye_close")
    }
    
    
}
    extension RegisterTableViewController: RegisterAPIManagerDelegate{
        func didRegisterCompletion () {
            let alertController = UIAlertController(title: "Success", message: "Register Finished", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Confirm", style: .default)
            { (_) in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(confirmAction)
            present(alertController, animated: true, completion: nil)
    }
        func didRegisterFailure (error:Error) {
            let alertController = UIAlertController(title: "Warning", message: ErrorHelper.errorMessage(generalError: error as! GeneralError), preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Confirm", style: .cancel, handler: nil)
            
            alertController.addAction(confirmAction)
            present(alertController, animated: true, completion: nil)
        }
        
}
