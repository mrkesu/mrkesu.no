# mrkesu.no

Testing out Hugo

## Azure specific

| files or settings                   | comment                                                                                             |
| ----------------------------------- | --------------------------------------------------------------------------------------------------- |
| bicep/                              | resource deployment                                                                                 |
| src/static/staticwebapp.config.json | Static web app configuration: https://learn.microsoft.com/en-us/azure/static-web-apps/configuration |

## Some useful commands

### Theme

Must be performed after new clone under src/ folder, and update must be ran every time changes to the theme is made.

| command              | description             |
| -------------------- | ----------------------- |
| git submodule init   | initialize local config |
| git submodule update | fetch submodule         |

### Hugo stuff

All commands are under /src unless otherwise noted

| command                | description            |
| ---------------------- | ---------------------- |
| New post               | hugo new post/new-post |
| Start local web server | hugo server -D         |
