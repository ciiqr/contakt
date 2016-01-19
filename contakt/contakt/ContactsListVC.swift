//
//  ContactsListVC.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-18.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import UIKit

class ContactsListVC: UITableViewController
{
    // MARK: Instance Variables
    var detailViewController: ContactDetailsVC? = nil
    
    var sectionHeaders = [String]()
    // TODO: Would prefer this as a single collection (a map of section titles to contact arrays) but swift doesn't have an ordered dictionary and so this is simpler for this small demo application, the count of contacts and section headers should be the same
    var contacts = [[Contact]]()
    
    // MARK: Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adjust the colour of the letters
        tableView.sectionIndexColor = Visuals.navBarColour
        
        // Add additional views
        loadSortOrderSwitcher()
        loadAddNewContactButton()
        
        // If we have a splitViewController, use it to retrieve the detailsViewController
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            // TODO: No explicit unwrapping
            self.detailViewController = (controllers[controllers.count-1] as? UINavigationController)!.topViewController as? ContactDetailsVC
        }
        
        // Start loading the contacts
        loadContacts()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    // MARK: Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let index = self.tableView.indexPathForSelectedRow {
                // TODO: Remove use of force unwrapping
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! ContactDetailsVC
                controller.contact = contacts[index.section][index.row]
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // TODO: Support different sorting orders...
        
        return sectionHeaders.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    
    // TODO: Change this so it lists all letters, #, and then a final one for other characters...
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return sectionHeaders;
    }
    
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return index;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < contacts.count {
            return contacts[section].count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath)
        
        let contact = contacts[indexPath.section][indexPath.row]
        
        cell.textLabel!.text = contact.fullName(middleInitial: true)
        
        // TODO: Shouldn't use forced optional unwrapping, even though the default project did so...
        if let nickName = contact.nickName {
            cell.detailTextLabel!.text = nickName
        }
        else {
            cell.detailTextLabel!.text = ""
        }
        // TODO: Maybe contact.photo should be a property that just returns the default if it isn't set?
        if let photo = contact.photo {
            cell.imageView!.image = photo
        }
        else {
            cell.imageView!.image = Contact.defaultPhoto
        }
        
        // TODO: Apply a circular mask to the contact photo
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath index: NSIndexPath) {
        if editingStyle == .Delete {
            contacts.removeAtIndex(index.row)
            tableView.deleteRowsAtIndexPaths([index], withRowAnimation: .Fade)
        }
        else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        // NOTE: This only displays the actions that the specific contact supports
        
        let contact = contacts[indexPath.section][indexPath.row]
        var actions = [UITableViewRowAction]()
        
        // Has at least 1 email
        if contact.contactMethods.any({$0.isEmail}) {
            let email = UITableViewRowAction(style: .Normal, title: "Email", handler: emailActionHandler)
            email.backgroundColor = Visuals.contactSwipeEmailAction
            actions.append(email)
        }
        
        // Has at least 1 phone
        if contact.contactMethods.any({$0.isPhone}) {
            let phone = UITableViewRowAction(style: .Normal, title: "Phone", handler: phoneActionHandler)
            phone.backgroundColor = Visuals.contactSwipePhoneAction
            actions.append(phone)
        }
        
        return actions
    }
    
    // MARK: Utilitiy Functions
    
    private func loadContacts() {
        // TODO: There should be loading indicators...
        // TODO: Will need ensure the data is in the correct order... based on the current sort order
        
        // TODO: App delegate should start loading/caching the contacts as soon as possible so that we can retrieve them slightly faster once we get here
        ContactLoader.loadContacts { (sectionHeaders, contacts) in
            // TODO: This should check if there's any existing contacts in the array and merge the lists (in the case where loading takes a while and the user has added a new contact in the mean time)
            self.sectionHeaders = sectionHeaders
            self.contacts = contacts
            
            self.onDoneLoadingContacts()
        }
    }
    
    private func onDoneLoadingContacts() {
        // Select first but only if we're displaying the detailVC
        
        // TODO: Need to fix this... atm we don't display the contacts info until the user selects one of them... ugh
        // NOTE: window is a double optional...
        if let split = self.splitViewController {
            // Ensure we're displaying the detailVC
            if split.collapsed && contacts.count > 0 && contacts[0].count > 0 {
                // Select the first contact
                // TODO: should use selectRowAtIndexPath instead
                self.detailViewController?.contact = contacts[0][0]
            }
        }
    }
    
    func onSortOrderSwitcherChange(segment: UISegmentedControl) {
        Alert.displaySimple(self, title: "Sorry!", message: "This feature has not been implemented yet...")
        
        // TODO: These should be more closely linked with the actual array below...
        let FIRST_NAME_INDEX = 0
        let LAST_NAME_INDEX = 1
        
        // TODO: Implement these...
        switch (segment.selectedSegmentIndex)
        {
        case FIRST_NAME_INDEX:
            
            break;
        case LAST_NAME_INDEX:
            
            break;
        default:
            // TODO: Handle error...
            break;
        }
    }
    
    private func loadSortOrderSwitcher() {
        // TODO: Would be nice to support other orders...
        let segmentedControl: UISegmentedControl = UISegmentedControl(items: ["First", "Last"])
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: "onSortOrderSwitcherChange:", forControlEvents: .ValueChanged)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentedControl)
    }
    
    private func loadAddNewContactButton() {
        // TODO: Implement add new Contact
    }
    
    private func initiateContact(contact: Contact, contactMethod: ContactMethod)
    {
        if !contactMethod.initiateContact() {
            Alert.displaySimple(self, title: "Error", message: "Couldn't initiate contact with foreign entity \"\(contact.firstName)\" (doesn't work on simulators)")
        }
    }

    // TODO: Test these on device...
    private func emailActionHandler(action: UITableViewRowAction, index: NSIndexPath) {
        // TODO: Need to implement a better way to find the appropriate email(label=main), or just present a list
        // Currently sends email to first email found
        let contact = self.contacts[index.section][index.row]
        for contactMethod in contact.contactMethods {
            switch contactMethod.info
            {
            case .Email:
                initiateContact(contact, contactMethod: contactMethod)
                return
            default: break
            }
        }
    }
    
    private func phoneActionHandler(action: UITableViewRowAction, index: NSIndexPath) {
        // TODO: Need to implement a better way to find the appropriate phone(label=main), or just present a list
        // Currently calls the first number found
        let contact = self.contacts[index.section][index.row]
        for contactMethod in contact.contactMethods {
            switch contactMethod.info
            {
            case .Phone:
                initiateContact(contact, contactMethod: contactMethod)
                return
            default: break
            }
        }
    }
}
