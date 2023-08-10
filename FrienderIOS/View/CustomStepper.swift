//
//  CustomStepper.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 9.08.2023.
//

import UIKit

class CustomStepper: UIView {
    let capacityStepper = UIStepper()
    let capacityTxtLabel = UILabel()

   
    
    private func setupUI() {
        self.addSubview(capacityStepper)
        self.addSubview(capacityTxtLabel)
        
        capacityStepper.translatesAutoresizingMaskIntoConstraints = false
        capacityTxtLabel.translatesAutoresizingMaskIntoConstraints = false
        
        capacityStepper.minimumValue = 2
        capacityTxtLabel.text = "\(Int(self.capacityStepper.value)) kişi"

        NSLayoutConstraint.activate([
            
            capacityStepper.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 40),
            capacityStepper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            capacityTxtLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 40),
            capacityTxtLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
        }
            ])
    }
    
