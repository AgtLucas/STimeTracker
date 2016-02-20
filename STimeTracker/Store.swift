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

// Extension...
extension Project {
    var elapsedTime: NSTimeInterval {
        return activities.reduce(0) { time, activity in
            guard let start = activity.startDate,
                let end = activity.endDate else { return time }
            return time + end.timeIntervalSinceDate(start)
        }
    }
    
    var currentActivity: Activity? {
        return activities.filter("endDate == nil").first
    }
}

extension Realm {
    var projects: Results<Project> {
        return objects(Project.self)
    }
}

