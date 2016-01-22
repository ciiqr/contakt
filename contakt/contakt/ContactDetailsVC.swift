//
//  ContactDetailsVC.swift
//  contakt
//
//  Created by William Villeneuve on 2016-01-18.
//  Copyright © 2016 William Villeneuve. All rights reserved.
//

import UIKit

class ContactDetailsVC: UIViewController
{
    // MARK: - Properties
    
    // MARK: Instance
    var contact: Contact? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    // MARK: Outlets
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    // MARK: - Methods
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = Visuals.backgroundColour
        
        // Ensure we always have a back button
        self.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        self.navigationItem.leftItemsSupplementBackButton = true
        
        self.configureView()
    }
    
    // MARK: Other
    func configureView() {
        // Ensure we have the views we expect
        guard let photoImageView = self.photoImageView, nameLabel = self.nameLabel, detailsLabel = self.detailsLabel
        else {
            return
        }
        
        // Update the user interface for the detail item.
        if let contact = self.contact {
            
            // TODO: Add More information... and actually display all this in a reasonable way
            
            photoImageView.image = contact.photoOrDefault()
            nameLabel.text = contact.fullName()
            // TODO: Each of these should be it's own field and they should be editable in some way (likely an edit button on the navbar)
            let nickName = contact.nickName.characters.count > 0 ? contact.nickName : "None"
            var details = "Nickname: \(nickName)\n" +
                    "Gender: \(Localized.gender(contact.gender))\n"
            // Contact Methods...
            for contactMethod in contact.contactMethods {
                details += contactMethod.info.description + ": " + contactMethod.label + ": "
                switch contactMethod.info
                {
                case .Email(let addr):
                    details += addr
                    break;
                case .Phone(let number):
                    details += number
                    break
                }
                details += "\n"
            }
            
            detailsLabel.text = details
        }
        else // No contact
        {
            photoImageView.image = nil
            nameLabel.text = nil
            // TODO: Need to improve how this looks (Probably just have a separate label)
            detailsLabel.text = "No contact selected!"
        }
    }
}

