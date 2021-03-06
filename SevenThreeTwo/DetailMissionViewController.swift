//
//  DetailMissionViewController.swift
//  SevenThreeTwo
//
//  Created by 윤민섭 on 2017. 2. 2..
//  Copyright © 2017년 윤민섭. All rights reserved.
//

import UIKit

class DetailMissionViewController: UIViewController {

    let userDevice = DeviceResize(testDeviceModel: DeviceType.IPHONE_7,userDeviceModel: (Float(ScreenSize.SCREEN_WIDTH),Float(ScreenSize.SCREEN_HEIGHT)))
    
    // test에 내꺼 넣고 user은 저렇게 가도 된다
    
    var heightRatio: CGFloat = 0.0
    var widthRatio: CGFloat = 0.0
    
    var receivedImg : UIImage = UIImage(named : "camera")!
    var receivedLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightRatio = userDevice.userDeviceHeight()
        widthRatio = userDevice.userDeviceWidth()

        viewSetUp()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewSetUp(){
        
        let backgroundImage = UIImageView(frame: CGRect(x: (0*widthRatio), y: (0*heightRatio), width: 375*widthRatio, height: 667*heightRatio))
        backgroundImage.image = receivedImg
        
        let coverLayer = CALayer()
        coverLayer.frame = backgroundImage.bounds;
        coverLayer.backgroundColor = UIColor.black.cgColor
        coverLayer.opacity = 0.6
        backgroundImage.layer.addSublayer(coverLayer)
        
        self.view.addSubview(backgroundImage)
        
        let cancelBtn = UIButton(frame: CGRect(x: 176*widthRatio , y: 60*heightRatio, width: 23*widthRatio, height: 23*heightRatio))
        cancelBtn.setImage(UIImage(named: "cancelWhite"), for: UIControlState.normal)
        cancelBtn.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        
        self.view.addSubview(cancelBtn)
        
        let detailLabel = UIImageView(frame: CGRect(x: 116*widthRatio, y: 118*heightRatio, width: 143*widthRatio, height: 29*heightRatio))
        detailLabel.image = UIImage(named: "DetailLabel")
        self.view.addSubview(detailLabel)
        
        
        drawCircle(startX: 187.5, startY: 330.5, radius: 143.5)
        drawCircle(startX: 187.5, startY: 330.5, radius: 138.5)
        
        
        
        let dateLabel = UILabel(frame: CGRect(x: (127*widthRatio), y: (263*heightRatio), width: 121*widthRatio, height: 11*heightRatio))
        dateLabel.text = useDate() + "의 잠상"
        dateLabel.textAlignment = .center
        dateLabel.textColor = UIColor.white
        dateLabel.font = UIFont(name: "Arita-dotum-Medium_OTF", size: 11*widthRatio)
        dateLabel.font = dateLabel.font.withSize(11*widthRatio)
        
        self.view.addSubview(dateLabel)
        
        drawLine(startX: 169, startY: 285, width: 36, height: 1,border:false, color: UIColor.white)
    
        let subLabel = UILabel(frame: CGRect(x: (68*widthRatio), y: (290*heightRatio), width: 240*widthRatio, height: 90*heightRatio))
        subLabel.numberOfLines = 0
        subLabel.text = receivedLbl.text
        subLabel.textAlignment = .center
        subLabel.textColor = UIColor.white
        subLabel.font = UIFont(name: "Arita-dotum-SemiBold_OTF", size: 22*widthRatio)

        self.view.addSubview(subLabel)
        
        let dismissExtension = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        let dismissRecognizer = UITapGestureRecognizer(target:self, action:#selector(cancelButtonAction(sender:)))
        dismissExtension.isUserInteractionEnabled = true
        dismissExtension.addGestureRecognizer(dismissRecognizer)
        self.view.addSubview(dismissExtension)
        
        let jamsangWord = UIImageView(frame: CGRect(x: 161*widthRatio, y: 519*heightRatio, width: 55*widthRatio, height: 61*heightRatio))
        jamsangWord.image = UIImage(named: "jamsangWord")
        jamsangWord.sizeToFit()
        self.view.addSubview(jamsangWord)
        
        let jamsangLebel = UILabel(frame: CGRect(x: 0, y: 596*heightRatio, width: 375*widthRatio, height: 12*heightRatio))
        jamsangLebel.text = "공간과 사물에 잠재한 현상을 이끌어내다"
        jamsangLebel.font = UIFont(name: "Arita-dotum-Light_OTF", size: 12*widthRatio)
        jamsangLebel.textAlignment = .center
        jamsangLebel.textColor = UIColor.white
        self.view.addSubview(jamsangLebel)
        
    }
    
    
    
    func drawLine(startX: CGFloat,startY: CGFloat,width: CGFloat, height: CGFloat, border:Bool, color: UIColor){
        
        var line: UIView!
        
        if border{
            line = UIView(frame: CGRect(x: startX*widthRatio, y: startY*heightRatio, width: width, height: height*heightRatio))
        }else{
            line = UIView(frame: CGRect(x: startX*widthRatio, y: startY*heightRatio, width: width*widthRatio, height: height))
        }
        line.backgroundColor = color
        
        self.view.addSubview(line)
    }
    
    func useDate() -> String{
        let todaysDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        let DateInFormat = dateFormatter.string(from: todaysDate as Date)
    
        return DateInFormat
    }
    
    func cancelButtonAction(sender: UIButton!) {
        self.dismiss(animated: false, completion: nil)
    }
    

    func drawCircle(startX: CGFloat,startY:CGFloat,radius: CGFloat){
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: startX*widthRatio,y: startY*heightRatio), radius: radius*widthRatio, startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 1
        
        view.layer.addSublayer(shapeLayer)
    }

    

}
