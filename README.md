# Welcome to the Vention Interview!

The goal of this test is to create some interactive cards using HTML, CSS/SCSS, and JavaScript.

  

## Rules

- No frameworks. Vanilla JS and CSS/SCSS only (no Bootstrap).

- The layout for the cards should be responsive.

- Provide access to your code, e.g. link to a GitHub repo.

-  **Important**: The card data should be stored in JS (e.g. mocked API response).

- That’s it!

  

## What to Build

The card states are shown below. The image should fade and a button should appear when the card is hovered

over. When an item is added to the cart, an icon should appear on the top left-hand corner of the card indicating that

it has been added to the cart. A new button should now appear allowing you to remove the item from the cart, which

resets the card back to its original state.

  

## Card States

  

![alt text](/states/state-1.png  "Logo Title Text 1")

  

![alt text](/states/state-2.png  "Logo Title Text 1")

  

![alt text](/states/state-3.png  "Logo Title Text 1")

  
## Notable Features
- Near to the pixel reproduction of provided design.
- Cart persisted with cookies.
- Products resources routes limited to create and index.

## Things to Improve
- Review routes for add to cart.
- Add CSS transitions to cart status badge.
- Improve data validation and sanitization.
- Refactor drag and drop controls.
- Add image processing to give image correct aspect ratio.

## Instructions
1) Install PostgreSQL 14.
2) Start PostgreSQL: 

	**macOS**
	In the terminal execute:
	`postgres -D /path/to/postgres start`

	**Linux**
	In the terminal execute:
	`sudo service postgresql start`

	**Windows**
	In the command prompt execute:
	`postgres -D "C:\Program Files\PostgreSQL\9.6\data" start`
3) Install gems by running `bundle install`.
4) Run `rails s` to start Rails server.
5) In a web browser navigate to `http://localhost:3000/`.