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
    var entriesTxtField = CustomTextField(fieldType: .entries)
    var createBtn = CustomButton(title: "Create", fontSize: .med)

    let titleTxtLabel = UILabel()
    let entryTypes: [String] = ["Request","Direct"]
    let customStepperView = CustomStepperView()
    let activityDatePicker = CustomDatePicker()
    var strDate: String = ""
    let dateFormatter = DateFormatter()

   var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.createBtn.addTarget(self, action: #selector(createRoom), for: .touchUpInside)
        self.activityDatePicker.addTarget(self, action: #selector(activityDateChanged), for: .valueChanged)
        self.entriesTxtField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        
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
        
        
        self.activityDatePicker.center = view.center
        self.entriesTxtField.textColor = .systemBlue
        
        
        self.titleTxtLabel.translatesAutoresizingMaskIntoConstraints = false
        self.roomNameTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.roomDescTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.entriesTxtField.translatesAutoresizingMaskIntoConstraints = false
        self.customStepperView.translatesAutoresizingMaskIntoConstraints = false
        self.activityDatePicker.translatesAutoresizingMaskIntoConstraints = false
        self.createBtn.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(self.titleTxtLabel)
        view.addSubview(self.roomNameTxtField)
        view.addSubview(self.roomDescTxtField)
        view.addSubview(self.entriesTxtField)
        view.addSubview(self.customStepperView)
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

        self.entriesTxtField.topAnchor.constraint(equalTo: self.roomDescTxtField.bottomAnchor, constant: 40),
        self.entriesTxtField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        self.entriesTxtField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
        self.entriesTxtField.heightAnchor.constraint(equalToConstant: 55),
        
        self.customStepperView.topAnchor.constraint(equalTo: self.entriesTxtField.bottomAnchor, constant: 40),
        self.customStepperView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        self.customStepperView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.70),


        self.activityDatePicker.topAnchor.constraint(equalTo: self.customStepperView.bottomAnchor, constant: 40),
        self.activityDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        self.createBtn.topAnchor.constraint(equalTo: self.activityDatePicker.bottomAnchor, constant: 20),
        self.createBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        
    }
    
    
    @objc func activityDateChanged(_ sender: UIDatePicker) {
        
        strDate = "\(self.dateFormatter.string(from: sender.date))"
    }
    
    @objc func createRoom(_ sender: UIButton) {
        let getStepperValue = self.customStepperView.getStepperValue()
        let room = Room(name: self.roomNameTxtField.text ?? "",desc: self.roomDescTxtField.text ?? "", date: self.strDate  , capacity: getStepperValue, category: .Sport, entryType: Entries(rawValue: entriesTxtField.text!) ?? .Direct)
        Room.sampleData.append(room)
        print(Room.sampleData)
        
        self.dismiss(animated: true)

        
    }
}

extension AddRoomPageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.entryTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.entryTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        entriesTxtField.text = self.entryTypes[row]
        entriesTxtField.resignFirstResponder()
    }
}

extension AddRoomPageViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            return false
        }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
        
    }
}
