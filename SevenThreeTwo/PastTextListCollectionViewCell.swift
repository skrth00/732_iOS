//
//  PastTextListCollectionViewCell.swift
//  SevenThreeTwo
//
//  Created by 전한경 on 2017. 2. 8..
//  Copyright © 2017년 윤민섭. All rights reserved.
//

import UIKit

class PastTextListCollectionViewCell: UICollectionViewCell {
    
    let userDevice = DeviceResize(testDeviceModel: DeviceType.IPHONE_7,userDeviceModel: (Float(ScreenSize.SCREEN_WIDTH),Float(ScreenSize.SCREEN_HEIGHT)))
    
    var heightRatio: CGFloat = 0.0
    var widthRatio: CGFloat = 0.0
    
    // 기기의 너비와 높이
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var mission: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        heightRatio = userDevice.userDeviceHeight()
        widthRatio = userDevice.userDeviceWidth()
        
        date.frame = CGRect(x: (0*widthRatio), y: (20*self.heightRatio), width: 335*widthRatio, height: 11*heightRatio )
        date.font = UIFont(name: "Arita-dotum-Medium_OTF", size: 11*widthRatio)
        date.textAlignment = .center
        
        
        mission.font = UIFont(name: "Arita-dotum-Medium_OTF", size: 16*widthRatio)
        mission.textAlignment = .center
        mission.numberOfLines = 0
    }
    
}
