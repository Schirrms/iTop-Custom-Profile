# iTop-Custom-Profile
Add some profiles to iTop. Probably just a copy/paste from the very good iTop presentation

The version 0.0.1 will probably just be a copy of this excellent tutorial :
https://www.itophub.io/wiki/page?id=latest%3Acustomization%3Aadd-profile-sample

## version 0.1.0

As the use of iTop grew in our conpany, we started to need more than two profiles:

  * a (big) group of people having just the 'ReadOnly' right 
	* a very little group of iTop Administrator with full access
	
	We started to use the 'Configuration Manager' profile for 'Power Users'. But this profile didn't have all the nececcary rights in our context (maybe related to our heavy customization).
	Oddly, those profile member were allowed to remove a CI, or a Contact, but not the link between 'FunctionalCIs' and 'Contacts' (with the effective effect that they weren't able to remove a CI with Contact or a Contact with CIs) 

	So I extended this contribution to be able to deal with those situation.
