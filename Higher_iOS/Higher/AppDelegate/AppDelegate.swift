//
//  AppDelegate.swift
//  Higher
//
//  Created by Devin Fan on 12/13/18.
//  Copyright © 2018 Devin Fan. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var preload: Bool?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let defaults = UserDefaults.standard
        let isPreloaded = defaults.bool(forKey: "isPreloaded")
        if !isPreloaded {
            preloadData()
            defaults.set(true, forKey: "isPreloaded")
        }
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Higher")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
//    private func dataFilePath() -> String {
//        return (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Preload.plist")
//    }
//
//    private func savePreload() {
//        let data = NSMutableData()
//        let archiver = NSKeyedArchiver(forWritingWith: data)
//        archiver.encode(true, forKey: "isPreloaded")
//        archiver.finishEncoding()
//        data.write(to: URL(string: dataFilePath())!, atomically: true)
//    }
//
//    private func loadPreload() -> Bool {
//        let path = dataFilePath()
//        var preload = false
//        if FileManager.default.fileExists(atPath: path) {
//            if let data = NSData(contentsOfFile: path) {
//                let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
//                preload = unarchiver.decodeBool(forKey: "isPreloaded")
//                unarchiver.finishDecoding()
//            } else {
//                print("\nFILE NOT FOUND AT: \(path)")
//            }
//        }
//        return preload
//    }
    
    private func preloadData() {
        let context = persistentContainer.viewContext
        let job1 = Job(context: context)
        job1.title = "iOS Developer"
        let job2 = Job(context: context)
        job2.title = "Ruby on Rails Developer"
        
        let question1 = Question(context: context)
        question1.question = "Which has more relevant experience?"
        question1.number = 1
        let question2 = Question(context: context)
        question2.question = "Which has worked more time in the field?"
        question2.number = 2
        let question3 = Question(context: context)
        question3.question = "Which has more depth of experience in the relevant field?"
        question3.number = 3
        let question4 = Question(context: context)
        question4.question = "Which has more breadth of experience in the relevant field?"
        question4.number = 4
        let question5 = Question(context: context)
        question5.question = "Which would you rather work with?"
        question5.number = 5
        
        let applicant0 = Applicant(context: context)
        applicant0.name = "Devin Fan"
        applicant0.addToJobs(job1)
        applicant0.addToJobs(job2)
        
        let applicant1 = Applicant(context: context)
        applicant1.name = "Tiffany Chen"
        applicant1.addToJobs(job1)
        
        let applicant2 = Applicant(context: context)
        applicant2.name = "Sean Park"
        applicant2.addToJobs(job2)
        
        let applicant3 = Applicant(context: context)
        applicant3.name = "Rich Zhu"
        applicant3.addToJobs(job2)
        
        let employee1 = Employee(context: context)
        employee1.addToJobs(job1)
        employee1.name = "iOS Developer Employee"
        employee1.username = "iosdev"
        employee1.password = "password"
        employee1.admin = false
        let employee2 = Employee(context: context)
        employee2.addToJobs(job2)
        employee2.name = "Rails Employee"
        employee2.username = "railsdev"
        employee2.password = "password"
        employee2.admin = false
        let admin = Employee(context: context)
        admin.name = "HR Employee"
        admin.username = "admin"
        admin.password = "password"
        admin.admin = true
        
        saveContext()
    }
}

