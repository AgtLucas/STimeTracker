//
//  Store.swift
//  STimeTracker
//
//  Created by Lucas da Silva on 2/20/16.
//  Copyright © 2016 AgtLucas. All rights reserved.
//

import RealmSwift

class Project: Object {

    dynamic var name: String = ""
    let activities = List<Activity>()

}

class Activity: Object {
    
    dynamic var startDate: NSDate?
    dynamic var endDate: NSDate?
    
}