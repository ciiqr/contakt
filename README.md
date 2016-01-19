# contakt
iOS address book app

## Summary
### Approach
I first designed on paper what I would optimally like the app to look like.
![alt text][initial-diagram]
Then I started thinking about the model, I wanted something flexible enough to implement the features I had in mind and not too restrictive, I decided to leverage swift's enums (which are more a [typed union](https://en.wikipedia.org/wiki/Union_type)) to have different contact methods and store the associated info along with them. Also, to simplify code elsewhere contact methods know how to initiate contact for their given type (ie. email with mailto:). The one detail I couldn't decide on was how to represent the list of contacts. What I really wanted (an OrderedDictionary) doesn't exist in the standard swift libraries, and I wanted to avoid using any external libraries for this initial project, so I ended up compromising and simply using 2 arrays to represent the section headers and contact lists.

### Completed features
* Swipe on a contact to email/phone
	* Go to the email/phone app when pressed
	* Doesn't display the button if the contact doesn't have any of the specific type (email or phone) (first 2 in sample data are examples of this)
* Display the contacts with their full name and middle initial in the list
	* as well as their optional nickname
* Display their associated photo (or the default if they don't have one...)
* Go to the contact details vc when pressed and display more contact information
* Display (in the contact details vc) the photo as 1/3 of the size of the parent no matter the device or orientation with the full name taking up the other 2/3 of space
* The rest of the details listed below
* A generally appealing colour scheme (though overall design needs improvement)
* Partially implemented section index titles (the sort of scroll bar with letters) which could be improved to display all letters no matter what's actually in the list, (I personally like it this way but, it makes more sense to keep it consistent with other iOS apps)

### Incomplete/Missing features
* The biggest missing feature is the ability to actually store the contacts and retrieve them again (currently just uses a static list) I would have liked to use either core data or sqlite for this (1-2 days)
* Sort orders, should be able to sort based on the first or last name (with secondary sort order being the other one) (1 hour)
* Search (filter list) (1-2 hours)
* Create/Update/Delete contacts (6-8 days, though 3-4 for basic functionality)
* Load contacts from facebook, google, etc (2 days each)
* ? Save to a vCard(.vcf) file (2 hours)
* Custom url to import contacts from other apps (4-5 hours)
* Actual addresses (30 minutes)
* Contact details vc should display bottom list of details in a more reasonable way (and maybe use long press on a field to allow editing of that field) (2-3 days)
* Contact details vc tapping on one of the contact methods should initiate contact (ie. make phone call to the given number) (1-2 hours)
* Unit testing, I did a small amount of unit testing while figuring out and UIColor(hex:) UIColor(hexAlpha:) but overall testing is lacking (5-6 days)
* ? Styling the last name differently (ie. bolding) in the list (30 minutes)


## Further Development
For the most recent version of the app switch to the [develop branch](https://github.com/ciiqr/contakt/tree/develop) where I will be continuing development of this simple app. I intend to implement the other(incomplete) features listed above and possibly more...

[//]: # (Resource References)
[initial-diagram]: http://williamvilleneuve.ca/static-resources/github/contakt/images/initial-design.jpg "Initial Design Sketch"
