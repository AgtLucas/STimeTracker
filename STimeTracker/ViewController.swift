//
//  ViewController.swift
//  STimeTracker
//
//  Created by Lucas da Silva on 2/19/16.
//  Copyright © 2016 AgtLucas. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {
    
    let projects = store.projects
    var notificationToken: NotificationToken?
    
    @IBOutlet weak var newProjectTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        notificationToken = store.addNotificationBlock { [weak self] (_) in
            self?.updateView()
        }
    }
    
    func updateView() {
        tableView.reloadData()
    }

    @IBAction func addButtonTapped() {
    }
    
    @IBAction func showNewProjectView(sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCell") as! ProjectCell
        cell.project = projects[indexPath.row]
        return cell
    }

}

class ProjectCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var elapsedTimeLabel: UILabel!
    @IBOutlet var activityButton: UIButton!
    
    var project: Project? {
        didSet {
            guard let project = project else { return }
            nameLabel.text = project.name
            if project.currentActivity != nil {
                elapsedTimeLabel.text = "⌚️"
                activityButton.setTitle("Stop", forState: .Normal)
            } else {
                elapsedTimeLabel.text = NSDateComponentsFormatter().stringFromTimeInterval(project.elapsedTime)
                activityButton.setTitle("Start", forState: .Normal)
            }
        }
    }
    
    @IBAction func activityButtonTapped() {
        guard let project = project else { return }
        if project.currentActivity == nil {
            // TODO: Start a new Activity
        } else {
            // TODO: Complete the Activity
        }
    }
}
