USE [Library]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[author_id] [int] IDENTITY(1,1) NOT NULL,
	[author_name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[isbn] [varchar](50) NOT NULL,
	[book_title] [nvarchar](200) NOT NULL,
	[publisher] [varchar](100) NOT NULL,
	[author] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NULL,
	[cover_img] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Author]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Author](
	[book_isbn] [varchar](50) NOT NULL,
	[author_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[book_isbn] ASC,
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Category]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Category](
	[isbn] [varchar](50) NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[isbn] ASC,
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Reservation]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Reservation](
	[book_isbn] [varchar](50) NOT NULL,
	[reservation_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[book_isbn] ASC,
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCopy]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCopy](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[isbn] [varchar](50) NULL,
	[type] [varchar](20) NULL,
	[price] [float] NULL,
	[status] [smallint] NULL,
	[content] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRentedCount]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookRentedCount](
	[book_rented_count_id] [int] IDENTITY(1,1) NOT NULL,
	[isbn] [varchar](50) NULL,
	[book_rented_count] [int] NULL,
	[date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[book_rented_count_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrower]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrower](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](30) NULL,
	[name] [varchar](30) NULL,
	[email] [varchar](50) NULL,
	[deposit] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[feedback_title] [varchar](20) NULL,
	[feedback_text] [varchar](500) NULL,
	[feedback_date] [datetime] NULL,
	[isbn] [varchar](50) NULL,
	[borrower_username] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fine]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fine](
	[fine_id] [int] IDENTITY(1,1) NOT NULL,
	[borrower_id] [varchar](50) NULL,
	[book_copy_id] [int] NULL,
	[reserved_date] [datetime] NULL,
	[due_date] [datetime] NULL,
	[actual_returned_date] [datetime] NULL,
	[fine_amount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[fine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_amount] [float] NULL,
	[username] [varchar](50) NULL,
	[date] [datetime] NULL,
	[payment_type] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 09-Nov-20 08:12:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[reservation_id] [int] IDENTITY(1,1) NOT NULL,
	[borrowed_date] [datetime] NULL,
	[due_date] [datetime] NULL,
	[borrower_id] [varchar](50) NULL,
	[book_isbn] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (1, N'John Grisham')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (2, N'Brad Meltzer')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (3, N'Kitty OMeara')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (4, N'Debbie Macomber')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (5, N'Syd McGee')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (6, N'Aidan Goggins')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [author], [description], [cover_img]) VALUES (N'0385545967', N'A Time for Mercy (Jake Brigance Book 3)', N'Doubleday', N'John Grisham', N'Clanton, Mississippi. 1990.
Jake Brigance finds himself embroiled in a deeply divisive trial when the court appoints him attorney for Drew Gamble, 
a timid sixteen-year-old boy accused of murdering a local deputy', N'https://m.media-amazon.com/images/I/51SRF4uN1-L.jpg')
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [author], [description], [cover_img]) VALUES (N'0525555919', N'I am Benjamin Franklin', N'Dial Books', N'Brad Meltzer', N'The 21st book in the New York Times bestselling series of biographies about heroes tells the story of Benjamin Franklin,
one of the Founding Fathers of the U.S. who helped draft the Declaration of Independence while making important scientific contributions.', N'https://images-na.ssl-images-amazon.com/images/I/519W350MotL._SY498_BO1,204,203,200_.jpg')
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [author], [description], [cover_img]) VALUES (N'0785233879', N'Make Life Beautiful', N'Harper Horizon', N'Syd McGee', N'Be inspired to focus on your goals
and achieve your dreams with Make Life Beautiful, the autobiography from Syd and Shea McGee, the stars of the new Netflix series Dream Home Makeover', N'https://images-na.ssl-images-amazon.com/images/I/51i5PKDQApL._SX332_BO1,204,203,200_.jpg')
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [author], [description], [cover_img]) VALUES (N'1501163791', N'The Sirtfood Diet', N'Gallery Books', N'Aidan Goggins', N'Discover the original international diet sensation—used by Adele, UFC champion Conor McGregor, 
and Pippa Middleton—that will help you lose seven pounds in seven days while experiencing lasting energy and eating all the foods you love', N'https://images-na.ssl-images-amazon.com/images/I/41VljmplQhL._SX322_BO1,204,203,200_.jpg')
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [author], [description], [cover_img]) VALUES (N'1734761788', N'And the People Stayed Home', N'Tra Publishing', N'Kitty OMeara', N'Kitty O’Meara…offers us wisdom that can help during the COVID-19 pandemic and beyond. 
She is challenging us to grow."—Deepak Chopra, MD, author, Metahuman', N'https://images-na.ssl-images-amazon.com/images/I/51gmFFTvFzL._SX387_BO1,204,203,200_.jpg')
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [author], [description], [cover_img]) VALUES (N'1984818751', N'Jingle All the Way', N'Ballantine Books', N'Debbie Macomber', N'Trapped in the middle of five siblings, Everly Lancaster always had big dreams. Now a top real-estate executive, 
Everly finds her work is her life, leaving no space for anything (or anyone) else. 
Sensing her stress, Everly’s boss insists she take December off.', N'https://images-na.ssl-images-amazon.com/images/I/516-qS-xhLL._SX340_BO1,204,203,200_.jpg')
GO
INSERT [dbo].[Book_Author] ([book_isbn], [author_id]) VALUES (N'0385545967', 1)
INSERT [dbo].[Book_Author] ([book_isbn], [author_id]) VALUES (N'0525555919', 2)
INSERT [dbo].[Book_Author] ([book_isbn], [author_id]) VALUES (N'0785233879', 5)
INSERT [dbo].[Book_Author] ([book_isbn], [author_id]) VALUES (N'1501163791', 6)
INSERT [dbo].[Book_Author] ([book_isbn], [author_id]) VALUES (N'1734761788', 3)
INSERT [dbo].[Book_Author] ([book_isbn], [author_id]) VALUES (N'1984818751', 4)
GO
INSERT [dbo].[Book_Category] ([isbn], [category_name]) VALUES (N'0385545967', N'Novel')
INSERT [dbo].[Book_Category] ([isbn], [category_name]) VALUES (N'0525555919', N'History')
INSERT [dbo].[Book_Category] ([isbn], [category_name]) VALUES (N'0785233879', N'Business')
INSERT [dbo].[Book_Category] ([isbn], [category_name]) VALUES (N'1501163791', N'Health')
INSERT [dbo].[Book_Category] ([isbn], [category_name]) VALUES (N'1734761788', N'Fiction')
INSERT [dbo].[Book_Category] ([isbn], [category_name]) VALUES (N'1984818751', N'Romance')
GO
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'fdfdsfds', N'fdsfsdfsdf', N'fsdfsdfsdf', N'sdfsdfsdfdsfsd@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'fsdfsdf', N'fsdfsdf', N'fsdfjsdfksdfs', N'fsdfdsfs@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'manh', N'123', N'manh mon', N'nguyenkhoi@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'nam', N'nam', N'nam', N'nam@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'nam123', N'nam', N'nam', N'nam@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'nguyen', N'123', N'nguyen khoi', N'nguyenkhoi@gmail.com', NULL)
GO
INSERT [dbo].[Category] ([category_name]) VALUES (N'Business')
INSERT [dbo].[Category] ([category_name]) VALUES (N'Fiction')
INSERT [dbo].[Category] ([category_name]) VALUES (N'Health')
INSERT [dbo].[Category] ([category_name]) VALUES (N'History')
INSERT [dbo].[Category] ([category_name]) VALUES (N'Novel')
INSERT [dbo].[Category] ([category_name]) VALUES (N'Romance')
GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD FOREIGN KEY([author_id])
REFERENCES [dbo].[Author] ([author_id])
GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD FOREIGN KEY([book_isbn])
REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Book_Category]  WITH CHECK ADD FOREIGN KEY([category_name])
REFERENCES [dbo].[Category] ([category_name])
GO
ALTER TABLE [dbo].[Book_Category]  WITH CHECK ADD FOREIGN KEY([isbn])
REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Book_Reservation]  WITH CHECK ADD FOREIGN KEY([book_isbn])
REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Book_Reservation]  WITH CHECK ADD FOREIGN KEY([reservation_id])
REFERENCES [dbo].[Reservation] ([reservation_id])
GO
ALTER TABLE [dbo].[BookCopy]  WITH CHECK ADD FOREIGN KEY([isbn])
REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[BookRentedCount]  WITH CHECK ADD FOREIGN KEY([isbn])
REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD FOREIGN KEY([borrower_username])
REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD FOREIGN KEY([isbn])
REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD FOREIGN KEY([book_copy_id])
REFERENCES [dbo].[BookCopy] ([book_id])
GO
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD FOREIGN KEY([borrower_id])
REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([borrower_id])
REFERENCES [dbo].[Borrower] ([username])
GO
