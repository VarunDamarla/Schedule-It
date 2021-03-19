//
//  Task+CoreDataProperties.swift
//  
//
//  Created by VarunDamarla on 3/18/21.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?

}
