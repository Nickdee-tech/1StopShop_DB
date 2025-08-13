# 1StopShop_DB
This script creates a database named 1StopShop and then defines all four tables with the specified columns and constraints. The FOREIGN KEY declarations establish the relationships between the tables, correctly implementing the one-to-many and many-to-many relationships described in the Canvas.


To set up the database, you need access to a MySQL server and a client to execute the commands. Here are the step-by-step instructions.

Prerequisites
You need to have a MySQL database server installed and running. This can be a local installation on your machine or a remote server. You also need a client tool to connect to the server, such as the mysql command-line tool, MySQL Workbench, or another database management application.

Step-by-Step Instructions (Using the mysql command-line tool)
Save the Script: Copy the code from the "1StopShop_DB" immersive and save it as a text file with a .sql extension. A good filename would be ecommerce_db_setup.sql.

Open a Terminal: Open your terminal or command prompt.

Log in to MySQL: Connect to your MySQL server by running the following command and entering your password when prompted:
mysql -u your_username -p

Execute the Script: Once you are logged in to the MySQL prompt (mysql>), you can run the entire script using the source command. Replace /path/to/your/file/ with the actual path where you saved the file.
mysql> source /path/to/your/file/ecommerce_db_setup.sql;

This command will read the .sql file and execute all the CREATE TABLE statements, setting up the ecommerce_db database and all its tables.

Alternative Method (Using MySQL Workbench)
Open MySQL Workbench: Launch the application and connect to your MySQL server.

Open the Script: Go to File > Open SQL Script and select the ecommerce_db_setup.sql file you saved.

Execute: The script will open in a new tab. Click the lightning bolt icon (Execute) in the toolbar to run the entire script.

Both methods will create the ecommerce_db database and populate it with the Customers, Products, Orders, and Order_Items tables, complete with all the defined columns and constraints.
