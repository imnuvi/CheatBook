Auth has two phases - the vendor part and the user part


Vendor part:

Developer or the one providing service that uses the google api is the vendor.
contents of vendor part
- app registered in google cloud
- app auth credentials
- a consent screen where the user consents to provide their data by signing in

Scope : a scope is what kind of data the Vendor needs to access. eg. if you just need metadata of google docs just metadata scope is enough


User part:
- user authentication by loggin in to their google account ( optional )

- once user authorizes the app, the google auth server provides a token
- this token is user specific and can be used to access user data.
- the token needs to be refreshed after a while, so a refresh url is used







Authentication: the act of verifying if a person is who they say they are/
  User Auth: user uses a signing in app to verify their identity to the app
  App Auth: app directly authorizing with google on behalf of user for running the App

Authorization: getting required authority to perform actions on behalf of the user

Credential: a form of identifaction to perform authentication, known only by google and the App
  accepted credentials: API key, OAuth 2.0 Client ID, and service accounts.

  API Key: Credential used to request access to public data - data that is available to everyone on the internet
  OAuth2 client id: The credential used to access private data specific to the user - requires consent from the User
  client secret: a string of characters known only to the app and authorization user. must to provided only to Authorized requesters. dont include/hardcode this in the App
  Service account keys: used by services to authorize google service
  Service account: account used as in Server to Server communication, like headless apps using auth


Scope: String defining the level of access to resources. app has to request scopes for the user. "recommended" scopes have restricted access and "restricted" scope is broader

Authorization server: google server for providing access, auth token

Authorization code: code sent from auth server to obtain access token. Used only if the app is a web server app or installed app

Access token: A token granting access to  Google Workspace API - has the scopes requested in it

Resource server: the resource hosted server our app wants to call the api for

Principal: an entity attempting to authenticate something. A Principal can be the User or the app on behalf of the user


Data Type: the entity who has access to data we try to Access
  Public domain data: data accessible by anyone on the internet
  End user data: data belonging to specific end user group. usually accessed after OAuth2
  Cloud data: data owned by cloud accounts: usually accessed by Service accounts

User consent: the authorization step itself


Application type: the type of app we are trying to create - Application types are: Web application (JavaScript), Android, Chrome app, iOS, TVs and Limited Input devices, Desktop app (also called an "installed app"), and Universal Windows Platform (UWP). - for us its everything I guess lol


Service account:  A special account to represent a non human user. app assumes identity of the user and calls Google API's
Domain-wide delegation of authority: a feature that allows user data access across the Google workspace environemnt - only for super admins


Google workspace environment: the level of access or the "visible data" of all the users of an app that is visible to our app.
