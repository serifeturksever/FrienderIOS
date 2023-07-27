//
//  ForgotPasswordViewController.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 27.07.2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    var forgotPasswordTitle = UILabel()
    var forgotPasswordTextField = CustomTextField(fieldType: .email)
    var forgotPasswordBtn = CustomButton(title: "send mail", hasBackground: true, fontSize: .med)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI(){
        self.view.backgroundColor = .systemBackground
        
        self.forgotPasswordTitle.text = "We will send you new password!"
        self.forgotPasswordTitle.textAlignment = .left
        self.forgotPasswordTitle.font = .preferredFont(forTextStyle: .title2, compatibleWith: .none)
        
        self.forgotPasswordTitle.translatesAutoresizingMaskIntoConstraints = false
        self.forgotPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.forgotPasswordBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.forgotPasswordTitle)
        self.view.addSubview(self.forgotPasswordTextField)
        self.view.addSubview(self.forgotPasswordBtn)
        
        NSLayoutConstraint.activate([
            self.forgotPasswordTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.forgotPasswordTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            self.forgotPasswordTextField.topAnchor.constraint(equalTo: self.forgotPasswordTitle.bottomAnchor, constant: 20),
            self.forgotPasswordTextField.leadingAnchor.constraint(equalTo: self.forgotPasswordTitle.leadingAnchor),
            self.forgotPasswordTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            self.forgotPasswordTextField.heightAnchor.constraint(equalToConstant: 55),
            
            self.forgotPasswordBtn.topAnchor.constraint(equalTo: self.forgotPasswordTextField.bottomAnchor, constant: 20),
            self.forgotPasswordBtn.leadingAnchor.constraint(equalTo: self.forgotPasswordTextField.leadingAnchor),
            self.forgotPasswordBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            self.forgotPasswordBtn.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
}
