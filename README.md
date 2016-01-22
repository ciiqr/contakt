# contakt
iOS address book app

![Icon][icon]

![Screenshot Split][screenshot-split]
![Screenshot Search][screenshot-search]

## Summary
This project is a work in progress.
### Approach
I first designed on paper what I would optimally like the app to look like.
![The initial diagram][initial-diagram]
Then I started thinking about the model, I wanted something flexible enough to implement the features I had in mind and not too complex, I decided to leverage swift's enums (which are more a [typed union](https://en.wikipedia.org/wiki/Union_type)) to have different contact methods and store the associated info along with them. The different contact methods each have a way to initiate contact for their given type (ie. email with mailto:).
When it came to implementing the contact list it was clear that I would need an [OrderedDictionary](https://github.com/ciiqr/contakt/blob/master/contakt/contakt/OrderedDictionary.swift) of which swift's standard library doesn't contain so I went about and implemented [my own](https://github.com/ciiqr/contakt/blob/master/contakt/contakt/OrderedDictionary.swift). It uses a predicate to order it's keys and is implemented as an array of tuples.

### Completed features
* Swipe on a contact to email/phone
	* Go to the email/phone app when pressed
	* Doesn't display the button if the contact doesn't have any of the specific type (email or phone) (first 2 in sample data are examples of this)
* Search bar which filters the list of contacts
	* Can search through all of a contacts fields, only their names or only their other fields
	* Split the search string on spaces and check for each part so that the user can enter things like 'cl su' to find 'Clayton Sutton'
* Display the contacts with their full name and middle initial in the list
	* as well as their optional nickname
* Display their associated photo (or the default if they don't have one...)
* Sort the contacts into sections based on first or last name then sort based on the other within the sections
* Go to the contact details vc when pressed and display more contact information
* Display (in the contact details vc) the photo as 1/3 of the size of the parent no matter the device or orientation with the full name taking up the other 2/3 of space
* The rest of the details listed below
* A generally appealing colour scheme (though overall design needs improvement)
* Partially implemented section index titles (the sort of scroll bar with letters) which could be improved to display all letters no matter what's actually in the list, (I personally like it this way but, it makes more sense to keep it consistent with other iOS apps)

### TODO
* Various UI improvements (1-2 hours)
* Actual addresses (30 minutes)
* Store the contacts in either core data or sqlite (currently just have a static list of contacts) (1-2 days)
* Create/Update/Delete contacts (6-8 days, though 3-4 for basic functionality)
* Contact details vc should display bottom list of details in a more reasonable way (2-3 days)
	* Long press on a field to allow editing of that field) (1 hour)
	* Tapping on one of the contact methods should initiate contact (ie. make phone call to the given number) (1 hour)
* Unit testing, I did a small amount of unit testing while figuring out and UIColor(hex:) UIColor(hexAlpha:) but overall testing is lacking (5-6 days)

#### Maybe
* Styling the last name differently (ie. bolding) in the list (30 minutes)
* LaunchScreen (2 hours)
* Save to a vCard(.vcf) file (2 hours)
* Custom url to import contacts from other apps (4-5 hours)
* Load contacts from facebook, google, etc (2 days each)

## Legal
Public domain, see [LICENSE](https://github.com/ciiqr/contakt/blob/master/LICENSE) for more info.
### Icon
The icon is based on this image [People by Richard Pasqua from the Noun Project](https://thenounproject.com/term/people/12342/).


[//]: # (Resource References)
[initial-diagram]: http://williamvilleneuve.ca/static-resources/github/contakt/images/initial-design.jpg "Initial Design Sketch"
[screenshot-search]: http://williamvilleneuve.ca/static-resources/github/contakt/images/screenshot-search.png "Screenshot of Search"
[screenshot-split]: http://williamvilleneuve.ca/static-resources/github/contakt/images/screenshot-split.png "Screenshot of Split View"
[icon]: http://williamvilleneuve.ca/static-resources/github/contakt/images/icon-styled.png "App icon"
