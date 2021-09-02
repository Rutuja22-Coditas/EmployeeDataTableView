

import UIKit
import CoreData
import UIKit

class EmployeeViewModel{
    var empArr = [Employee]()
    
    
    //static var sharedInstance = EmployeeViewModel()
    //let context = (UIApplication.shared.delegate as? AppDelegate)? .persistentContainer.viewContext
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
            let a = Emp(context: PersistentStorage.shared.context)
            a.id = Int16(empArr[i].id)
            a.first_name = empArr[i].first_name
            a.last_name = empArr[i].last_name
            a.email = empArr[i].email
            //print(a)
        }
        PersistentStorage.shared.saveContext()
        fetchEmployee()
        
}
    func fetchEmployee(){
        
        do{
            guard let result = try PersistentStorage.shared.context.fetch(Emp.fetchRequest()) as? [Emp] else {return}
            }catch  {
            print(error)
        }
}
   
}
