# Shot-And-Pick-Photo
Basic camera and album use, built using Swift, without storyboard

*Use camera to take photo or pick photo from album
-------------------------------------------------------------------

使用原生相機功能拍照或開啟原生相簿選擇照片，並顯示於下方

![image](https://raw.githubusercontent.com/Smith0314/Shot-And-Pick-Photo/master/screenshot/screenshot.jpg) 

.

*Auto layout
-------------------------------------------------------------------

對應多尺寸

        theWidth = view.bounds.width - 60
        elementHeight = view.bounds.height * 0.05
        elementHeight2 = view.bounds.height * 0.9
        elementWidth = (theWidth - 20) / 3
        fontSize = elementHeight * 0.4
        logo.frame = CGRect(x: elementWidth + 40, y: 30, width: elementWidth, height: elementHeight)
        btnShot.frame = CGRect(x: 30, y: 30, width: elementWidth, height: elementHeight)
        btnPick.frame = CGRect(x: (elementWidth * 2) + 50, y: 30, width: elementWidth, height: elementHeight)
        imgView.frame = CGRect(x: 30, y:  elementHeight+40, width: theWidth, height: elementHeight2-40)
        btnShot.titleLabel?.font = UIFont(name:theFont, size:fontSize * 0.8)
        btnShot.titleLabel?.font = UIFont(name:theFont, size:fontSize * 0.8)

.

*Use camera
-------------------------------------------------------------------

呼叫相機拍照後儲存

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
        
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        selectImage = info[UIImagePickerControllerOriginalImage] as UIImage!
        imgView.image = selectImage
        UIImageWriteToSavedPhotosAlbum(selectImage, nil, nil, nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

.

*Pick photo
-------------------------------------------------------------------

呼叫相簿選擇照片

    func pick(sender:UIButton){
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
        func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        selectImage = image
        imgView.image = selectImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
