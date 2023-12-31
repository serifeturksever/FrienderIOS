//
//  AddRoomPageViewController.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 2.08.2023.
//

import UIKit

class AddRoomPageViewController: UIViewController {
    
    var roomNameTxtField = CustomTextField(fieldType: .roomName)
    var roomDescTxtField = CustomTextField(fieldType: .roomDesc)

    var createBtn = CustomButton(title: "Create", fontSize: .med)

    let titleTxtLabel = UILabel()
    let roomCapacityStepper = UIStepper()
    let capacityTxtLabel = UILabel()
    let activityDatePicker = CustomDatePicker()
    var strDate: String = ""
    let dateFormatter = DateFormatter()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.createBtn.addTarget(self, action: #selector(createRoom), for: .touchUpInside)
        self.activityDatePicker.addTarget(self, action: #selector(activityDateChanged), for: .valueChanged)
        self.roomCapacityStepper.addTarget(self, action: #selector(roomCapacityChanged), for: .valueChanged)
        self.setupUI()
    }
    
    func setupUI() {
        dateFormatter.dateFormat = "dd LLLL yyyy HH.mm"
        strDate = String(dateFormatter.string(from: activityDatePicker.date))
        
        view.backgroundColor = .systemBackground
        
        self.titleTxtLabel.text = "Create Room"
        self.titleTxtLabel.font = .preferredFont(forTextStyle: .title2)
        self.titleTxtLabel.numberOfLines = 0
        self.titleTxtLabel.sizeToFit()
        self.titleTxtLabel.textAlignment = .center
        
        self.roomCapacityStepper.minimumValue = 2
        self.capacityTxtLabel.text = "\(Int(self.roomCapacityStepper.value)) kişi"
//        self.roomCapacityStepper.center = view.center
        self.activityDatePicker.center = view.center
        
        self.titleTxtLabel.translatesAutoresizingMaskIntoConstraints = false
        self.roomNameTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.roomDescTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.roomCapacityStepper.translatesAutoresizingMaskIntoConstraints = false
        self.capacityTxtLabel.translatesAutoresizingMaskIntoConstraints = false
        self.activityDatePicker.translatesAutoresizingMaskIntoConstraints = false
        self.createBtn.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self.titleTxtLabel)
        view.addSubview(self.roomNameTxtField)
        view.addSubview(self.roomDescTxtField)
        view.addSubview(self.roomCapacityStepper)
        view.addSubview(self.capacityTxtLabel)
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
        
        self.roomDescTxtField.topAnchor.constraint(equalTo: self.roomNameTxtField.bottomAnchor, constant: 40),
        self.roomDescTxtField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        self.roomDescTxtField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
        self.roomDescTxtField.heightAnchor.constraint(equalToConstant: 55),

        self.roomCapacityStepper.topAnchor.constraint(equalTo: self.roomNameTxtField.bottomAnchor, constant: 40),
        self.roomCapacityStepper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        
        self.capacityTxtLabel.topAnchor.constraint(equalTo: self.roomNameTxtField.bottomAnchor, constant: 40),
        self.capacityTxtLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        
        self.activityDatePicker.topAnchor.constraint(equalTo: self.roomCapacityStepper.bottomAnchor, constant: 40),
        self.activityDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        self.createBtn.topAnchor.constraint(equalTo: self.activityDatePicker.bottomAnchor, constant: 20),
        self.createBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        
    }
    
    @objc func roomCapacityChanged(_ sender: UIStepper) {
        self.capacityTxtLabel.text = "\(Int(sender.value)) kişi"
    }
    
    @objc func activityDateChanged(_ sender: UIDatePicker) {
        
        strDate = "\(self.dateFormatter.string(from: sender.date))"
    }
    
    @objc func createRoom(_ sender: UIButton) {
        let room = Room(name: self.roomNameTxtField.text ?? "",desc: self.roomDescTxtField.text ?? "", date: self.strDate  , capacity: Int(self.roomCapacityStepper.value), category: .Sport)
        Room.sampleData.append(room)
        print(Room.sampleData)
        
        self.dismiss(animated: true)

        
    }
}
