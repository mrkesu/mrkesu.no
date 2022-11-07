---
title: "Using GitHub for Intune Proactive Remediations"
date: 2022-11-05T08:34:00+02:00
draft: true
tags: ["intune", "github", "powershell", "yaml", "json"]
showToc: true
showLicense: false
---

# Why?

Using any kind of version control system is a Good Thing ™

I don't want to go too in depth with all of the technologies involved, so there are some things I will assume that you know already at minimum, or have coworkers that can do this for you:

-   Powershell
-   App registration in Azure AD, this will be used for authentication to Intune from the Github workflow. (needs permission "DeviceManagementManagedDevices.ReadWrite.All")
-   JSON, or more specifically: [Working with JSON data in PowerShell](https://devblogs.microsoft.com/scripting/working-with-json-data-in-powershell/)

### Testing to see code visualization

```json
{
    "id": "",
    "displayName": "Title of Proactive Remediation",
    "description": "Description goes her, obviously",
    "publisher": "Your Name",
    "detectionScript": "detection.ps1",
    "remediationScript": "remediation.ps1",
    "runAsAccount": "system",
    "enforceSignatureCheck": false,
    "runAs32Bit": false,
    "assignments": {
        // Here I've added two Azure AD pilot groups as an example, with various filters and schedules.
        "dev": [
            {
                "groupName": "Users - Pilot 1",
                "filter": {
                    "name": "Windows 10", // Only target Win 10 machines
                    "type": "include" // (The filter has to exist in Intune already)
                },
                "schedule": {
                    // Run every 2 hours
                    "type": "hourly",
                    "interval": "2"
                }
            },
            {
                "groupName": "Users - Pilot 2",
                "filter": {
                    "name": "Windows 11",
                    "type": "exclude" // <-- Filter to EXCLUDE all Win 11 machines
                },
                "schedule": {
                    "type": "daily",
                    "interval": "1",
                    "start": "01:00" // If start time has passed, Intune will attempt to run it as soon as possible
            }
        ],
        "prod": [
            {
                "groupName": "Users - Production",
                "filter": {
                    "name": "Windows 10",
                    "type": "include"
                },
                "schedule": {
                    "type": "daily",
                    "interval": "2",
                    "start": "01:00"
                }
            }
        ]
    }
}
```

#### Articles I read at least parts of while coding

-   TODO: Get list from Edge tabs

#### Documentation references:

-   [Graph API reference for deviceComplianceScript](https://learn.microsoft.com/en-us/graph/api/resources/intune-devices-devicecompliancescript?view=graph-rest-beta)
-   [GitHub Docs - Using workflows](https://docs.github.com/en/actions/using-workflows) - These docs are honestly written horribly confusing, and will certainly send you down the wrong path very often. Good luck.
