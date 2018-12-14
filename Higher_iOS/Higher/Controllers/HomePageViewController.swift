//
//  HomePageViewController.swift
//  Higher
//
//  Created by Devin Fan on 12/13/18.
//  Copyright © 2018 Devin Fan. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        weak var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        guard let context = appDelegate?.persistentContainer.viewContext else { return }
        
        
        // Do any additional setup after loading the view.
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
