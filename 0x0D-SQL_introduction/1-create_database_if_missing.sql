import mysql.connector

# MySQL connection parameters
host = 'localhost'  # Change to your MySQL host if necessary
user = 'your_username'  # Change to your MySQL username
password = 'your_password'  # Change to your MySQL password
database = 'hbtn_0c_0'  # Database name to create

try:
    # Connect to MySQL server
    connection = mysql.connector.connect(
        host=host,
        user=user,
        password=password
    )

    # Create cursor object
    cursor = connection.cursor()

    # Execute SQL query to create the database
    cursor.execute("CREATE DATABASE IF NOT EXISTS {}".format(database))

    print("Database '{}' created successfully.".format(database))

except mysql.connector.Error as err:
    print("Error:", err)

finally:
    # Close connection
    if 'connection' in locals() and connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")
