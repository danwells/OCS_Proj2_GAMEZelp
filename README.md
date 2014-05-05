# GAMEZelp 
## Video game guide search utility

This project was bourne out of a need to collect similar information from various help sites and put it in one easy to access location.  In particular, there are many different sites on the web that offer valuable information for those seeking answers or strategies for fully completing a video game and getting the most "bang for the buck" from it.  This project was driven from personal interest and also fullfilled requirements for a class assignment in the Omaha Code School.

The idea was to allow a user to enter a game title once and have the app collect links to relevant guides on some well known gaming help sites.  The links are grouped and listed in a display box for each site.  This scenario allows for a much more consolidated and automated reference. It automates the manual process of going to each site and searching for a game multiple times.

The technical core of the application uses the Nokogiri gem to collect the information from a site and extract the relevant information.  Although there is still a lot of manual configuration by the author, the end user is presented with a tool that will save time and effort in searching for help.

The application was designed to be resonsive so that it may be used on everything from a desktop to a mobile device.

Because each search can be time-intensive, an animated graphic was installed to provide feedback during data collection and long computations.

The time alloted for the class assignment was short, so not all planned features were implemented.  Over the course of time, the author hopes to implement some or all of the following features:
- User accounts to be able to store individualized lists of game titles
- Search function on the remaining game sites (3 of 7 currently implemented)
- Adding more sites to the page 
- Cached results to avoid time-intensive searches everytime the app is used
- Filtering by gaming system
- AJAX implementation for smoother flow and fewer page reloads
- Improvements in overall page design
- Email notification options

Disclaimer: This site is open source, non-profit, and intended for personal use as a utility. 
