#importing libraries
import sqlite3

#join with databse for the data
conn = sqlite3.connect('books.db')
c = conn.cursor()

#create function to create the table to store book info
def create_table():
    c.execute('''CREATE TABLE IF NOT EXISTS books
              (title TEXT, description TEXT, current_page INT, rating INT, related_books TEXT)''')
    
#funct 2 ADD Book if not in the table
def add_book(title, description, current_page, rating, related_books):
    c.execute("INSERT INTO books (title, description, current_page, rating, related_books) VALUES (?,?, ?, ?, ?)",
              (title, description, current_page, rating, related_books))
    
    conn.commit()
    print('Books has been added successfully! :D ')

#function to view books in the database
def view_books():
    c.execute("SELECT rowid, * FROM books")
    for row in c.fetchall():
        print(row)

#update a book that exists aleady
def update_book(id, title, description, current_page, rating, related_books):
    c.execute("UPDATE books set title = ?, description = ?, current_page = ?, rating = ?, related_books = ? WHERE rowid = ?", (title, description, current_page, rating, related_books, id))
    conn.commit()
    print('Book information updated successfully :D')

#search books
def search_books(title):
    c.execute("SELECT rowid, * FROM books WHERE title like ?", ('%' + title + '%',))
    for row in c.fetchall():
        print(row)


#interface for the user
def main():
    create_table()
    while True:
        print("\nOptions:")
        print("1. Add a book")
        print("2. View all books")
        print("3. Update an exisiting book")
        print("4. Search for a book")
        print("5. Exit")
        #switch
        choice = input("Enter an option: ")

        if choice == '1':
            title = input("Enter the books's title: ")
            description  = input("Enter the books's description: ")
            current_page  = int(input("Enter current page number: "))
            rating  = int(input("Enter your rating (1-5): "))
            related_books = input("Enter related books (comma separated): ")
            add_book(title, description, current_page, rating, related_books)
        
        elif choice == '2':
            view_books()
        elif choice == '3':
            print("Update an existing book")
            id = int(input("Enter book ID to udpate: "))
            title = input("Enter the books's new title: ")
            description  = input("Enter the books's new description: ")
            current_page  = int(input("Enter the new current page number: "))
            rating  = int(input("Enter your new rating (1-5): "))
            related_books = input("Enter new related books (comma separated): ")
            update_book(id, title, description, current_page, rating,related_books)

        elif choice == '4':
            print("Search for a book! ")
            search_books(input("Enter the title of the book you want to search for: "))
        
        elif choice == '5':
            print("Exiting the application...")
            break
        else:
            print("Invalid option!")

if __name__ == '__main__':
    main()