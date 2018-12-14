//
//  LoginViewController.swift
//  Higher
//
//  Created by Devin Fan on 12/13/18.
//  Copyright © 2018 Devin Fan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
        passwordField.delegate = self
        passwordField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let dataManager = DataManager.shared
        guard let username = usernameField.text else { return }
        guard let password = passwordField.text else { return }
        if let employee = dataManager.attemptLogin(username: username, password: password, admin: false) {
            performSegue(withIdentifier: "loginEmployee", sender: employee)
            dataManager.currentUser = employee
        } else {
            let alert = UIAlertController(title: "Login Error", message: "Username/Password is incorrect", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginEmployee", let employee = sender as? Employee, let homePage = segue.destination as? UserHomePageViewController {
            homePage.employee = employee
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
