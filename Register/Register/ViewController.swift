//
//  ViewController.swift
//  Register
//
//  Created by anamay pandey on 23/01/22.
//  Copyright © 2022 anamay pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var surName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var mobilenumberemail: UITextField!
    
    @IBOutlet weak var maleBtn: UIButton!
    
    
    @IBOutlet weak var femaleBtn: UIButton!
    
    @IBOutlet weak var customButton: UIButton!
    
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var nameError: UILabel!
    
    
    @IBOutlet weak var surnameError: UILabel!
    
    
    @IBOutlet weak var numberError: UILabel!
    
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var passwordError: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func resetForm(){
        signUp.isEnabled=false
        
        nameError.isHidden=false
        surnameError.isHidden=false
        numberError.isHidden=false
        passwordError.isHidden=false
        emailError.isHidden=false
        
        firstName.text=""
        surName.text=""
        password.text=""
        mobilenumberemail.text=""
        phoneNumber.text=""
        
    }
    
    @IBAction func firstNameChanged(_ sender: Any) {
        if let name = firstName.text{
            if let errorMessage =  invalidName(name){
                nameError.text = errorMessage
                nameError.isHidden = false
            }
            else{
                nameError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidName(_ value: String) -> String?
    {
        if value.count > 8
        {
            return "Name contains at most 8 characters"
        }
        
        if !containsDigit(value)
        {
            return "Name must not contain any digit"
        }
        return nil
    }
    
    
    @IBAction func surNameChanged(_ sender: Any) {
        if let surname = surName.text{
            if let errorMessage =  invalidName(surname){
                surnameError.text = errorMessage
                surnameError.isHidden = false
            }
            else{
                surnameError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    
    @IBAction func emailChanged(_ sender: Any) {
        if let email = mobilenumberemail.text{
            if let errorMessage =  invalidEmail(email){
                emailError.text = errorMessage
                emailError.isHidden = false
            }
            else{
                emailError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidEmail(_ value: String) -> String?
    {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        return nil
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        if let password = password.text{
            if let errorMessage =  invalidPassword(password){
                passwordError.text = errorMessage
                passwordError.isHidden = false
            }
            else{
                passwordError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidPassword(_ value: String) -> String?
    {
        if value.count < 8
        {
            return "Password must contain at least 8 characters"
        }
        
        if containsDigit(value)
        {
            return "Password must contain at least 1 digit"
        }
        
        if containsLowerCase(value)
        {
            return "Password must contain at least 1 lowercase"
        }
        if containsUpperCase(value)
        {
            return "Password must contain at least 1 uppercase"
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool
    {
        let regularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsLowerCase(_ value: String) -> Bool
    {
        let regularExpression = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsUpperCase(_ value: String) -> Bool
    {
        let regularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    
    @IBAction func phoneNumberChanged(_ sender: Any) {
        if let phonenumber = phoneNumber.text{
            if let errorMessage =  invalidPhoneNumber(phonenumber){
                numberError.text = errorMessage
                numberError.isHidden = false
            }
            else{
                numberError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidPhoneNumber(_ value: String) -> String?{
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set)
        {
            return "Phone number must only contains digit"
        }
        
        if value.count != 10
        {
            return "Phone number must be 10 digits in length"
        }
        return nil
    }
    
    @IBAction func maleBtn(_ sender: UIButton) {
        if sender.isSelected{
                sender.isSelected=false
                femaleBtn.isSelected=false
                customButton.isSelected=false
        }
        else{
            sender.isSelected=true
            femaleBtn.isSelected=false
            customButton.isSelected=false
        }
    
    }
    
    
    
    @IBAction func femaleBtn(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected=false
            maleBtn.isSelected=false
            customButton.isSelected=false
        }
        else{
            sender.isSelected=true
            maleBtn.isSelected=false
            customButton.isSelected=false
        }
    }
    
    
    
    @IBAction func customBtn(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected=false
            maleBtn.isSelected=false
            femaleBtn.isSelected=false
        }
        else{
            sender.isSelected=true
            maleBtn.isSelected=false
            femaleBtn.isSelected=false
        }
    }
    
    
    func checkForValidForm(){
        if nameError.isHidden && surnameError.isHidden && numberError.isHidden && passwordError.isHidden && emailError.isHidden{
            signUp.isEnabled=true
        }
        else{
            signUp.isEnabled=false
        }
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        resetForm()
        
    }
    
}

