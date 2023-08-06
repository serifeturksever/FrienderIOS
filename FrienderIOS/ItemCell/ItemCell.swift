//
//  ItemCell.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 2.08.2023.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(text: String) {
        self.textLabel.text = text
    }

}
