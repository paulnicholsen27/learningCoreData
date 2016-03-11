//
//  ViewController.swift
//  learningCoreData
//
//  Created by Paul Nichols on 3/9/16.
//  Copyright © 2016 Paul Nicholsen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context:NSManagedObjectContext = appDel.managedObjectContext
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        var results: [AnyObject]
        
        newUser.setValue("Paul", forKey: "username")
        newUser.setValue("mybutt", forKey: "password")
        
        do {
            try context.save()
            
        } catch {
                print("error")
        }
        
        var request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            results = try context.executeFetchRequest(request)
        } catch {
            print("error")
        }
        
        for result: AnyObject in results {
            print(result)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

