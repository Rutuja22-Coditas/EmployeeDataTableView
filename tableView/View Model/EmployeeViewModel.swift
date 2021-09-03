

import UIKit
import CoreData
import UIKit

class EmployeeViewModel{
    var empArr = [Employee]()
    
    
    //static var sharedInstance = EmployeeViewModel()
    //let appDelegate = (UIApplication.shared.delegate as? AppDelegate)
    //var context:NSManagedObjectContext!
    //let context = PersistentStorage.shared.persistentContainer.viewContext
    
    let urlString = "https://reqres.in/api/users"
    func parseJsonUrl(completion : @escaping([Employee])->()){
        if let url = URL(string: urlString){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil{
                    do{
                        let SharedUrlSession = try JSONDecoder().decode(EmployeeData.self, from: data!)
                        self.empArr = SharedUrlSession.data
                        completion(SharedUrlSession.data)
                        print(self.empArr)
                        }
                    catch{
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    func saveEmployee(){

        for i in 0...5{
        let Employee = Emp(context: PersistentStorage.shared.context)
            //let Employee = NSEntityDescription.insertNewObject(forEntityName: "Emp", into: appDelegate!.context) as! Emp
            Employee.id = Int16(empArr[i].id)
            Employee.first_name = empArr[i].first_name
            Employee.last_name = empArr[i].last_name
            Employee.email = empArr[i].email
            PersistentStorage.shared.saveContext()
        }
        //fetchEmployee()
//        do{
//            try appDelegate?.context.save()
//        }
//        catch{
//            print("data is not saved")
//        }
    }

    func fetchEmployee(){

        do{
            guard let result = try PersistentStorage.shared.context.fetch(Emp.fetchRequest()) as? [Emp] else {return}
            for employee in result{
                print("fetchEmployee",employee)
                 }
            }
        catch  {
            print("fetchdataerror",error)
        }
}
//    func openDatabse()
//        {
//        context = appDelegate?.persistentContainer.viewContext
//            let entity = NSEntityDescription.entity(forEntityName: "Emp", in: context)
//            let newUser = NSManagedObject(entity: entity!, insertInto: context)
//            saveData(UserDBObj:newUser)
//
//        }

//        func saveData(UserDBObj:NSManagedObject)
//        {
//            for i in 0...5{
//                UserDBObj.setValue(empArr[i].email, forKey: "email")
//                UserDBObj.setValue(empArr[i].id, forKey: "id")
//                UserDBObj.setValue(empArr[i].first_name, forKey: "first_name")
//                UserDBObj.setValue(empArr[i].last_name, forKey: "last_name")
//
//            }
//            print("Storing Data..")
//            print(UserDBObj)
//            do {
//                try context.save()
//            } catch {
//                print("Storing data Failed")
//            }
//
//            //fetchData()
//        }
//
//        func fetchData()
//        {
//            print("Fetching Data..")
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Emp")
//            request.returnsObjectsAsFaults = false
//            do {
//                let result = try context.fetch(request)
//                for data in result as! [NSManagedObject] {
//                    let email = data.value(forKey: "email") as! String
//                    //let age = data.value(forKey: "age") as! String
//                    print("Email is :", email)
//                }
//            } catch {
//                print("Fetching data Failed")
//            }
//        }
   
}
