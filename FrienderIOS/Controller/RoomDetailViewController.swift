//
//  RoomDetailViewController.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 7.08.2023.
//

import UIKit

class RoomDetailViewController: UIViewController {
    let scrollView = UIScrollView(frame: UIScreen.main.bounds)
    let stackView = UIStackView()
    
    let roomImageView = UIImageView(image: UIImage(systemName: "figure.disc.sports"))
    let roomName = UILabel()
    let roomCapacity = UILabel()
    let activityDate = UILabel()
    let roomDescription = UILabel()
    let joinBtn = CustomButton(title: "Join", fontSize: .med)
    
    var room: Room
    init(room: Room) {
        self.room = room
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("Always initialize RoomDetailViewController using init(reminder:)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.joinBtn.addTarget(self, action: #selector(sentRequestBtn), for: .touchUpInside)
        
        self.setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(self.scrollView)
                    
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.scrollView.isUserInteractionEnabled = true

        self.scrollView.addSubview(self.stackView)
        
        self.stackView.axis = .vertical
        self.stackView.alignment = .center
        self.stackView.spacing = 100
                    
//        self.stackView.isUserInteractionEnabled = true
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.85).isActive = true
        self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.roomName.text = room.name
        self.roomCapacity.text = "3/\(String(room.capacity))" // 3 dinamik gelecek!
        self.activityDate.text = room.date
        self.roomDescription.text = room.desc
        //activity date
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.roomImageView.translatesAutoresizingMaskIntoConstraints = false
        self.roomName.translatesAutoresizingMaskIntoConstraints = false
        self.roomCapacity.translatesAutoresizingMaskIntoConstraints = false
        self.activityDate.translatesAutoresizingMaskIntoConstraints = false
        self.roomDescription.translatesAutoresizingMaskIntoConstraints = false
        self.joinBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.stackView.addArrangedSubview(roomImageView)
        self.stackView.addArrangedSubview(roomName)
        self.stackView.addArrangedSubview(roomCapacity)
        self.stackView.addArrangedSubview(activityDate)
        self.stackView.addArrangedSubview(roomDescription)
        self.stackView.addArrangedSubview(joinBtn)
        
       
        
    }
    
    @objc func sentRequestBtn() {
        self.joinBtn.setTitle("Request Sent", for: .normal)
        self.joinBtn.setTitleColor(.systemGreen, for: .normal)
    }
    
}
