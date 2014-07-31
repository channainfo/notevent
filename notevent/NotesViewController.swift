//
//  ViewController.swift
//  notevent
//
//  Created by InSTEDD on 7/29/14.
//  Copyright (c) 2014 InSTEDD. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet var notesTable: UITableView
    
    @IBAction func addNoteTabbed(sender: AnyObject) {
        
        var vc: AddNewNoteViewController = self.storyboard.instantiateViewControllerWithIdentifier("add_new_note") as AddNewNoteViewController
        var nav: UINavigationController = UINavigationController(rootViewController: vc)
        self.navigationController.presentViewController(nav, animated: true, completion: nil)
        
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
        return 1
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = self.notesTable.dequeueReusableCellWithIdentifier("notesCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel.text = "Test text"
        return cell
    }


}
