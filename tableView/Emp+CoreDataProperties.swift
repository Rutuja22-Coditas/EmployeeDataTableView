//
//  Emp+CoreDataProperties.swift
//  tableView
//
//  Created by Coditas on 31/08/21.
//
//

import Foundation
import CoreData


extension Emp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emp> {
        return NSFetchRequest<Emp>(entityName: "Emp")
    }

    @NSManaged public var avatar: String?
    @NSManaged public var email: String?
    @NSManaged public var first_name: String?
    @NSManaged public var id: Int16
    @NSManaged public var last_name: String?

}

extension Emp : Identifiable {

}
