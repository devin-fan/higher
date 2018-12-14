//
//  ConfirmCompareViewController.swift
//  Higher
//
//  Created by Devin Fan on 12/13/18.
//  Copyright © 2018 Devin Fan. All rights reserved.
//

import UIKit

class ConfirmCompareViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var comparisons: [Int]?
    var questions: [Question]?
    var applicantOne: Applicant?
    var applicantTwo: Applicant?
    var dataManager = DataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ConfirmTableViewCell", bundle: .main), forCellReuseIdentifier: "confirmCell")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedConfirmButton(_ sender: Any) {
        weak var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let ratingsOne = Array(applicantOne!.ratings ?? NSSet()) as! [Rating]
        let ratingsTwo = Array(applicantTwo!.ratings ?? NSSet()) as! [Rating]
        for (index,question) in questions!.enumerated() {
            var ratingOne = ratingsOne.first { (rating) -> Bool in
                return rating.question?.question == question.question
            }
            if ratingOne == nil {
                ratingOne = dataManager.newRating()
                ratingOne?.question = question
                applicantOne?.addToRatings(ratingOne!)
            }
            var ratingTwo = ratingsTwo.first { (rating) -> Bool in
                return rating.question?.question == question.question
            }
            if ratingTwo == nil {
                ratingTwo = dataManager.newRating()
                ratingTwo?.question = question
                applicantTwo?.addToRatings(ratingTwo!)
            }
            if comparisons![index] == 1 {
                if (ratingOne!.value) > (ratingTwo!.value) {
                    ratingOne?.comparisons += 1
                    ratingTwo?.comparisons += 1
                    ratingOne!.value += 5
                    ratingTwo!.value -= 5
                } else {
                    ratingOne?.comparisons += 1
                    ratingTwo?.comparisons += 1
                    ratingOne!.value += 10
                    ratingTwo!.value -= 10
                }
            } else {
                if (ratingTwo!.value) > (ratingOne!.value) {
                    ratingOne?.comparisons += 1
                    ratingTwo?.comparisons += 1
                    ratingOne!.value -= 5
                    ratingTwo!.value += 5
                } else {
                    ratingOne?.comparisons += 1
                    ratingTwo?.comparisons += 1
                    ratingOne!.value -= 10
                    ratingTwo!.value += 10
                }
            }
        }
        appDelegate?.saveContext()
        let viewController = navigationController?.viewControllers.first(where: { (view) -> Bool in
            if let _ = view as? UserHomePageViewController {
                return true
            }
            return false
        })
        navigationController?.popToViewController(viewController!, animated: true)
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

extension ConfirmCompareViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "confirmCell") as! ConfirmTableViewCell
        cell.questionLabel.text = questions![indexPath.row].question
        if comparisons![indexPath.row] == 1 {
            cell.applicantOneCheck.image = UIImage(named: "checkmark")
            cell.applicantTwoCheck.image = nil
        } else {
            cell.applicantOneCheck.image = nil
            cell.applicantTwoCheck.image = UIImage(named: "checkmark")
        }
        return cell
    }
    
    
}
