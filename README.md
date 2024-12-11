# README

Minesweeper Board Generator
This is a Minesweeper Board Generator built with Ruby on Rails. The game allows users to generate Minesweeper board on a grid of cells, with the ability to conceal and reveal cells.

Features
Dynamic Minesweeper Grid: A random grid with cells that contain mines or numbers indicating adjacent mines.
Cell Reveal Mechanism: Cells can be revealed by hovering over them.
Conceal Board: Ability to conceal and reveal the board at any time by clicking the "Conceal Board" button.

Requirements
Before running the application, make sure you have the following installed:

Ruby (version 3.0 or higher)
Rails (version 7.0 or higher)
Node.js and Yarn (for managing JavaScript dependencies)
PostgreSQL or your preferred database (configured in the config/database.yml)
Getting Started
1. Clone the Repository
First, clone the repository to your local machine:
git clone https://github.com/AbeehaIshfaq/minesweeper_app.git
cd minesweeper_app
2. Install Ruby and Rails Dependencies
Make sure you have Ruby installed, then install the required Ruby gems:
bundle install
3. Set Up the Database
Next, set up the database by running the following commands:
rails db:create
rails db:migrate
If you're using a different database than PostgreSQL, make sure to modify the config/database.yml file.

4. Install JavaScript Dependencies
Since the game uses JavaScript for dynamic interactivity, install the required JavaScript packages:
yarn install
5. Run the Server
Start the Rails server:
rails server
By default, the app will be available at http://localhost:3000.

Usage
Once the server is running, navigate to the following URLs to access different parts of the app:

Home Page: Prompts to enter your email address, a board width, a board height, the number of mines, and a board name. Also displays ten most recently generated boards.
Board Page: Where users can interact with the Minesweeper grid, conceal/reveal cells.
All Boards Page: Contains lists all of the boards generated by the app.
How to Play
Reveal a Cell: Hover over a cell to reveal its content. If the cell contains a number, it indicates how many mines are adjacent to it.
Conceal the Board: Click the "Reveal Board" button to reveal the grid. You can click it again to conceal the grid.

Testing
To run tests for this project, use RSpec for unit and integration testing.

Run Unit Tests
bundle exec rspec

Deployment
Deploying to Heroku
Create a Heroku Application:

heroku create your-app-name

Push to Heroku:
git push heroku main

Set Up the Database on Heroku:
heroku run rails db:migrate

Open the Application:
heroku open
