//
//  ViewController.swift
//  notevent
//
//  Created by InSTEDD on 7/29/14.
//  Copyright (c) 2014 InSTEDD. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddNewNoteViewControllerDelegate  {
    
    var noteManager: Notes = Notes()
    
    @IBOutlet var noteTable: UITableView!
    
    @IBAction func addNoteTabbed(sender: AnyObject) {
        var vc: AddNewNoteViewController = self.storyboard.instantiateViewControllerWithIdentifier("add_new_note") as AddNewNoteViewController
        vc.delegate = self
        var nav: UINavigationController = UINavigationController(rootViewController: vc)
        self.presentViewController(nav, animated: true, completion: nil)
        
    }
    
    func noteSaveDidTabbed(controller addNewController: AddNewNoteViewController, noteObj: Note) {
        let note: Note = addNewController.toData()
        
        println(noteObj.title)
        println(noteObj.description)
        
        self.noteManager.add(note)
        addNewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.noteTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func tableView(tableView: UITableView!, shouldHighlightRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
//        println("Index: \(indexPath.row)")
//        
//        
//        return true
//    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.noteManager.length
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath) as NoteTableViewCell
        
        cell.titleCell.text = self.noteManager.data[indexPath.row].title
        cell.descriptionCell.text = self.noteManager.data[indexPath.row].description
        return cell
    }


}

