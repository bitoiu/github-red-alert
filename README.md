# GitHub Red Alert

Changes the GitHub Notification icon from blue to red when you have unread participating notifications.

## Usage

As a GitHub user I pay very close attention to the Participating notification, i.e. the notifications you get from participating on a thread or being directly mentioned by others (by handle or team). Unfortunately just by looking at the notification bell, there's no way to distinguish if the notifications are participating or generally unread. Since I don't follow generic Unread notifications as closely as I do the Participating ones, I decided to augment the UI to distinguish the two:

## Installation and configuration

1. [Visit the GitHub Red Alert Chrome Web Store listing](https://chrome.google.com/webstore/detail/github-red-alert/kmiekjkmkbhbnlempjkaombjjcfhdnfe) and click "Add". 
2. When the extensions is installed visit the Extensions page at chrome://extensions
3. You'll be asked to visit GitHub (link in the popup) and generate a personal access token
4. With the token at hand, paste it into the popup box and click save

If you now visit GitHub your Notification bell should be red if you have unread Participating notifications.

## Developing locally

Building the project
 
1. run `npm install`
2. run `bower install`
3. run `grunt` (this might you to install ruby and sass: 


Adding the dependency:

1. Clone down the repository
2. Open Tools -> Extensions
3. Check the "Developer Mode" option (if not already)
4. Select "Load unpacked extension"
5. Navigate to the project main folder and click select

## Special thank you

I've developed most of this extension by editing a very popular extension project called [github-mention-highlighter](https://github.com/benbalter/github-mention-highlighter) by GitHub user [benbalter](https://github.com/benbalter). Most of the code was re-used, including this very same README :smile: