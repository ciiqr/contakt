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
    // MARK: Instance Variables
    // MARK Outlets
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    // MARK: Properties
    var contact: Contact? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = Visuals.backgroundColour
        
        self.configureView()
    }
    
    // MARK: Methods
    func configureView() {
        // Update the user interface for the detail item.
        if let contact = self.contact,
            photoImageView = self.photoImageView,
            nameLabel = self.nameLabel,
            detailsLabel = self.detailsLabel {
                
                // TODO: Add More information...
                
                if let photo = contact.photo {
                    photoImageView.image = photo
                }
                else {
                    photoImageView.image = Contact.defaultPhoto
                }
                nameLabel.text = contact.fullName()
                // TODO: Each of these should be it's own field and they should be editable in some way (likely an edit button on the navbar)
                let nickName = (contact.nickName ?? "None")
                var details = "Nickname: \(nickName)\n" +
                    "Gender: \(contact.gender)\n"
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
    }
}
