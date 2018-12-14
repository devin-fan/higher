//
//  ApplicantCompareViewController.swift
//  Higher
//
//  Created by Devin Fan on 12/13/18.
//  Copyright © 2018 Devin Fan. All rights reserved.
//

import UIKit

class ApplicantCompareViewController: UIViewController {

    @IBOutlet weak var applicantTwoNameLabel: UILabel!
    @IBOutlet weak var applicantOneNameLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var candidateOneView: UIView!
    @IBOutlet weak var candidateTwoView: UIView!
    let dataManager = DataManager.shared
    var candidateOne: Applicant?
    var candidateTwo: Applicant?
    var questions = [Question]()
    var currentQuestion = 0
    var comparisons = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = dataManager.getQuestions()
        comparisons = Array(repeating: 0, count: questions.count)
        let jobTitle = (dataManager.currentUser!.jobs?.anyObject() as! Job).title!
        let candidates = dataManager.getRandomCandidates(jobTitle: jobTitle)
        candidateOne = candidates[0]
        candidateTwo = candidates[1]
        applicantOneNameLabel.text = candidateOne?.name
        applicantTwoNameLabel.text = candidateTwo?.name
        candidateOneView.layer.borderColor = UIColor.black.cgColor
        candidateOneView.layer.borderWidth = 3
        candidateTwoView.layer.borderColor = UIColor.black.cgColor
        candidateTwoView.layer.borderWidth = 3
        let tapOne = UITapGestureRecognizer(target: self, action: #selector(pressedCandidateOne(sender:)))
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(pressedCandidateTwo(sender:)))
        candidateOneView.addGestureRecognizer(tapOne)
        candidateTwoView.addGestureRecognizer(tapTwo)
        questionLabel.text = questions[currentQuestion].question
        // Do any additional setup after loading the view.
    }
    
    @objc func pressedCandidateOne(sender: UITapGestureRecognizer) {
        if currentQuestion < comparisons.count {
            comparisons[currentQuestion] = 1
        }
        candidateOneView.layer.borderColor = UIColor.blue.cgColor
        candidateTwoView.layer.borderColor = UIColor.black.cgColor
    }

    @objc func pressedCandidateTwo(sender: UITapGestureRecognizer) {
        if currentQuestion < comparisons.count {
            comparisons[currentQuestion] = 2
        }
        candidateOneView.layer.borderColor = UIColor.black.cgColor
        candidateTwoView.layer.borderColor = UIColor.blue.cgColor
        
    }
    
    @IBAction func pressedBackButton(_ sender: Any) {
        if currentQuestion > 0 {
            currentQuestion -= 1
            questionLabel.text = questions[currentQuestion].question
        } else {
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func pressedNextButton(_ sender: Any) {
        if comparisons[currentQuestion] != 0 {
            currentQuestion += 1
            if currentQuestion == questions.count {
                performSegue(withIdentifier: "confirmComparison", sender: nil)
            } else {
                questionLabel.text = questions[currentQuestion].question
                candidateOneView.layer.borderColor = UIColor.black.cgColor
                candidateTwoView.layer.borderColor = UIColor.black.cgColor
            }
        } else {
            let alert = UIAlertController(title: "Selection Error", message: "Please select an applicant.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "confirmComparison" {
            if let confirmView = segue.destination as? ConfirmCompareViewController {
                confirmView.comparisons = comparisons
                confirmView.questions = questions
                confirmView.applicantOne = candidateOne
                confirmView.applicantTwo = candidateTwo
            }
        }
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
