//
//  ViewController.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 27.07.2023.
//

import UIKit

class CategoryListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let categories = ["Sport","Game","Chat","Art","Food","Study"]
    
    var estimatedWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegates
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        //Register Cells
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        
        //SetupGrid view
        self.setupGridView()
        

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    

    private func showCategoryRooms(categoryName: String){
        let viewController = CategoryRoomsViewController(categoryName:categoryName)
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension CategoryListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.setData(text: self.categories[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let categoryName = self.categories[indexPath.row]
        showCategoryRooms(categoryName: categoryName)
        return false
    }
    
}

extension CategoryListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.calculateWidth()
        return CGSize(width: width, height: width)
    }
    
    func calculateWidth() -> CGFloat{
        let estimatedWidth = CGFloat(self.estimatedWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(self.cellMarginSize * 2)
        let totalGapSize = CGFloat(self.cellMarginSize) * (cellCount - 1)
        let width = (self.view.frame.size.width - totalGapSize - margin) / cellCount
        
        return width
        
    }
}

