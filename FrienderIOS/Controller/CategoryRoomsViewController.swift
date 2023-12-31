//
//  CategoryRoomsViewController.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 2.08.2023.
//

import UIKit

class CategoryRoomsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var rooms = Room.sampleData
    
    var categoryName: String?
    
    let listStyleSegmentedControl = UISegmentedControl(items: ["all","my rooms"])

//    init(categoryName: String){
//        self.categoryName = categoryName
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("Fatal Error CategoryRoomsViewController")
//    }

    override func viewDidLoad() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        navigationItem.title = self.categoryName ?? ""
        
        rooms = rooms.filter({
            $0.category.rawValue == self.categoryName ?? ""
        })
        //add room bar button item
        let addRoomBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addRoomPage))
        navigationItem.rightBarButtonItem = addRoomBarButton
    
        self.listStyleSegmentedControl.isEnabled = true
        listStyleSegmentedControl.addTarget(
           self, action: #selector(didChangeListStyle(_:)), for: .valueChanged)
        navigationItem.titleView = listStyleSegmentedControl

        super.viewDidLoad()
        self.setupUI()
        
        
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
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
    
    @objc func didChangeListStyle(_ sender: UISegmentedControl ) {
        print("MY ROOms")
    }
    
    
}


extension CategoryRoomsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rooms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoomCollectionViewCell", for: indexPath) as! RoomCollectionViewCell
        cell.setup(with: self.rooms[indexPath.row])
        return cell
    }
    func collectionView(
        _ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath
    ) -> Bool {
        pushDetailViewForRoom(withId: self.rooms[indexPath.item])
        return false
    }
    
    func pushDetailViewForRoom(withId room:Room){
        let viewController = RoomDetailViewController(room: room)
        navigationController?.pushViewController(viewController, animated: true)
     }
}

extension CategoryRoomsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 100)
    }
    
}

extension CategoryRoomsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(self.rooms[indexPath.row].name)
    }

}
