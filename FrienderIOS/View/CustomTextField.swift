//
//  CustomTextField.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 27.07.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case username
        case fullname
        case email
        case password
        case repassword
        case roomName
        case roomDesc

    }
    
    private let authFieldType: CustomTextFieldType
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x:0, y:0,width: 12, height: self.frame.size.height))
        
        switch fieldType {
        case .username:
            self.placeholder = "Username"
        case .fullname:
            self.placeholder = "Fullname"
        case .email:
            self.placeholder = "Email Address"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        case .repassword:
            self.placeholder = "Repassword"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        case .roomName:
            self.placeholder = "Room Name"
        case .roomDesc:
            self.placeholder = "Room Description"
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
