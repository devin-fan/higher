//
//  ListApplicantsViewController.swift
//  Higher
//
//  Created by Devin Fan on 12/14/18.
//  Copyright © 2018 Devin Fan. All rights reserved.
//

import UIKit

class ListApplicantsViewController: UIViewController {

    @IBOutlet weak var jobPickerView: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    var dataManager = DataManager.shared
    var applicants = [Applicant]()
    var jobs = [Job]()
    var currentJob = "iOS Developer" {
        didSet {
            applicants = dataManager.getApplicants(for: currentJob)
            tableView.reloadData()
        }
    }
    var currentSort: Int = 1 {
        didSet {
            applicants.sort { (one, two) -> Bool in
                let oneRating = (Array(one.ratings ?? NSSet()) as! [Rating]).first(where: { (rating) -> Bool in
                    rating.question!.number == currentSort
                })?.value ?? 0.0
                let twoRating = (Array(two.ratings ?? NSSet()) as! [Rating]).first(where: { (rating) -> Bool in
                    rating.question!.number == currentSort
                })?.value ?? 0.0
                return oneRating > twoRating
            }
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: .main), forCellReuseIdentifier: "listCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        jobPickerView.delegate = self
        jobPickerView.dataSource = self
        jobs = dataManager.getJobs()
        applicants = dataManager.getApplicants(for: currentJob)
        tableView.reloadData()
        jobPickerView.reloadComponent(0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressedQOne(_ sender: Any) {
        self.currentSort = 1
    }
    @IBAction func pressedQTwo(_ sender: Any) {
        self.currentSort = 2
    }
    @IBAction func pressedQ3(_ sender: Any) {
        self.currentSort = 3
    }
    @IBAction func pressedQ4(_ sender: Any) {
        self.currentSort = 4
    }
    @IBAction func pressedQ5(_ sender: Any) {
        self.currentSort = 5
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

extension ListApplicantsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applicants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! ListTableViewCell
        let applicant = applicants[indexPath.row]
        let ratings = Array(applicant.ratings ?? NSSet()) as! [Rating]
        cell.nameLabel.text = applicant.name
        cell.q1Label.text = String(ratings.first(where: { (rating) -> Bool in
            return rating.question!.number == 1
        })?.value ?? 0.0)
        cell.q2Label.text = String(ratings.first(where: { (rating) -> Bool in
            return rating.question!.number == 2
        })?.value ?? 0.0)
        cell.q3Label.text = String(ratings.first(where: { (rating) -> Bool in
            return rating.question!.number == 3
        })?.value ?? 0.0)
        cell.q4Label.text = String(ratings.first(where: { (rating) -> Bool in
            return rating.question!.number == 4
        })?.value ?? 0.0)
        cell.q5Label.text = String(ratings.first(where: { (rating) -> Bool in
            return rating.question!.number == 5
        })?.value ?? 0.0)
        return cell
    }
}

extension ListApplicantsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return jobs.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return jobs[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentJob = jobs[row].title!
    }
}
