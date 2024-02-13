import mysql.connector

# MySQL connection parameters
host = 'localhost'  # Change to your MySQL host if necessary
user = 'your_username'  # Change to your MySQL username
password = 'your_password'  # Change to your MySQL password

try:
    # Connect to MySQL server
    connection = mysql.connector.connect(
        host=host,
        user=user,
        password=password
    )

    # Create cursor object
    cursor = connection.cursor()

    # Execute SQL query to get list of databases
    cursor.execute("SHOW DATABASES")

    # Fetch all rows
    databases = cursor.fetchall()

    # Print list of databases
    print("List of databases:")
    for db in databases:
        print(db[0])

except mysql.connector.Error as err:
    print("Error:", err)

finally:
    # Close connection
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")
