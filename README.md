# iTop-Custom-Profile
Add some profiles to iTop. Probably just a copy/paste from the very good iTop presentation

The version 0.0.1 will probably just be a copy of this excellent tutorial :
https://www.itophub.io/wiki/page?id=latest%3Acustomization%3Aadd-profile-sample

## version 0.1.0

As the use of iTop grew in our company, we started to need more than two profiles:

* a (big) group of people having just the 'ReadOnly' right 
* a very little group of iTop Administrator with full access

We started to use the 'Configuration Manager' profile for 'Power Users'. But this profile didn't have all the necessary rights in our context (maybe related to our heavy customization).
Oddly, those profile member were allowed to remove a CI, or a Contact, but not the link between 'FunctionalCIs' and 'Contacts' (with the effective effect that they weren't able to remove a CI with Contact or a Contact with CIs)

So I extended this contribution to be able to deal with those situation.

## version 0.2.0

I'm trying to create a new 'API access' profile.

The goal is to :

* Give the REST/Json access (this is not mandatory, but it will beat the use of two profiles)
* Give access to the OQL Query module and the Datamodel module in the back portail
* Allow the access to the user token profile
* and also a full 'read only' access to the back portal.

I'm not sure how to activate the third point…

### Summary

As far as I understand, the 'simple' goal to give access to the REST/Api, to the management of personal token and the access to the Datamodel, the OQL query is achieved in different places:

* REST/Json access: this doesn't seems to be integrated as a group or a class, it's a specific profile. So the user wanting to access the API needs to be member of this profile.
* Access to the DataModel and the OQL Query: This is the goal of this version of the extension, and this is allowed by the 'API Access' profile
* Right to manage personal token: this is done in adding the 'API Access' profile in the 'personal_tokens_allowed_profiles' array in the 'authent-token' part of the module section of the configuration file.
