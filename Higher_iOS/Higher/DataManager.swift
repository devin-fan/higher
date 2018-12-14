//
//  DataManager.swift
//  Higher
//
//  Created by Devin Fan on 12/13/18.
//  Copyright © 2018 Devin Fan. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    
    var currentUser: Employee?
    
    func attemptLogin(username: String, password: String, admin: Bool) -> Employee? {
        weak var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        guard let context = appDelegate?.persistentContainer.viewContext else { return nil }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        request.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            if result.count > 0 {
                if let employee = result[0] as? Employee {
                    if admin {
                        return employee.admin ? employee : nil
                    } else {
                        return employee
                    }
                }
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func getRandomCandidates(jobTitle: String) -> [Applicant] {
        weak var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        guard let context = appDelegate?.persistentContainer.viewContext else { return [] }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Applicant")
        request.predicate = NSPredicate(format: "ANY jobs.title == %@", jobTitle)
        do {
            let result = try context.fetch(request) as! [Applicant]
            return [result.randomElement()!] + [result.randomElement()!]
        } catch {
            print(error)
        }
        return []
    }
    
    func getQuestions() -> [Question] {
        weak var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        guard let context = appDelegate?.persistentContainer.viewContext else { return [] }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Question")
        do {
            let result = try context.fetch(request) as! [Question]
            return result
        } catch {
            print(error)
        }
        return []
    }
    
    func newRating() -> Rating {
        weak var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context = (appDelegate?.persistentContainer.viewContext)!
        let rating = Rating(context: context)
        rating.value = 50.0
        rating.comparisons = 0
        return rating
    }
    
    func getApplicants(for jobTitle: String) -> [Applicant] {
        weak var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        guard let context = appDelegate?.persistentContainer.viewContext else { return [] }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Applicant")
        request.predicate = NSPredicate(format: "ANY jobs.title == %@", jobTitle)
        do {
            let result = try context.fetch(request) as! [Applicant]
            return result
        } catch {
            print(error)
        }
        return []
    }
    
    func getJobs() -> [Job] {
        weak var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        guard let context = appDelegate?.persistentContainer.viewContext else { return [] }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Job")
        do {
            let result = try context.fetch(request) as! [Job]
            return result
        } catch {
            print(error)
        }
        return []
    }
}
