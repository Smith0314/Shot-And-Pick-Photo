//
//  ViewController.swift
//  Shot-And-Pick-Photo
//
//  Created by Smith on 2015/4/5.
//  Copyright (c) 2015 Smith-Lab. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //UI
    var logo:UILabel!
    var theWidth:CGFloat!
    var elementHeight:CGFloat!
    var elementHeight2:CGFloat!
    var elementWidth:CGFloat!
    var theFont:String = "AvenirNext-Bold"
    var fontSize:CGFloat!
    var btnShot:UIButton!
    var btnPick:UIButton!
    var imgView:UIImageView!
    var hColor:UIColor!
    var lColor:UIColor!
    
    //Camera
    var imagePicker = UIImagePickerController()
    var selectImage:UIImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI
        lColor = UIColor(red: 0.122, green: 0.129, blue: 0.086, alpha: 1)
        hColor = UIColor(red: 0.694, green: 0.82, blue: 0.675, alpha: 1)
        fontSize = 15
        view.backgroundColor = hColor
        
        theWidth = view.bounds.width - 60
        elementHeight = view.bounds.height * 0.05
        elementHeight2 = view.bounds.height * 0.9
        elementWidth = (theWidth - 20) / 3
        fontSize = elementHeight * 0.4
        
        logo = UILabel()
        logo.frame = CGRect(x: elementWidth + 40, y: 30, width: elementWidth, height: elementHeight)
        logo.font = UIFont(name:"untitled-font-1", size:elementHeight)
        logo.textColor = lColor
        logo.textAlignment = .Center
        logo.text = "s"
        
        btnShot = UIButton()
        btnShot.frame = CGRect(x: 30, y: 30, width: elementWidth, height: elementHeight)
        btnShot.setTitle("SHOT", forState: UIControlState.Normal)
        btnShot.setTitleColor(hColor, forState: UIControlState.Normal)
        btnShot.titleLabel?.font = UIFont(name:theFont, size:fontSize * 0.8)
        btnShot.addTarget(self, action: "shot:", forControlEvents: UIControlEvents.TouchUpInside)
        btnShot.backgroundColor = lColor
        
        btnPick = UIButton()
        btnPick.frame = CGRect(x: (elementWidth * 2) + 50, y: 30, width: elementWidth, height: elementHeight)
        btnPick.setTitle("PICK", forState: UIControlState.Normal)
        btnPick.setTitleColor(hColor, forState: UIControlState.Normal)
        btnPick.titleLabel?.font = UIFont(name:theFont, size:fontSize * 0.8)
        btnPick.addTarget(self, action: "pick:", forControlEvents: UIControlEvents.TouchUpInside)
        btnPick.backgroundColor = lColor
        
        imgView = UIImageView()
        imgView.frame = CGRect(x: 30, y:  elementHeight+40, width: theWidth, height: elementHeight2-40)
        imgView.contentMode = .ScaleAspectFill
        imgView.backgroundColor = lColor
        imgView.layer.borderColor = lColor.CGColor
        imgView.layer.borderWidth = 10
        imgView.layer.masksToBounds = true
        
        view.addSubview(logo)
        view.addSubview(btnShot)
        view.addSubview(btnPick)
        view.addSubview(imgView)
        
        
    }
    
    func shot(sender:UIButton){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.mediaTypes = [kUTTypeImage]
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }else{
            var alertView:UIAlertView = UIAlertView(title: "!", message: "No camera equipment", delegate: self, cancelButtonTitle: "OK")
        }
    }
    
    func pick(sender:UIButton){
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        selectImage = info[UIImagePickerControllerOriginalImage] as UIImage!
        imgView.image = selectImage
        UIImageWriteToSavedPhotosAlbum(selectImage, nil, nil, nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        selectImage = image
        imgView.image = selectImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

