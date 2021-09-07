//
//  ReachabilityViewController.swift
//  tableView
//
//  Created by Coditas on 06/09/21.
//

import UIKit
import Reachability

class ReachabilityViewController: UIViewController {

    let reachability = try! Reachability()
    override func viewDidLoad() {
        super.viewDidLoad()
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
                if let networkVC = self.storyboard?.instantiateViewController(identifier: "ViewController")as? ViewController{
                    //self.present(networkVC,animated: true)
                    self.navigationController?.pushViewController(networkVC, animated: true)
                }

            }
                else {
                print("Reachable via Cellular")
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            
            if let networkViewController = self.storyboard?.instantiateViewController(identifier: "RealmDbViewController")as? RealmDbViewController{
                //self.present(networkViewController, animated: true)
                self.navigationController?.pushViewController(networkViewController, animated: true)
            }
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
}
