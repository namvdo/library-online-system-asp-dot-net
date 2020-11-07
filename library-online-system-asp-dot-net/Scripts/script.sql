create DATABASE Library

create table Author(
	author_id int IDENTITY(1,1),
	author_name nvarchar(30),
	primary key(author_id)
)
create table Book(
    isbn varchar(50) primary key,
    book_title nvarchar(200) not null,
    publisher varchar(100) NOT NULL,
	author nvarchar(50) not null,

)
create table Book_Author(
	book_isbn varchar(50) ,
	author_id int,
	foreign key(book_isbn) references Book(isbn),
	foreign key(author_id) references Author(author_id),
	primary key(book_isbn,author_id)
)
create table Category(
	category_name nvarchar(50) primary key
)
create table Book_Category(
	isbn varchar(50),
	category_name nvarchar(50),
	foreign key(isbn) references Book(isbn),
	foreign key(category_name) references Category(category_name),
	primary key(isbn,category_name)
)
create table Borrower(
	username varchar(50) primary key,
	password varchar(30),
	name varchar(30),
	email varchar(50),
	deposit float
)

create table Reservation(
	reservation_id int IDENTITY(1,1),
	borrowed_date datetime,
	due_date datetime,
	borrower_id varchar(50),
	book_isbn varchar(50),
	primary key(reservation_id),
	foreign key(borrower_id) references Borrower(username)
	
)
create table Book_Reservation(
	book_isbn varchar(50),
	reservation_id int,
	foreign key(book_isbn) references Book(isbn),
	foreign key(reservation_id) references Reservation(reservation_id),
	primary key(book_isbn,reservation_id)
)
create table Payment(
	payment_id int IDENTITY(1,1),
	payment_amount float,
	username varchar(50),
	date datetime,
	payment_type varchar(20),
	primary key(payment_id),
	foreign key(username) references Borrower(username)
)
create table FeedBack(
	feedback_id int IDENTITY(1,1),
	feedback_title varchar(20),
	feedback_text varchar(500),
	feedback_date datetime,
	isbn varchar(50),
	borrower_username varchar(50),
	primary key(feedback_id),
	foreign key(isbn) references Book(isbn),
	foreign key(borrower_username) references Borrower(username)
)

create table BookCopy(
	book_id int IDENTITY(1,1),
	isbn varchar(50),
	type varchar(20),
	price float,
	status smallint
	primary key(book_id),
	foreign key(isbn) references Book(isbn)
)
create table Fine(
	fine_id  int IDENTITY(1,1),
	borrower_id varchar(50),
	book_copy_id int,
	reserved_date datetime,
	due_date datetime,
	actual_returned_date datetime,
	fine_amount float,
	primary key(fine_id),
	foreign key(borrower_id) references Borrower(username),
	foreign key(book_copy_id) references BookCopy(book_id)
)

create table BookRentedCount(
	book_rented_count_id int identity(1, 1),
	isbn varchar(50),
	book_rented_count int,
	date datetime, -- the beginning date of the week, i.e Monday
	foreign key (isbn) references Book(isbn),
	primary key (book_rented_count_id)
)
