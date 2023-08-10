//
//  CustomStepperView.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 10.08.2023.
//

import UIKit

class CustomStepperView: UIView {
    let capacityStepper = UIStepper()
    let capacityTxtLabel = UILabel()
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        self.setupUI()
//    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    private func setupUI() {
        self.capacityStepper.addTarget(self, action: #selector(roomCapacityChanged), for: .valueChanged)
        
        capacityStepper.translatesAutoresizingMaskIntoConstraints = false
        capacityTxtLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(capacityTxtLabel)
        self.addSubview(capacityStepper)
        
        
        capacityStepper.minimumValue = 2
        capacityTxtLabel.text = "\(Int(self.capacityStepper.value)) kişi"
        
        NSLayoutConstraint.activate([
            
            capacityStepper.topAnchor.constraint(equalTo: self.topAnchor),
            capacityStepper.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            capacityStepper.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            capacityTxtLabel.topAnchor.constraint(equalTo: self.topAnchor),
            capacityTxtLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            capacityTxtLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
        ])
    }
    
    @objc func roomCapacityChanged(_ sender: UIStepper) {
        self.capacityTxtLabel.text = "\(Int(sender.value)) kişi"
    }
    
    func getStepperValue() -> Int {
        return Int(capacityStepper.value)
    }
}
