//
//  ContactsListVC.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-18.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import UIKit

enum ContactsSortOrder {
    case LastName
    case FirstName
    // TODO: Other sort orders?
}

class ContactsListVC: UITableViewController
{
    // MARK: Instance Variables
    var detailViewController: ContactDetailsVC? = nil
    
    // This is an unsorted list of contacts
    var contactsList = [Contact]()
    // This is a sorted dictionary mapping section headers to lists of contacts
    // TODO: Will want to sort the [Contact] arrays based on the secondary sort order...
    // TODO: Change the array below to be an OrderedArray that sorts based on sortOrderKey(secondarySortOrder, forContact: contact)
    var filteredContacts = OrderedDictionary<String, OrderedArrayEquatable<Contact>>()
    
    static let selectableSortOrders: [ContactsSortOrder] = [.FirstName, .LastName]
    var primarySortOrder = ContactsSortOrder.LastName {
        didSet {
            // Only re-sort if the sort order has changed
            if primarySortOrder == oldValue {
                return
            }
            // re-order contatcs based on new sort order...
            updateFilteredContacts()
            
            // Update ui
            tableView.reloadData()
        }
    }
    var secondarySortOrder: ContactsSortOrder {
        switch primarySortOrder
        {
        case .FirstName:
            return .LastName;
        case .LastName:
            return .FirstName;
        }
    }
    
    // MARK: Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adjust the colour of the letters
        // TODO: Create 2 special properties for these contactsListSectionIndexColor, contactsListSectionIndexBackgroundColor
        tableView.sectionIndexColor = Visuals.navBarColour
        tableView.sectionIndexBackgroundColor = Visuals.backgroundColour
        // TODO: Consider dynamically setting tableView.sectionIndexMinimumDisplayRowCount based on the current size and number of visible rows... This way we can have it only display if there's a lot of contacts...
        
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
                // TODO: Ensure we actuallt have these indexes...?
                controller.contact = contactFor(index)
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return filteredContacts.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // TODO: What happens when the section header is more than a single character?...
        return self.filteredContacts[OrderedDictionaryIndex(section)].key
    }
    
    // TODO: Change this so it lists all letters, #, and then a final one for other characters...
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return [String](self.filteredContacts.keys)
    }
    
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return index;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < filteredContacts.count {
            return filteredContacts[OrderedDictionaryIndex(section)].value.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath)
        
        let contact = contactFor(indexPath)
        
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
        
        // TODO: Apply a circular mask to the contact photo (also, default photo should have a white background once  get around to doing this)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath index: NSIndexPath) {
        if editingStyle == .Delete {
            removeContact(index)
        }
        else if editingStyle == .Insert {
            // TODO: Implement (If section already exists, insert appropriatly, else, insert new section with given row)
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        // NOTE: This only displays the actions that the specific contact supports
        
        let contact = contactFor(indexPath)
        var actions = [UITableViewRowAction]()
        
        // TODO: Need contactMethodDisplayName for the Email and Phone strings
        // Has at least 1 email
        if contact.contactMethods.any({$0.isEmail}) {
            let email = UITableViewRowAction(style: .Normal, title: "Email", handler: emailActionHandler)
            email.backgroundColor = Visuals.contactSwipeEmailActionColour
            actions.append(email)
        }
        
        // Has at least 1 phone
        if contact.contactMethods.any({$0.isPhone}) {
            let phone = UITableViewRowAction(style: .Normal, title: "Phone", handler: phoneActionHandler)
            phone.backgroundColor = Visuals.contactSwipePhoneActionColour
            actions.append(phone)
        }
        
        return actions
    }
    
    // MARK: - TODO
    
    private func contactFor(indexPath: NSIndexPath) -> Contact {
        return filteredContacts[OrderedDictionaryIndex(indexPath.section)].value[indexPath.row]
    }
    
    private func removeContact(index: NSIndexPath)
    {
        let dictionaryKey = filteredContacts[OrderedDictionaryIndex(index.section)].key
        let arrayIndex = index.row
        
        // NOTE: Because arrays are value types, we need to make a new one and then re-assign, hopefully the compiler will recognize this and optimize...
        // TODO: Test the performance of this...
        
        // Get the contact array
        var potentialSectionContacts = filteredContacts[dictionaryKey]
        // TODO: if the above is nil, something went wrong...
        assert(potentialSectionContacts != nil)
        
        // Remove the contact
        // TODO: also need to delete from contactsList...
        potentialSectionContacts?.removeAtIndex(arrayIndex)
        
        // Either
        if potentialSectionContacts?.count > 0 {
            // Remove the row
            tableView.deleteRowsAtIndexPaths([index], withRowAnimation: .Fade)
        }
        else {
            // Remove the entire section
            tableView.deleteSections(NSIndexSet(index: index.section), withRowAnimation: .Fade)
        }
    }
    
    private func contactSection(contact: Contact) -> String? {
        return sortOrderKey(primarySortOrder, forContact: contact)
    }
    
    private func sortOrderKey(sortOrder: ContactsSortOrder, forContact contact: Contact) -> String? {
        // TODO: Decide if I don't want to just force title case for the names, making this irrelevant...
        switch sortOrder
        {
        case .FirstName:
            if let character = contact.firstNameFirstCharacter {
                return character.uppercaseString
            }
            break
            
        case .LastName:
            if let character = contact.lastNameFirstCharacter {
                return character.uppercaseString
            }
            break
        }
        return nil
    }
    
    private func sectionContactsOrderPredicate(first: Contact, second: Contact) -> Bool {
        switch secondarySortOrder
        {
        case .FirstName:
            return first.firstName < second.firstName
        case .LastName:
            return first.lastName < second.lastName
        }
    }
    
    private func updateFilteredContacts() {
        // Remove old contatcs
        // TODO: Maybe rename to orderedContacts...
        self.filteredContacts.removeAll(keepCapacity: true)
        
        // Add all new contacts...
        for contact in self.contactsList {
            // TODO: move some of this to a separate method with a parameter for whether to update the ui...
            if let sectionHeader = self.contactSection(contact) {
                // Either
                if let _ = self.filteredContacts[sectionHeader] {
                    // append to existing array
                    self.filteredContacts[sectionHeader]!.append(contact)
                }
                else { // create a new array
                    self.filteredContacts[sectionHeader] = OrderedArrayEquatable(predicate: sectionContactsOrderPredicate, elements: contact)
                }
            }
            else {
                // TODO: Handle improper contact without section
            }
        }
    }
    
    private func loadContacts() {
        // TODO: There should be loading indicators...
        // TODO: Will need ensure the data is in the correct order... based on the current sort order
        
        // TODO: App delegate should start loading/caching the contacts as soon as possible so that we can retrieve them slightly faster once we get here
        
        // TODO: Store contacts array and when the sort order changes, it needs to change... the contacts dictionary pretty much entirely...
        ContactLoader.loadContacts { (contacts) in
            // TODO: This should check if there's any existing contacts in the array and merge the lists (in the case where loading takes a while and the user has added a new contact in the mean time)
            
            self.contactsList = contacts
            self.updateFilteredContacts()
            
            self.onDoneLoadingContacts()
        }
    }
    
    private func onDoneLoadingContacts() {
        // Select first but only if we're displaying the detailVC
        
        // TODO: Need to fix this... atm we don't display the contacts info until the user selects one of them... ugh
        // NOTE: window is a double optional...
        //        if let split = self.splitViewController {
        // Ensure we're displaying the detailVC
        // TODO: Fix this up a bit
        //            if split.collapsed && contacts.count > 0 && contacts[0].count > 0 {
        //                // Select the first contact
        //                // TODO: should use selectRowAtIndexPath instead
        //                self.detailViewController?.contact = contacts[0][0]
        //            }
        //        }
    }
    
    func onSortOrderSwitcherChange(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex >= ContactsListVC.selectableSortOrders.count {
            // TODO: Handle error index...
        }
        
        // Update sort order
        self.primarySortOrder = ContactsListVC.selectableSortOrders[segment.selectedSegmentIndex]
    }
    
    private func loadSortOrderSwitcher() {
        let sortOrderOptions = ContactsListVC.selectableSortOrders.map(sortOrderDisplayName)
        
        // Create segmented control
        let segmentedControl: UISegmentedControl = UISegmentedControl(items: sortOrderOptions)
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: "onSortOrderSwitcherChange:", forControlEvents: .ValueChanged)
        
        // Set as the right item
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentedControl)
    }
    
    private func loadAddNewContactButton() {
        // TODO: Implement add new Contact
    }
    
    private func sortOrderDisplayName(order: ContactsSortOrder) -> String {
        // TODO: Localized...
        switch order
        {
        case .FirstName:
            return "First"
        case .LastName:
            return "Last"
        }
    }
    
    private func initiateContact(contact: Contact, contactMethod: ContactMethod)
    {
        if !contactMethod.initiateContact() {
            Alert.displaySimple(self, title: "Error", message: "Couldn't initiate contact with foreign entity \"\(contact.firstName)\"")
        }
    }
    
    // TODO: Test these on device...
    private func emailActionHandler(action: UITableViewRowAction, index: NSIndexPath) {
        // TODO: Need to implement a better way to find the appropriate email(label=Main), or just present a list
        // Currently sends email to first email found
        // TODO: ? Ensure we have this index...
        let contact = contactFor(index)
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
        // TODO: ? Ensure we have this index...
        let contact = self.contactFor(index)
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
