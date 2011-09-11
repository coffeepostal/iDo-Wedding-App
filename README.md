# Welcome to iDo -- Wedding App

## Introduction

When I got engaged, my fiancée and I wanted an in-depth RSVP manager, along with the ability to easily tie people to the gifts they purchased us. I searched *GitHub* for a wedding app, and found a few, but most were glorified blogs, and so I created iDo.

*iDo* is still in development and is mostly targeted and my original, personal need. It is slowly getting developed further and made into a universally useful application. Keep checking back here for updates, or I guess you can _watch_ the app here on *GitHub* and keep up to date that way.

## Setup -- Admin User Setup

To create an admin user (still a Guest record, though) all you need to do is run:

    rake ido:admin

You will be prompted to type in the name of the admin user (must be at least first and last name):

    Enter the name of the admin user (e.g. John Smith):
    John Smith

It will give you the PIN associated with your new (admin) Guest record and the last name to use for logging in. Run `rails server` and visit the app in your browser (generally at localhost:3000). The login name will be your last name (“Smith” in the above example), and the PIN will be the PIN generated when your guest record was created. Using the admin guest you’ll be able to create all the other guests by navigating to `/guests`.

Thanks,

the iDo team
Adam and Dallas
