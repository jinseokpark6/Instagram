//
//  PhotoViewController.swift
//  InstagramApp
//
//  Created by WUSTL STS on 3/6/16.
//  Copyright © 2016 jinseokpark. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var takeButton: UIButton!
    @IBOutlet weak var finalImageView: UIImageView!
    var displayImageView: UIImage!
    var newPost: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        chooseButton.frame.size.width = self.view.frame.width / 2
        takeButton.frame.size.width = self.view.frame.width / 2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onChooseButton(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)

    }
    @IBAction func onTakeButton(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)

    }
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Do something with the images (based on your use case)
            
            displayImageView = editedImage
            finalImageView.image = displayImageView
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onPostButton(sender: AnyObject) {
        
        let file = Post.getPFFileFromImage(displayImageView)
        let text = (captionTextField.text == "") ? "" : captionTextField.text
        Post.postUserImage(displayImageView, withCaption: text) { (success: Bool, error: NSError?) -> Void in
            if success {
                print("success!!")
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
