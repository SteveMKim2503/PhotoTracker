//
//  ViewController.swift
//  PhotoTracker
//
//  Created by MK on 2018. 3. 14..
//  Copyright © 2018년 steveMK. All rights reserved.
//

import UIKit
//import TLPhotoPicker
import TLPhotoPicker
import Photos

class ViewController: UIViewController, TLPhotosPickerViewControllerDelegate {
    
    let photoViewController = TLPhotosPickerViewController()
//    var selectedAssets = [TLPHAsset]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy")
        let startDate = dateFormatter.date(from: "01-01-2011")! as NSDate
        let endDate = dateFormatter.date(from: "01-01-2012")! as NSDate
        
        photoViewController.delegate = self
        var configure = TLPhotosPickerConfigure()
        configure.numberOfColumn = 4
        configure.usedCameraButton = false
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "creationDate > %@ AND creationDate < %@", startDate, endDate)
        configure.fetchOption = fetchOptions
        photoViewController.configure = configure
//        photoViewController.selectedAssets = self.selectedAssets
        self.present(photoViewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

//extension ViewController: TLPhotoPickerViewControllerDelegate {
//
//}

//extension ViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        imagePickerController.dismiss(animated: true, completion: nil)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//    }
//}

