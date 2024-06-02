## `analysis_options.yaml`
A global configurations is set at the root of this repo that includes `public_member_api_docs: true` and `lines_longer_than_80_chars: true`. These are not expected for apps as line length of 80 can get tedious.

## Initialisation
Services generally need initialisation and then a way to identify the user. All service repositories will have an init method, login and logout method. Not all services will have to do something in this methods if the underlying service SDK does not have it.