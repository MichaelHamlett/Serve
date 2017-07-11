//
//  SignupViewController.swift
//  Serve
//
//  Created by Bamlak Gessessew on 7/11/17.
//  Copyright © 2017 Bamlak Gessessew. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var emptyFieldAlert: UIAlertController!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var userTypes = ["Individual", "Organization"]
    var typeSelected = "Individual"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSignUp(_ sender: Any) {
        //check to display error message if one of the field is empty
        if (usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            present(emptyFieldAlert, animated: true) { }
            return
        }
        
        let newUser = PFUser()
        newUser.username = usernameTextField.text
        newUser.email = emailTextField.text
        newUser.password = passwordTextField.text
        if typeSelected == "Individual" {
            newUser["isIndividual"] = true
        } else {
            newUser["isOrg"] = true
        }
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("Yay, created a user!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print(error?.localizedDescription as Any)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return userTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeSelected = userTypes[row]
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
