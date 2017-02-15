//
//  ChangeCompleteViewController.swift
//  SevenThreeTwo
//
//  Created by 윤민섭 on 2017. 2. 15..
//  Copyright © 2017년 윤민섭. All rights reserved.
//

import UIKit

class ChangeCompleteViewController: UIViewController {

    var receivedStatusMsg : Int!
    
    let userDevice = DeviceResize(testDeviceModel: DeviceType.IPHONE_7,userDeviceModel: (Float(ScreenSize.SCREEN_WIDTH),Float(ScreenSize.SCREEN_HEIGHT)))
    
    var heightRatio: CGFloat = 0.0
    var widthRatio: CGFloat = 0.0
    var users = UserDefaults.standard
    var userToken : String!
    var apiManager : ApiManager!

    var checkImg : [UIImage] = [UIImage(named: "checkComplete1")!,UIImage(named:"checkComplete2")!,UIImage(named:"checkComplete3")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightRatio = userDevice.userDeviceHeight()
        widthRatio = userDevice.userDeviceWidth()
        userToken = users.string(forKey: "token")
        viewSetUp()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewSetUp(){
        self.view.backgroundColor = UIColor.clear
        
        let backView = UIView(frame: CGRect(x: 0*widthRatio, y: 0*heightRatio, width: 375*widthRatio, height: 667*heightRatio))
        backView.backgroundColor = UIColor(red: 68/255, green: 67/255, blue: 68/255, alpha: 0.93)
        self.view.addSubview(backView)
        
        
        let completeView = UIView(frame: CGRect(x: 52*widthRatio, y: 201*heightRatio, width: 271*widthRatio, height: 327*heightRatio))
        completeView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        
        let checkImageView = UIImageView(frame: CGRect(x: 106*widthRatio, y: 103*heightRatio, width: 59*widthRatio, height: 59*heightRatio))
        checkImageView.image = UIImage(named: "checkComplete")
    
        completeView.addSubview(checkImageView)
        
        let checkMsg = UIImageView()
        
        switch (receivedStatusMsg){
        case 0:
            checkMsg.frame = CGRect(x: 79*widthRatio, y: 214*heightRatio, width: 103*widthRatio, height: 37*heightRatio)
            checkMsg.image = self.checkImg[receivedStatusMsg]
            break
        case 1:
            checkMsg.frame = CGRect(x: 77*widthRatio, y: 213*heightRatio, width: 107*widthRatio, height: 37*heightRatio)
            checkMsg.image = self.checkImg[receivedStatusMsg]
            break
        case 2:
            checkMsg.frame = CGRect(x: 79*widthRatio, y: 214*heightRatio, width: 103*widthRatio, height: 37*heightRatio)
            checkMsg.image = self.checkImg[receivedStatusMsg]
            break
        default:
            break
        }
        checkMsg.sizeToFit()
        completeView.addSubview(checkMsg)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(changeCompleteAction))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        self.view.addSubview(completeView)
        
    }
    
    func changeCompleteAction(){
        self.performSegue(withIdentifier: "unwindToSetting", sender: self)
    }

}
