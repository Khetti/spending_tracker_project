How to Use:
This app should ideally be run in a browser on a localhost, you will need to use a
code editor such as Atom and be running a local webserver via sinatra.
In terminal
1. Initialise database naming "spending_tracker" (createdb spending_tracker)
2. Use PSQL to connect .sql file to database and create tables (psql -d spending_tracker -f db/spending_tracker.sql)
3. Run seeds.rb to populate tables (ruby db/seeds.rb)
4. OPTIONAL: Use PSQL to check tables have populated
5. Run app.rb file to start web server (ruby app.rb)
6. Access localhost:4567/ in web browser (port number may differ, check terminal)

App Functions:
Homepage links to index
New transaction links to new transaction form - FORM SUBMIT CURRENTLY NON-FUNCTIONAL
All transactions shows a list of all transactions in database
Manage Merchants allows user to add a new merchant to database
Manage Tags allows user to add a new tag to database

Update budget allows user to update their budget for comparison to total
Newest-Oldest link sorts all transactions by timestamp in descending order from most recent
Oldest-Newest link sorts all transactions by timestamp in ascending order from oldest
Edit allows user to update a transaction - FORM SUBMIT CURRENTLY NON-FUNCTIONAL
Delete allows user to remove a transaction from the database

Technologies Used:
HTML/CSS
Ruby
SQL

Atom
Sinatra (localhost:4567)
PostgreS
MiniTest
Pry
psql
ZSH

Brief:
Spending Tracker
Build an app that allows a user to track their spending.

MVP
The app should allow the user to create, edit and delete merchants, e.g. Tesco, Amazon, ScotRail
The app should allow the user to create, edit and delete tags for their spending, e.g. groceries, entertainment, transport
The user should be able to assign tags and merchants to a transaction, as well as an amount spent on each transaction.
The app should display all the transactions a user has made in a single view, with each transaction’s amount, merchant and tag, and a total for all transactions.
Inspired by:
Monzo, MoneyDashboard, lots of mobile/online banking apps

Possible Extensions
Transactions should have a timestamp, and the user should be able to view transactions sorted by the time they took place.
The user should be able to supply a budget, and the app should alert the user somehow when when they are nearing this budget or have gone over it.
The user should be able to filter their view of transactions, for example, to view all transactions in a given month, or view all spending on groceries.
