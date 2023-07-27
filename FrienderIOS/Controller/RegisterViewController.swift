//
//  RegisterViewController.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 27.07.2023.
//

import UIKit
import WebKit

class RegisterViewController: UIViewController{
    private let scrollView = UIScrollView(frame: UIScreen.main.bounds)
    private let authHeader = AuthHeaderView(title: "Register", subTitle: "Create an account")
    
    private let fullname = CustomTextField(fieldType: .fullname)
    private let username = CustomTextField(fieldType: .username)
    private let email = CustomTextField(fieldType: .email)
    private let password = CustomTextField(fieldType: .password)
    private let repassword = CustomTextField(fieldType: .repassword)
    
    private let registerBtn = CustomButton(title: "Register", hasBackground: true, fontSize: .med)
    private let loginBtn = CustomButton(title: "Already have an account? Login", fontSize: .small)
        
    private let termsTextView: UITextView = {
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy.")
        
        attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Terms & Conditions"))

        attributedString.addAttribute(.link, value: "privacy://privacyPolicy", range: (attributedString.string as NSString).range(of:"Privacy Policy"))
        
        let textView = UITextView()
        
        textView.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        textView.backgroundColor = .clear
        textView.attributedText = attributedString
        textView.textColor = .label
        textView.isSelectable = true
        textView.isEditable = false
        textView.delaysContentTouches = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.termsTextView.delegate = self
        self.loginBtn.addTarget(self, action: #selector(openLoginPage), for: .touchUpInside)
    }
    
    private func setupUI(){
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        self.view.backgroundColor = .systemBackground
        
        stackView.addArrangedSubview(authHeader)
        stackView.addArrangedSubview(fullname)
        stackView.addArrangedSubview(username)
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(password)
        stackView.addArrangedSubview(repassword)
        stackView.addArrangedSubview(registerBtn)
        stackView.addArrangedSubview(termsTextView)
        stackView.addArrangedSubview(loginBtn)

        self.authHeader.translatesAutoresizingMaskIntoConstraints = false
        self.fullname.translatesAutoresizingMaskIntoConstraints = false
        self.username.translatesAutoresizingMaskIntoConstraints = false
        self.email.translatesAutoresizingMaskIntoConstraints = false
        self.password.translatesAutoresizingMaskIntoConstraints = false
        self.repassword.translatesAutoresizingMaskIntoConstraints = false
        self.registerBtn.translatesAutoresizingMaskIntoConstraints = false
        self.termsTextView.translatesAutoresizingMaskIntoConstraints = false
        self.loginBtn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            self.authHeader.heightAnchor.constraint(equalToConstant: 222),
            self.authHeader.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            self.authHeader.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            self.fullname.centerXAnchor.constraint(equalTo: self.authHeader.centerXAnchor),
            self.fullname.heightAnchor.constraint(equalToConstant: 55),
            self.fullname.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            
            self.username.centerXAnchor.constraint(equalTo: self.fullname.centerXAnchor),
            self.username.heightAnchor.constraint(equalToConstant: 55),
            self.username.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.85),
       
            self.email.centerXAnchor.constraint(equalTo: self.username.centerXAnchor),
            self.email.heightAnchor.constraint(equalToConstant: 55),
            self.email.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.85),
       
            self.password.centerXAnchor.constraint(equalTo: self.email.centerXAnchor),
            self.password.heightAnchor.constraint(equalToConstant: 55),
            self.password.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.85),
            
            self.repassword.centerXAnchor.constraint(equalTo: self.password.centerXAnchor),
            self.repassword.heightAnchor.constraint(equalToConstant: 55),
            self.repassword.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.85),
       
            self.registerBtn.centerXAnchor.constraint(equalTo: self.repassword.centerXAnchor),
            self.registerBtn.heightAnchor.constraint(equalToConstant: 55),
            self.registerBtn.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.85),
       
            self.termsTextView.centerXAnchor.constraint(equalTo: self.registerBtn.centerXAnchor),
            self.termsTextView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.85),
            
            self.loginBtn.topAnchor.constraint(equalTo: self.termsTextView.bottomAnchor, constant: 20),
            self.loginBtn.centerXAnchor.constraint(equalTo: self.termsTextView.centerXAnchor),
            self.loginBtn.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.85),
       
        
        ])
    }
    
    @objc private func openLoginPage(){
        navigationController?.popViewController(animated: true)
    }
    
}

extension RegisterViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.scheme == "terms" {
            self.showWebViewerController(with: "https://policies.google.com/terms?hl=en")
        } else if URL.scheme == "privacy" {
            self.showWebViewerController(with: "https://policies.google.com/privacy?hl=en")
        }
        
        return true
    }
    
    private func showWebViewerController(with urlString: String) {
        let vc = WebViewerController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}
