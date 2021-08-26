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
    
    private let correctUsername = "User"
    private let correctPassword = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeWC = segue.destination as? WelcomeViewController else { return }
        welcomeWC.welcome = "Welcome, \(correctUsername)!"
    }
 
    //MARK: - @IBAction
    @IBAction func logInButtonPressed() {
        if usernameTF.text != correctUsername || passwordTF.text != correctPassword {
           showAlert(
            with: "Invalid login or password",
            and: "Please, enter correct login and password",
            textField: passwordTF)
        }
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(with: "Oops!", and: "Your name is \(correctUsername)😊")
            : showAlert(with: "Oops!", and: "Your password is \(correctPassword)😅")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTF.text = ""
        usernameTF.text = ""
    }
}

//MARK: - Private Methods
extension LoginViewController {
    private func showAlert(with title: String, and message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}
