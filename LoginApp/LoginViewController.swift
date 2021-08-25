//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Илья Нечаев on 26.08.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let correctUsername = "User"
    let correctPassword = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
 
    @IBAction func logInButtonPressed() {
  
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func forgotUserName() {
        showAlert(with: "Oops!", and: "Your name is \(correctUsername)😅")
    }
    
    @IBAction func forgotPassword() {
        showAlert(with: "Oops!", and: "Your password is \(correctPassword)😊")
    }
    
    
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
        
        
    }

}
