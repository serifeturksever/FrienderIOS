//
//  CustomDatePicker.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 4.08.2023.
//

import UIKit

class CustomDatePicker: UIDatePicker {
    
    init(){
        super.init(frame: .zero)
        
        self.locale = .current
        self.datePickerMode = .dateAndTime
        self.preferredDatePickerStyle = .compact
        self.tintColor = .systemBlue
        
    }
    required init?(coder: NSCoder) {
        fatalError("Inıt coder has not implemented for CustomDatePicker")
    }
    
}
