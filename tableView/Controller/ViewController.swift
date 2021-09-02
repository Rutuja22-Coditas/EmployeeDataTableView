

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    //let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //Singlton instance
       
    var viewModelUser = EmployeeViewModel()
    var empArr = [Employee]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.parseJsonUrl{
                    data in
                    self.empArr = data
                }
        viewModelUser.saveEmployee()
        //viewModelUser.fetchEmployee()
    
        
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

        let details = viewModelUser.empArr[indexPath.row]

        cell?.nameLbl.text = "\(details.first_name) \(details.last_name)"
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

           tableView.deselectRow(at: indexPath, animated: true)
           let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController

           newViewController.empDetail = empArr
           newViewController.ID = indexPath.row

           self.navigationController?.pushViewController(newViewController, animated: true)
       }
}

