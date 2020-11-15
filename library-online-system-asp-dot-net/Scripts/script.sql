USE [Library]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author]
(
    [author_id]   [int] IDENTITY (1,1) NOT NULL,
    [author_name] [nvarchar](30)       NULL,
    PRIMARY KEY CLUSTERED
        (
         [author_id] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book]
(
    [isbn]        [varchar](50)   NOT NULL,
    [book_title]  [nvarchar](200) NOT NULL,
    [publisher]   [varchar](100)  NOT NULL,
    [description] [nvarchar](500) NULL,
    [cover_img]   [varchar](100)  NULL,
    [author_id]   [int]           NULL,
    [added_time]  [datetime]      NULL,
    PRIMARY KEY CLUSTERED
        (
         [isbn] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Author]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Author]
(
    [book_isbn] [varchar](50) NOT NULL,
    [author_id] [int]         NOT NULL,
    PRIMARY KEY CLUSTERED
        (
         [book_isbn] ASC,
         [author_id] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Category]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Category]
(
    [isbn]          [varchar](50)  NOT NULL,
    [category_name] [nvarchar](50) NOT NULL,
    PRIMARY KEY CLUSTERED
        (
         [isbn] ASC,
         [category_name] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Reservation]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Reservation]
(
    [isbn]           [varchar](50) NULL,
    [reservation_id] [int]         NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCopy]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCopy]
(
    [book_id] [int] IDENTITY (1,1) NOT NULL,
    [isbn]    [varchar](50)        NULL,
    [type]    [varchar](20)        NULL,
    [price]   [float]              NULL,
    [content] [text]               NULL,
    PRIMARY KEY CLUSTERED
        (
         [book_id] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRentedCount]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookRentedCount]
(
    [book_rented_count_id] [int] IDENTITY (1,1) NOT NULL,
    [isbn]                 [varchar](50)        NULL,
    [book_rented_count]    [int]                NULL,
    [date]                 [datetime]           NULL,
    PRIMARY KEY CLUSTERED
        (
         [book_rented_count_id] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrower]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrower]
(
    [username] [varchar](50) NOT NULL,
    [password] [varchar](30) NULL,
    [name]     [varchar](30) NULL,
    [email]    [varchar](50) NULL,
    [deposit]  [float]       NULL,
    PRIMARY KEY CLUSTERED
        (
         [username] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category]
(
    [category_name] [nvarchar](50) NOT NULL,
    [img_link]      [varchar](300) NULL,
    PRIMARY KEY CLUSTERED
        (
         [category_name] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fine]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fine]
(
    [fine_id]              [int] IDENTITY (1,1) NOT NULL,
    [borrower_id]          [varchar](50)        NULL,
    [book_copy_id]         [int]                NULL,
    [reserved_date]        [datetime]           NULL,
    [due_date]             [datetime]           NULL,
    [actual_returned_date] [datetime]           NULL,
    [fine_amount]          [float]              NULL,
    PRIMARY KEY CLUSTERED
        (
         [fine_id] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment]
(
    [payment_id]     [int] IDENTITY (1,1) NOT NULL,
    [payment_amount] [float]              NULL,
    [username]       [varchar](50)        NULL,
    [date]           [datetime]           NULL,
    [payment_type]   [varchar](20)        NULL,
    PRIMARY KEY CLUSTERED
        (
         [payment_id] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReadingLog]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReadingLog]
(
    [username]   [varchar](50) NOT NULL,
    [isbn]       [varchar](50) NOT NULL,
    [percentage] [float]       NULL,
    PRIMARY KEY CLUSTERED
        (
         [username] ASC,
         [isbn] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation]
(
    [id]           [int] IDENTITY (1,1) NOT NULL,
    [username]     [varchar](50)        NULL,
    [isbn]         [varchar](50)        NULL,
    [created_date] [datetime]           NULL,
    [due_date]     [datetime]           NULL,
    [type]         [varchar](30)        NULL,
    [amount]       [float]              NULL,
    PRIMARY KEY CLUSTERED
        (
         [id] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 15/11/2020 18:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review]
(
    [id]       [int] IDENTITY (1,1) NOT NULL,
    [title]    [nvarchar](300)      NULL,
    [content]  [text]               NULL,
    [date]     [datetime]           NULL,
    [isbn]     [varchar](50)        NULL,
    [username] [varchar](50)        NULL,
    [score]    [smallint]           NULL,
    PRIMARY KEY CLUSTERED
        (
         [id] ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]
    WITH CHECK ADD FOREIGN KEY ([author_id])
        REFERENCES [dbo].[Author] ([author_id])
GO
ALTER TABLE [dbo].[Book_Author]
    WITH CHECK ADD FOREIGN KEY ([author_id])
        REFERENCES [dbo].[Author] ([author_id])
GO
ALTER TABLE [dbo].[Book_Author]
    WITH CHECK ADD FOREIGN KEY ([author_id])
        REFERENCES [dbo].[Author] ([author_id])
GO
ALTER TABLE [dbo].[Book_Author]
    WITH CHECK ADD FOREIGN KEY ([book_isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Book_Author]
    WITH CHECK ADD FOREIGN KEY ([book_isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Book_Category]
    WITH CHECK ADD FOREIGN KEY ([category_name])
        REFERENCES [dbo].[Category] ([category_name])
GO
ALTER TABLE [dbo].[Book_Category]
    WITH CHECK ADD FOREIGN KEY ([category_name])
        REFERENCES [dbo].[Category] ([category_name])
GO
ALTER TABLE [dbo].[Book_Category]
    WITH CHECK ADD FOREIGN KEY ([isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Book_Category]
    WITH CHECK ADD FOREIGN KEY ([isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Book_Reservation]
    WITH CHECK ADD FOREIGN KEY ([reservation_id])
        REFERENCES [dbo].[Reservation] ([id])
GO
ALTER TABLE [dbo].[Book_Reservation]
    WITH CHECK ADD FOREIGN KEY ([isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[BookCopy]
    WITH CHECK ADD FOREIGN KEY ([isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[BookCopy]
    WITH CHECK ADD FOREIGN KEY ([isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[BookRentedCount]
    WITH CHECK ADD FOREIGN KEY ([isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[BookRentedCount]
    WITH CHECK ADD FOREIGN KEY ([isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Fine]
    WITH CHECK ADD FOREIGN KEY ([book_copy_id])
        REFERENCES [dbo].[BookCopy] ([book_id])
GO
ALTER TABLE [dbo].[Fine]
    WITH CHECK ADD FOREIGN KEY ([book_copy_id])
        REFERENCES [dbo].[BookCopy] ([book_id])
GO
ALTER TABLE [dbo].[Fine]
    WITH CHECK ADD FOREIGN KEY ([borrower_id])
        REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[Fine]
    WITH CHECK ADD FOREIGN KEY ([borrower_id])
        REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[Payment]
    WITH CHECK ADD FOREIGN KEY ([username])
        REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[Payment]
    WITH CHECK ADD FOREIGN KEY ([username])
        REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[ReadingLog]
    WITH CHECK ADD FOREIGN KEY ([username])
        REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[ReadingLog]
    WITH CHECK ADD FOREIGN KEY ([isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Reservation]
    WITH CHECK ADD FOREIGN KEY ([username])
        REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[Reservation]
    WITH CHECK ADD FOREIGN KEY ([isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Review]
    WITH CHECK ADD FOREIGN KEY ([isbn])
        REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Review]
    WITH CHECK ADD FOREIGN KEY ([username])
        REFERENCES [dbo].[Borrower] ([username])
GO
