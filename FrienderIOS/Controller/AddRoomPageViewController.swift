//
//  AddRoomPageViewController.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 2.08.2023.
//

import UIKit

class AddRoomPageViewController: UIViewController {
    
    var roomNameTxtField = CustomTextField(fieldType: .roomName)
    var createBtn = CustomButton(title: "Create", fontSize: .med)

    let titleTxtLabel = UILabel()
    let activityDatePicker = CustomDatePicker()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //self.createBtn.addTarget(self, action: #selector(getFilteredUsers), for: .touchUpInside)

        self.setupUI()
    }
    
    func setupUI() {
        
        view.backgroundColor = .systemBackground
        
        self.titleTxtLabel.text = "Create Room"
        self.titleTxtLabel.font = .preferredFont(forTextStyle: .title2)
        self.titleTxtLabel.numberOfLines = 0
        self.titleTxtLabel.sizeToFit()
        self.titleTxtLabel.textAlignment = .center
        
        self.activityDatePicker.center = view.center
        
        self.titleTxtLabel.translatesAutoresizingMaskIntoConstraints = false
        self.roomNameTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.activityDatePicker.translatesAutoresizingMaskIntoConstraints = false
        self.createBtn.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self.titleTxtLabel)
        view.addSubview(self.roomNameTxtField)
        view.addSubview(self.activityDatePicker)
        view.addSubview(self.createBtn)
        
        


        NSLayoutConstraint.activate([
        self.titleTxtLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
        self.titleTxtLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        self.titleTxtLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
        
        self.roomNameTxtField.topAnchor.constraint(equalTo: self.titleTxtLabel.bottomAnchor, constant: 40),
        self.roomNameTxtField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        self.roomNameTxtField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
        self.roomNameTxtField.heightAnchor.constraint(equalToConstant: 55),

        self.activityDatePicker.topAnchor.constraint(equalTo: self.roomNameTxtField.bottomAnchor, constant: 40),
        self.activityDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        self.createBtn.topAnchor.constraint(equalTo: self.activityDatePicker.bottomAnchor, constant: 20),
        self.createBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
}
