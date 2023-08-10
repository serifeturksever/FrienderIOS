//
//  ChatViewController.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 10.08.2023.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var messageTxtField: UITextField!
    
    @IBOutlet weak var messageSendBtn: UIButton!
    
    var room: Room!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = room.name
        
        messageSendBtn.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        self.setupUI()
    }
    
    func setupUI() {
        messageTxtField.layer.borderColor = UIColor.blue.cgColor
        
    }
 
    @objc func sendMessage(_ sender: UIButton) {
        print("\(messageTxtField.text ?? "")")
    }
    
}
