

import UIKit
import CoreData
import Kingfisher

class DetailsViewController: UIViewController {

    var empDetail:[Employee]?
    var detailsViewModel = EmployeeViewModel()
    var ID: Int?
    
    //let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var empImage: UIImageView!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        details(emp: empDetail![ID!])
        //saveData()
    }
    func details(emp: Employee){
        idLbl.text = "\(emp.id)"
        firstNameLbl.text = emp.first_name
        lastNameLbl.text = emp.last_name
        emailLbl.text = emp.email
        empImage.kf.setImage(with: URL(string: emp.avatar))
    }
    
//    func saveData(){
//        let dictionary = ["id":idLbl.text!,"first_name":firstNameLbl.text!,"last_name":lastNameLbl.text!,"email":emailLbl.text!]
//        print("Dictionary",dictionary)
//        EmployeeViewModel.sharedInstance.save(object: dictionary)
//    }
}
