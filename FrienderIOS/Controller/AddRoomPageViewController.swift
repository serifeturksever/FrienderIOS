//
//  AddRoomPageViewController.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 2.08.2023.
//

import UIKit

class AddRoomPageViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        let label = UILabel()
        label.text = "Merhaba"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
