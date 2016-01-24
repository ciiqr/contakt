//
//  AppDelegate.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-18.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate
{
    // MARK: - Properties
    var window: UIWindow?

    // MARK: - Protocols
    
    // MARK: UIApplicationDelegate
    func application(application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        // Override point for customization after application launch.
        let splitVC = self.window!.rootViewController as! UISplitViewController
        let navController = splitVC.viewControllers.last as! UINavigationController
        
        navController.topViewController!.navigationItem.leftBarButtonItem = splitVC.displayModeButtonItem()
        splitVC.preferredDisplayMode = .AllVisible
        splitVC.delegate = self
        
        // Change the colour of the navbar
        UINavigationBar.appearance().barTintColor = Visuals.navBarBackgroundColour
        UINavigationBar.appearance().tintColor = Visuals.navBarTint
        UINavigationBar.appearance().titleTextAttributes = Visuals.navBarTextAttributes
        
        // Change table view colours
        UITableView.appearance().backgroundColor = Visuals.backgroundColour
        UITableViewCell.appearance().backgroundColor = Visuals.backgroundColour
        
        // Change the search bar colours
        UISearchBar.appearance().barTintColor = Visuals.searchBarBackgroundColour
        UISearchBar.appearance().tintColor = Visuals.searchBarTint
        if #available(iOS 9.0, *) {
            UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).tintColor = Visuals.searchBarTextFieldTint
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication)
    {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication)
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication)
    {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication)
    {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: UISplitViewControllerDelegate
    var firstTime = true
    func splitViewController(splitViewController: UISplitViewController,
        collapseSecondaryViewController secondaryViewController:UIViewController,
        ontoPrimaryViewController primaryViewController:UIViewController) -> Bool
    {
        // Get the details controller
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? ContactDetailsVC
            else { return false }
        
        // If the details controller has nothing to display, don't show it when not necessary
        if topAsDetailController.contact == nil {
            // Return true to indicate that we have handled the collapse by doing nothing
            return true
        }
        
        // TODO: This still could be improved though (ie. when on the master vc and you rotate twice, it switches to the details vc, which could be prevented by keeping track of when the user explicitly selects a contact and when they return back from that contacts details page)
        
        // This prevents us from starting up in the contact details vc with the first contact
        if firstTime {
            firstTime = false
            return true
        }
        
        return false
    }

}

