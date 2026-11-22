# Yacht Charters : COM106 Coursework 2

SQL Files for the setup of the SQL database for COM106 coursework 2.

## Project Structure
```
│   create_tables.sql
│   data_insertion.sql
│   README.md
│
└───business-processes
        bp1-add-customer-charter.sql
```

## Relational Schema
**CUSTOMER**(customerId, name, nationality, emailAddress, phoneNumber)

**PORT**(portId, name, phoneNumber, emailAddress, dockingPlaces)

**YACHT**(yachtId, name, type, model, numberOfBerths, costOfHire, homePortId*)

**CHARTER**(charterId, startDate, duration, customerId*, yachtId*)

**VISIT**(visitId, expectedArrival, duration, charterId*, portId*)

**MAINTENANCE**(maintenanceId, startDate, duration, yachtId*)

## Processes

Business Processes are stored as Procedures, they are prefixed with `bpx-`, they can include multiple procedures where it is intended to do more than one thing. They are also accompanied by `verify-bpx` which is a targeted `SELECT` query to verify the action has taken place.

The folder `/business-processes` stores these.
