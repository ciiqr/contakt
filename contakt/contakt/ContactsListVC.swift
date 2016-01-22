//
//  ContactsListVC.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-18.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import UIKit

// TODO: Probably move to it's own file...
enum ContactsSortOrder {
    case LastName
    case FirstName
    // TODO: Other sort orders?
}

enum ContactSearchScope {
    case All
    case Names
    case OtherInfo
    // TODO: Maybe more ;)
}

class ContactsListVC: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate
{
    // MARK: Class Properties
    static let showContactDetailsSequeIdentifier = "showDetail"
    static let selectableSortOrders: [ContactsSortOrder] = [.FirstName, .LastName]
    static let selectableSearchScopes: [ContactSearchScope] = [.All, .Names, .OtherInfo]
    
    // MARK: Instance Variables
    var detailViewController: ContactDetailsVC? = nil
    var searchController: UISearchController? = nil
    
    // This is an unsorted list of contacts
    var contactsList = [Contact]()
    // This is a sorted dictionary mapping section headers to lists of contacts
    var filteredContacts = OrderedDictionary<String, OrderedArrayEquatable<Contact>>()
    
    var primarySortOrder = ContactsSortOrder.LastName {
        didSet {
            // Only re-sort if the sort order has changed
            if primarySortOrder == oldValue {
                return
            }
            // re-order contatcs based on new sort order...
            updateFilteredContacts()
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
    
    var searchScope = ContactSearchScope.All {
        didSet {
            // Only re-sort if the search scope has changed
            if searchScope == oldValue {
                return
            }
            // re-order contatcs based on new search scope...
            updateFilteredContacts()
        }
    }
    
    // MARK: Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: have a constant for the app name...
        self.title = "Contakt"
        
        // Adjust the colour of the letters
        tableView.sectionIndexColor = Visuals.contactsListSectionIndexColor
        tableView.sectionIndexBackgroundColor = Visuals.contactsListSectionIndexBackgroundColor
        
        // Add additional views
        loadSortOrderSwitcher()
        loadAddNewContactButton()
        loadSearchController()
        
        // If we have a splitViewController, use it to retrieve the detailsViewController
        if let controllers = self.splitViewController?.viewControllers {
            
            // We have the detailsVC we expected
            if let detailsVC = (controllers[controllers.count-1] as? UINavigationController)!.topViewController as? ContactDetailsVC {
                self.detailViewController = detailsVC
            }
            else {
                // TODO: Improper detailsVC, must be a programmer error...
            }
        }
        
        // Start loading the contacts
        loadContacts()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        preselectContactIfNeedBe()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    // MARK: Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == ContactsListVC.showContactDetailsSequeIdentifier {
            var contact: Contact?
            // If a row is selected, use the contact from that index
            if let index = self.tableView.indexPathForSelectedRow {
                contact = contactFor(index)
            }
            // If the sender is an instance of Contact, use that
            else if sender is Contact {
                contact = sender as? Contact
            }
            
            // If we have a Contact instance, and the destination is a ContactDetailsVC instance as we expect, pass the contact along
            if let contact = contact, controller = (segue.destinationViewController as! UINavigationController).topViewController as? ContactDetailsVC {
                controller.contact = contact
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: Protocols
    // MARK: Table View
    // TODO: Split this up into the tableviews delegate and data source...
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return filteredContacts.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // TODO: What happens when the section header is more than a single character?...
        return self.filteredContacts[OrderedDictionaryIndex(section)].key
    }
    
    // TODO: Consider changing to list all letters... (except that then that would need to be localized...)
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        var titles = [UITableViewIndexSearch]
        titles.appendContentsOf(self.filteredContacts.keys)
        return titles
    }
    
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        // If the index is 0, we go to the search bar
        if index == 0 {
            let searchBarFrame = self.searchController!.searchBar.frame
            self.tableView.scrollRectToVisible(searchBarFrame, animated: false)
            return NSNotFound;
        }
        // Account for the search bar which isn't a section but is in the section index titles
        return index - 1;
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
    
    // MARK: UISearchResultsUpdating
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        // NOTE: this could potentially be made more efficient by checking if the new search text is simply the old text with something new appended...
        //       this would allow us to filter based on the currently filtered list.
        
        // filter contatcs based on new search text...
        updateFilteredContacts()
    }
    
    // MARK: UISearchBarDelegate
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if selectedScope >= ContactsListVC.selectableSearchScopes.count {
            // TODO: Handle error index...
        }
        
        // Update search scope
        self.searchScope = ContactsListVC.selectableSearchScopes[selectedScope]
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        // If they press search when theres only one result, go to the contacts details vc for that contact...
        if self.filteredContacts.count == 1 && self.filteredContacts[OrderedDictionaryIndex(0)].value.count == 1
        {
            // TODO: I'm not 100% convinced by this design but it required the least amount of work...
            // Get the contact
            let contact = self.contactFor(NSIndexPath.init(forItem: 0, inSection: 0))
            // Go to the detail page for the contact
            performSegueWithIdentifier(ContactsListVC.showContactDetailsSequeIdentifier, sender: contact)
        }
    }
    
    // MARK: - Methods
    
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
    
    // TODO: Should be a stand alone function...
    private func insensitiveContains(stringToSearch: String, _ stringToFind: String) -> Bool {
        return stringToSearch.lowercaseString.containsString(stringToFind.lowercaseString)
    }
    
    private func appendSearchableContactFieldsAll(inout contactFieldsToSearch: [String], contact: Contact) {
        appendSearchableContactFieldsNames(&contactFieldsToSearch, contact: contact)
        appendSearchableContactFieldsOtherInfo(&contactFieldsToSearch, contact: contact)
    }
    
    private func appendSearchableContactFieldsNames(inout contactFieldsToSearch: [String], contact: Contact) {
        contactFieldsToSearch.appendContentsOf([contact.firstName, contact.lastName, contact.middleName])
        if let nickName = contact.nickName {
            contactFieldsToSearch.append(nickName)
        }
    }
    
    private func appendSearchableContactFieldsOtherInfo(inout contactFieldsToSearch: [String], contact: Contact) {
        contactFieldsToSearch.append(genderDisplayName(contact.gender))
        
        // TODO: Consider also appending the contact method's label...
        for contactMethod in contact.contactMethods {
            switch contactMethod.info
            {
            case .Email(let addr):
                contactFieldsToSearch.append(addr)
            case .Phone(let number):
                contactFieldsToSearch.append(number)
            }
        }
        // TODO: Have to add new fields as they are added to contact... if only there was a reasonable way to ensure that would happen and not be forgotten...
    }
    
    private func contactMatchesSearch(contact: Contact, search: String) -> Bool {
        // NOTE: We split the search string on spaces so that the user can enter things like 'Ro Cun' to find 'Robert Cunningham'
        let searchParts = search.split()
        
        var contactFieldsToSearch = [String]()
        // Based on the search contect, append different fields to be searched
        switch searchScope
        {
        case .All:
            self.appendSearchableContactFieldsAll(&contactFieldsToSearch, contact: contact)
            break;
        case .Names:
            self.appendSearchableContactFieldsNames(&contactFieldsToSearch, contact: contact)
            break;
        case .OtherInfo:
            self.appendSearchableContactFieldsOtherInfo(&contactFieldsToSearch, contact: contact)
            break;
        }
        
        // Go through the parts and at least one of the fields in the contact must match the given part
        for part in searchParts {
            // If none of the fields contain this part of the search, this contact doesn't match the search
            if !contactFieldsToSearch.any({ self.insensitiveContains($0, part) }) {
                return false
            }
        }
        return true
    }
    
    private func updateFilteredContacts() {
        let searchString = self.searchController?.searchBar.text
        
        // Remove old contatcs
        // TODO: Maybe rename to orderedContacts...
        self.filteredContacts.removeAll(keepCapacity: true)
        
        // Add all new contacts...
        for contact in self.contactsList {
            // Get the section to store the contact in
            if let sectionHeader = self.contactSection(contact) {
                
                // Ensure either, the contact matches the current search OR the there is no searchController/text
                if searchString == nil || contactMatchesSearch(contact, search: searchString!) {
                    // Either
                    if let _ = self.filteredContacts[sectionHeader] {
                        // append to existing array
                        self.filteredContacts[sectionHeader]!.append(contact)
                    }
                    else { // create a new array
                        self.filteredContacts[sectionHeader] = OrderedArrayEquatable(predicate: sectionContactsOrderPredicate, elements: contact)
                    }
                }
            }
            else {
                // TODO: Handle improper contact without section
            }
        }
        
        // Update ui
        tableView.reloadData()
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
        // Select first row if necessary
        preselectContactIfNeedBe()
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
        let currentSortOrderIndex = ContactsListVC.selectableSortOrders.indexOf(primarySortOrder) ?? 0
        
        // Create segmented control
        let segmentedControl: UISegmentedControl = UISegmentedControl(items: sortOrderOptions)
        segmentedControl.selectedSegmentIndex = currentSortOrderIndex
        segmentedControl.addTarget(self, action: "onSortOrderSwitcherChange:", forControlEvents: .ValueChanged)
        
        // Set as the right item
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentedControl)
    }
    
    private func loadAddNewContactButton() {
        // TODO: Implement add new Contact
    }
    
    private func loadSearchController() {
        let searchScopes = ContactsListVC.selectableSearchScopes.map(self.searchScopeDisplayName)
        let currentSearchScopeIndex = ContactsListVC.selectableSearchScopes.indexOf(self.searchScope) ?? 0
        let controller = UISearchController(searchResultsController: nil)
        
        // Setup the search controller
        controller.searchResultsUpdater = self
        controller.dimsBackgroundDuringPresentation = false
        controller.searchBar.scopeButtonTitles = searchScopes
        controller.searchBar.selectedScopeButtonIndex = currentSearchScopeIndex
        controller.searchBar.delegate = self
        controller.searchBar.sizeToFit() // Fix for search bar sizing issues
        
        // Store controller
        self.searchController = controller
        // Add to the table view
        self.tableView.tableHeaderView = controller.searchBar
        
        // Search bar hidden by default
        self.tableView.contentOffset = CGPointMake(0, controller.searchBar.frame.size.height)
        
        // NOTE: This is necessary because otherwise when we select a contact, the search bar will still be visible...
        self.definesPresentationContext = true
    }
    
    private func preselectContactIfNeedBe() {
        // We have contacts
        if self.detailViewController?.contact == nil && filteredContacts.count > 0 && filteredContacts[OrderedDictionaryIndex(0)].value.count > 0 {
            self.detailViewController?.contact = filteredContacts[OrderedDictionaryIndex(0)].value[0]
            // TODO: The only problem with this is that the selected row is not highlighted, and I can't use tableView.selectRowAtIndexPath because that will navigate when I don't want it to... So I suppose setting highlighted on the cell's
        }
    }
    
    // TODO: These should be moved elsewhere...
    private func sortOrderDisplayName(order: ContactsSortOrder) -> String {
        // TODO: Localize
        switch order
        {
        case .FirstName:
            return "First"
        case .LastName:
            return "Last"
        }
    }
    
    private func searchScopeDisplayName(scope: ContactSearchScope) -> String {
        // TODO: Localize
        switch scope
        {
        case .All:
            return "All"
        case .Names:
            return "Names"
        case .OtherInfo:
            return "Other Info"
        }
    }
    
    private func genderDisplayName(gender: Gender) -> String {
        // TODO: Localize
        switch gender
        {
        case .Female:
            return "Female"
        case .Male:
            return "Male"
        case .NonBinary:
            return "Non-Binary"
        case .None:
            return "None"
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
