﻿USE [Library]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[Book_Author]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[Book_Category]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[Book_Reservation]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[BookCopy]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[BookRentedCount]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[Borrower]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[Fine]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 08/11/2020 18:25:54 ******/
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
/****** Object:  Table [dbo].[Reservation]    Script Date: 08/11/2020 18:25:54 ******/
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
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'fdfdsfds', N'fdsfsdfsdf', N'fsdfsdfsdf', N'sdfsdfsdfdsfsd@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'fsdfsdf', N'fsdfsdf', N'fsdfjsdfksdfs', N'fsdfdsfs@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'nam', N'nam', N'nam', N'nam@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'nam123', N'nam', N'nam', N'nam@gmail.com', NULL)
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
