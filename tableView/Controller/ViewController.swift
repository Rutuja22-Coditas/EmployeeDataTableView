

import UIKit
import RealmSwift
import Reachability

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //Singlton instance
       
    var viewModelUser = EmployeeViewModel()
    var empArr = [Employee]()
    
    //var realm = try! Realm()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        reachability.whenReachable = { reachability in
//            if reachability.connection == .wifi {
//                print("Reachable via WiFi")
////                self.viewModelUser.parseJsonUrl{
////                    data in
////                    self.empArr = data
////                }
//
//            } else {
//                print("Reachable via Cellular")
//            }
//        }
//        reachability.whenUnreachable = { _ in
//            print("Not reachable")
//        }
//
//        do {
//            try reachability.startNotifier()
//        } catch {
//            print("Unable to start notifier")
//        }
        viewModelUser.parseJsonUrl{
                    data in
                    self.empArr = data
                }
        
        //DispatchQueue.main.async {
            //self.viewModelUser.saveData()
            //self.viewModelUser.deleteData()
          //  self.viewModelUser.retrieveData()
        //}
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        //viewModelUser.openDatabse()
        //DispatchQueue.main.async {
            //self.viewModelUser.saveEmployee()
            //self.viewModelUser.fetchEmployee()
            
        //}
        
        tableView.register(UINib(nibName: "arrayTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        DispatchQueue.main.async {
                    self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        empArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? arrayTableViewCell

        let details = empArr[indexPath.row]

        cell?.nameLbl.text = "\(details.first_name) \(details.last_name)"
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

           tableView.deselectRow(at: indexPath, animated: true)
//           let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let newViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController

           newViewController.empDetail = empArr
           newViewController.ID = indexPath.row

           self.navigationController?.pushViewController(newViewController, animated: true)
       }
}

