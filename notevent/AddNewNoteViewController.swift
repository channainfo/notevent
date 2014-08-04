//
//  AddNewEventViewController.swift
//  notevent
//
//  Created by InSTEDD on 7/30/14.
//  Copyright (c) 2014 InSTEDD. All rights reserved.
//

import UIKit

protocol AddNewNoteViewControllerDelegate {
    func noteSaveDidTabbed(controller addNewController: AddNewNoteViewController, noteObj: Note)
}

class AddNewNoteViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UIAlertViewDelegate {

    @IBOutlet  var titleTextField: UITextField!
    @IBOutlet  var descriptionTextField: UITextField!
    @IBOutlet  var tagsTextField: UITextField!
    
    @IBOutlet  var image: UIImageView!
    @IBOutlet  var imagePlaceHolder: UIImageView!
    
    var delegate: AddNewNoteViewControllerDelegate?
    
    
    @IBAction func noteSaveTabbed(sender: AnyObject) {
        println("dd")
        
        if self.titleTextField.text.isEmpty {
           println("eee")
           var alert: UIAlertView = UIAlertView(title: "Invalid input", message: "Fields are all required", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
        else {
            if self.delegate {
                self.delegate!.noteSaveDidTabbed(controller: self, noteObj: self.toData())
            }
        }
    }
    
    func toData() -> Note {
        var note: Note = Note()
        note.title = self.titleTextField.text
        note.description = self.descriptionTextField.text
        return note
    }
    
    @IBAction func cancelAddNewNoteTabbed(sender: AnyObject) {
        self.navigateToNotesViewController()
    }
    
    func navigateToNotesViewController(){
        self.navigationController.presentingViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func stringForNow() -> String {
        var dateString = ""
        var now: NSDate = NSDate()
        
        var format: NSDateFormatter = NSDateFormatter()
        format.dateFormat = "yyyy-mm-dd HH:MM:SS"
        dateString = format.stringFromDate(now)
        return dateString
        
    }

    
    @IBAction func imageTabbed(sender: AnyObject) {
        println("image tabbed")
        
        var actions: UIActionSheet = UIActionSheet(title: "Select Image", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Delete", otherButtonTitles: "Camera", "Library")
        
        actions.showInView(self.view)
    }
    
    //Image Picker
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        var imageFromPicker = info[UIImagePickerControllerEditedImage] as UIImage
        self.image.image = imageFromPicker
        self.imagePlaceHolder.hidden = true
        self.navigationController.presentingViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //TextField
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    //UIActionSheet
    func actionSheet(actionSheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int) {
        let CANCEL  = 1
        let DELETE  = 0
        let CAMERA  = 2
        let LIBRARY = 3
        
        if buttonIndex == CAMERA {
            println("camera")
            
            var imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            self.navigationController.presentViewController(imagePicker, animated: true, completion: nil)

        }
        else if buttonIndex == LIBRARY {
            println("library")
            var imagePicker: UIImagePickerController = UIImagePickerController()
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imagePicker.allowsEditing = true
            self.navigationController.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cancel: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "cancelAddNewNoteTabbed:")
        
        self.navigationItem.leftBarButtonItem = cancel
        
        
        self.imagePlaceHolder.layer.borderWidth = 6
        self.imagePlaceHolder.layer.borderColor = UIColor(red: 20, green: 40, blue: 60, alpha: 0.6).CGColor
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
