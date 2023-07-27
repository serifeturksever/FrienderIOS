//
//  CustomButton.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 27.07.2023.
//

import UIKit

class CustomButton: UIButton {
    
    enum FontSize{
        case big
        case med
        case small
    }
    
    init(title: String, hasBackground: Bool = false, fontSize: FontSize){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? .systemBlue : .clear
        
        let titleColor: UIColor = hasBackground ? .white : .systemBlue
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
            case .big:
                self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
            case .med:
                self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            case .small:
                self.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        }
        
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
