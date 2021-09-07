//
//  EmployeeRealm.swift
//  tableView
//
//  Created by Coditas on 06/09/21.
//

import Foundation
import RealmSwift

class EmployeeRealm: Object{
    //var id = RealmOptional<Int>()
    @objc dynamic var email: String?
    @objc dynamic var first_name: String?
    @objc dynamic var last_name: String?
    @objc dynamic var avatar: String?
}
