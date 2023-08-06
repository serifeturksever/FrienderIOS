//
//  RoomCollectionViewCell.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 6.08.2023.
//

import UIKit

class RoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var activityDate: UILabel!
    @IBOutlet weak var capacity: UILabel!
    
    func setup(with room: Room){
        self.roomName.text = room.name
        self.activityDate.text = room.date
        self.capacity.text = String(room.capacity)
    }
}
