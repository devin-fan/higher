//
//  UserHomePageViewController.swift
//  Higher
//
//  Created by Devin Fan on 12/13/18.
//  Copyright © 2018 Devin Fan. All rights reserved.
//

import UIKit

class UserHomePageViewController: UIViewController {

    @IBOutlet weak var introLabel: UILabel!
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let employee = employee {
            introLabel.text = "Hello, " + employee.name!
        }
    }
    
    @IBAction func pressedLogoutButton(_ sender: Any) {
        DataManager.shared.currentUser = nil
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
