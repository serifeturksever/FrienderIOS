//
//  CategoryRoomsViewController.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 2.08.2023.
//

import UIKit

class CategoryRoomsViewController: UIViewController {
    
    var categoryName: String
    
    init(categoryName: String){
        self.categoryName = categoryName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Fatal Error CategoryRoomsViewController")
    }

    override func viewDidLoad() {
        navigationItem.title = self.categoryName
        
        //add room bar button item
        let addRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addRoomPage))
        
        navigationItem.rightBarButtonItem = addRoomBarButton
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        let label = UILabel()
        label.text = self.categoryName
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func addRoomPage() {
        let viewController = AddRoomPageViewController()
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didCancelAdd(_:)))
        let navigationController = UINavigationController(rootViewController: viewController)
        //navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
    @objc func didCancelAdd(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
