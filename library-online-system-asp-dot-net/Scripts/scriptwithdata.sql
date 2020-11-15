USE [Library]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 15/11/2020 18:16:34 ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 15/11/2020 18:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
                             [isbn] [varchar](50) NOT NULL,
                             [book_title] [nvarchar](200) NOT NULL,
                             [publisher] [varchar](100) NOT NULL,
                             [description] [nvarchar](500) NULL,
                             [cover_img] [varchar](100) NULL,
                             [author_id] [int] NULL,
                             [added_time] [datetime] NULL,
                             PRIMARY KEY CLUSTERED
                                 (
                                  [isbn] ASC
                                     )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Author]    Script Date: 15/11/2020 18:16:34 ******/
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
/****** Object:  Table [dbo].[Book_Category]    Script Date: 15/11/2020 18:16:34 ******/
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
/****** Object:  Table [dbo].[Book_Reservation]    Script Date: 15/11/2020 18:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Reservation](
                                         [isbn] [varchar](50) NULL,
                                         [reservation_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCopy]    Script Date: 15/11/2020 18:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCopy](
                                 [book_id] [int] IDENTITY(1,1) NOT NULL,
                                 [isbn] [varchar](50) NULL,
                                 [type] [varchar](20) NULL,
                                 [price] [float] NULL,
                                 [content] [text] NULL,
                                 PRIMARY KEY CLUSTERED
                                     (
                                      [book_id] ASC
                                         )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRentedCount]    Script Date: 15/11/2020 18:16:34 ******/
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
/****** Object:  Table [dbo].[Borrower]    Script Date: 15/11/2020 18:16:34 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 15/11/2020 18:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
                                 [category_name] [nvarchar](50) NOT NULL,
                                 [img_link] [varchar](300) NULL,
                                 PRIMARY KEY CLUSTERED
                                     (
                                      [category_name] ASC
                                         )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fine]    Script Date: 15/11/2020 18:16:34 ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 15/11/2020 18:16:34 ******/
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
/****** Object:  Table [dbo].[ReadingLog]    Script Date: 15/11/2020 18:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReadingLog](
                                   [username] [varchar](50) NOT NULL,
                                   [isbn] [varchar](50) NOT NULL,
                                   [percentage] [float] NULL,
                                   PRIMARY KEY CLUSTERED
                                       (
                                        [username] ASC,
                                        [isbn] ASC
                                           )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 15/11/2020 18:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
                                    [id] [int] IDENTITY(1,1) NOT NULL,
                                    [username] [varchar](50) NULL,
                                    [isbn] [varchar](50) NULL,
                                    [created_date] [datetime] NULL,
                                    [due_date] [datetime] NULL,
                                    [type] [varchar](30) NULL,
                                    [amount] [float] NULL,
                                    PRIMARY KEY CLUSTERED
                                        (
                                         [id] ASC
                                            )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 15/11/2020 18:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
                               [id] [int] IDENTITY(1,1) NOT NULL,
                               [title] [nvarchar](300) NULL,
                               [content] [text] NULL,
                               [date] [datetime] NULL,
                               [isbn] [varchar](50) NULL,
                               [username] [varchar](50) NULL,
                               [score] [smallint] NULL,
                               PRIMARY KEY CLUSTERED
                                   (
                                    [id] ASC
                                       )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON

INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (1, N'John Grisham')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (2, N'Brad Meltzer')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (3, N'Kitty OMeara')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (4, N'Debbie Macomber')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (5, N'Syd McGee')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (6, N'Aidan Goggins')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (7, N'Joshua Bloch')
INSERT [dbo].[Author] ([author_id], [author_name]) VALUES (8, N'
Jim Kwik')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [description], [cover_img], [author_id], [added_time]) VALUES (N'0134685997', N'Effective Java', N'Addison-Wesley Professional', N'Java has changed dramatically since the previous edition of Effective Java was published shortly after the release of Java 6. This Jolt award-winning classic has now been thoroughly updated to take full advantage of the latest language and library features. The support in modern Java for multiple paradigms increases the need for specific best-practices advice, and this book delivers.', N'https://images-na.ssl-images-amazon.com/images/I/41JLgmt8MlL._SX402_BO1,204,203,200_.jpg', 7, CAST(N'2020-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [description], [cover_img], [author_id], [added_time]) VALUES (N'0385545967', N'A Time for Mercy', N'Doubleday', N'Clanton, Mississippi. 1990.
Jake Brigance finds himself embroiled in a deeply divisive trial when the court appoints him attorney for Drew Gamble, 
a timid sixteen-year-old boy accused of murdering a local deputy', N'https://m.media-amazon.com/images/I/51SRF4uN1-L.jpg', 1, CAST(N'2020-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [description], [cover_img], [author_id], [added_time]) VALUES (N'0525555919', N'I am Benjamin Franklin', N'Dial Books', N'The 21st book in the New York Times bestselling series of biographies about heroes tells the story of Benjamin Franklin,
one of the Founding Fathers of the U.S. who helped draft the Declaration of Independence while making important scientific contributions.', N'https://images-na.ssl-images-amazon.com/images/I/519W350MotL._SY498_BO1,204,203,200_.jpg', 2, CAST(N'2020-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [description], [cover_img], [author_id], [added_time]) VALUES (N'0785233879', N'Make Life Beautiful', N'Harper Horizon', N'Be inspired to focus on your goals
and achieve your dreams with Make Life Beautiful, the autobiography from Syd and Shea McGee, the stars of the new Netflix series Dream Home Makeover', N'https://images-na.ssl-images-amazon.com/images/I/51i5PKDQApL._SX332_BO1,204,203,200_.jpg', 3, CAST(N'2020-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [description], [cover_img], [author_id], [added_time]) VALUES (N'1501163791', N'The Sirtfood Diet', N'Gallery Books', N'Discover the original international diet sensation—used by Adele, UFC champion Conor McGregor, 
and Pippa Middleton—that will help you lose seven pounds in seven days while experiencing lasting energy and eating all the foods you love', N'https://images-na.ssl-images-amazon.com/images/I/41VljmplQhL._SX322_BO1,204,203,200_.jpg', 4, CAST(N'2020-10-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [description], [cover_img], [author_id], [added_time]) VALUES (N'1734761788', N'And the People Stayed Home', N'Tra Publishing', N'Kitty O’Meara…offers us wisdom that can help during the COVID-19 pandemic and beyond. 
She is challenging us to grow."—Deepak Chopra, MD, author, Metahuman', N'https://images-na.ssl-images-amazon.com/images/I/51gmFFTvFzL._SX387_BO1,204,203,200_.jpg', 5, CAST(N'2020-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [description], [cover_img], [author_id], [added_time]) VALUES (N'1984818751', N'Jingle All the Way', N'Ballantine Books', N'Trapped in the middle of five siblings, Everly Lancaster always had big dreams. Now a top real-estate executive, 
Everly finds her work is her life, leaving no space for anything (or anyone) else. 
Sensing her stress, Everly’s boss insists she take December off.', N'https://images-na.ssl-images-amazon.com/images/I/516-qS-xhLL._SX340_BO1,204,203,200_.jpg', 6, CAST(N'2020-10-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Book] ([isbn], [book_title], [publisher], [description], [cover_img], [author_id], [added_time]) VALUES (N'B082ZQDH63', N'Limitless: Upgrade Your Brain', N'Hay House Inc', N'JIM KWIK, the world''s #1 brain coach, has written the owner''s manual for mental expansion and brain fitness. Limitless gives people the ability to accomplish more--more
productivity, more transformation, more personal success, and business achievement, by changing their Mindset, Motivation, and Methods', N'https://m.media-amazon.com/images/I/41U3sg4aP-L.jpg', 8, CAST(N'2020-12-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Book_Author] ([book_isbn], [author_id]) VALUES (N'0134685997', 7)
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
SET IDENTITY_INSERT [dbo].[BookCopy] ON

INSERT [dbo].[BookCopy] ([book_id], [isbn], [type], [price], [content]) VALUES (1, N'0385545967', N'PREVIEW_BOOK', 0, NULL)
INSERT [dbo].[BookCopy] ([book_id], [isbn], [type], [price], [content]) VALUES (2, N'0525555919', N'PREVIEW_BOOK', 0, N'But the labourers, during the last ten years, are I altogether better off. Free-trade has increased their food, without lessening their employment. The poli- tician who wishes to know the effect on agricultural life of that wise and just measure, may find it in Mr. Grey of Dilston''s answers to the queries of the French Government. The country parson will not need to seek so far. He will see it (if he be an observant man) in the faces and figures of his school-children. He will see a rosier, fatter, bigger-boned race growing up, which bids fair to surpass in bulk the puny and ill-fed generation of 1815-45, and equal, perhaps, in thew and sinew, to the men who saved Europe in the old French war.
If it should be so (as God grant it may), there is little fear but that the labouring men of England will find their aristocracy able to lead them in the battle-field, and to develop the agriculture of the land at home, even better than did their grandfathers of the old war time.
To a thoughtful man, no point of the social horizon is more full of light, than the altered temper of the young'' gentlemen. They have their faults and follies still — ^for when wiU young blood be other than hot blood 2 But when one finds, more and more, swear- ing banished from the hunting-field, foul songs from the universities, drunkenness and gambling from the i barracks ; when one finds everywhere, whether at college, in camp, or by the coverside, more and more, young men desirous to learn their duty as Englishmen, and if possible to do it ; when one hears their altered tone toward the middle classes, and that word " snob " (thanks very much to Mr. Thackeray) used by them in its true sense, without regard of rank ; when one watches, as at Aldershott, the care and kindness of officers toward their men; and over and above all this, when one finds in every profession (in that of the soldier as much as any) young men who are not only "in the world," but (in religious phraseology) " of the world," living God-fearing, virtuous, and use- ful lives, as Christian men should : then indeed one looks forward with hope and confidence to the day when these men shall settle down in life, and become, as holders of the land, the leaders of agricultural pro-gress, and the guides and guardians of the labouring man.
I am bound to speak of the farmer, as I know him in the South of England. In the North he is a man of altogether higher education and breeding : but he is, even in the South, a much better man than it is the fashion to beUeve him. No doubt, he has given heavy cause of complaint. He was demoralised, as surely, if not as deeply, as his own labourers, by the old Poor Law. He was bewildered — to use the mildest term — by promises of Protection from men who knew better. But his worst fault after all has been, that young or old, he has copied his landlord too closely, and acted on his maxims and example. And now that his landlord is growing wiser, he is growing wiser too. Experience of the new Poor Law, and experience of Free-trade, are helping him to show himself what he always was at heart, an honest Englishman. AH his brave persistence and industry, his sturdy independence and self-help, and last, but not least, his strong sense of justice, and his vast goodnature, are coming out more and more, and work- ing better and better upon the land and the labourer ; while among his sons I see many growing up brave, manly, prudent young men, with a steadily increasing knowledge of what is required of them, both as manu- facturers of food, and employers of human labour. The country clergy, again, are steadily improving')
INSERT [dbo].[BookCopy] ([book_id], [isbn], [type], [price], [content]) VALUES (3, N'0785233879', N'PREVIEW_BOOK', 0, N'Tycho Mommsen, in his excellent essay. Die Kunst des Deutschen V eh er setz er s aus neueren Sprachen, goes so far as to say: "The metrical or rhymed modelling of a poeti- cal work is so essentially the germ of its being, that, rather than by giving it up, we might hope to construct a similar work of art before the eyes of our countrymen, by giving up or changing the substance. The immeasur- able result which has followed works wherein the form has been retained — such as the Homer of Voss, and the Shake- speare of Tieck and Schlegel — is an incontrovertible evi- dence of the vitality of the endeavor.
The value of form, in a poetical work, is the first question to be considered. No poet ever understood this question more thoroughly than Goethe himself, or expressed a more positive opin- ion in regard to it. The alternative modes of translation which he presents (reported by Riemer, quoted by Mrs. Austin, in her "Charac- teristics of Goethe," and accepted by Mr. Hay- ward),* are quite independent of his views concerning the value of form, which we find given
*" ''There are two maxims of translation,'' says he: ''the one requires that the author, of a foreign nation, be brought to us in such a manner that "we may regard him as our own ; the other, on the contrary, demands of us that elsewhere, in the clearest and most emphatic
manner.* Poetry is not simply a fashion of ex-
•we transport ourselves over to him, and adopt his situa- tion, his mode of speaking, and his peculiarities. The ad- vantages of both are sufficiently known to all instructed persons, from masterly examples. '' '' ''
Is it necessary, however, that there should always be this alternative? Where the languages are kindred, and equally capable of all varieties of metrical expression, may not both these "maxims" be observed in the same translation? Goethe, it is true, Avas of the opinion that Faust ought to be given, in French, in the manner of Clement Marot : but this was undoubtedly because he felt the inadequacy of modern French to express the naive, simple realism of many passages. The same objection does not apply to English. There are a few archaic ex- pressions in Fai:st, but no more than are still allowed —
* "You are right," said Goethe; "there are great and mysterious agencies included in the various forms of Poetry. If the substance of my ''Koman Elegies'' were to be expressed in the tone and measure of Byron ''s '' Don Juan, '' it would really have an atrocious effect. '' '' — EcJcer- r.iann.
"The rhythm," said Goethe, "is an unconscious result of the poetic m.ood. If one should stop to consider it mechanically, when about to write a poem, one would be- come bewildered and accomplish nothing of real poetical value. '' ''—Ibid.
"All that is poetic in cliaracter sTiorild he rhythmically treated! Such is my conviction; and if even a sort of poetic prose should be gradually introduced, it would only show that the distinction between prose and poetry had been completely lost sight of." — Goethe to Schiller, 1797.
Tycho Mommsen, in his excellent essay. Die Kunst des Deutschen V eh er setz er s aus neueren Sprachen, goes so far as to say: "The metrical or rhymed modelling of a poeti- cal work is so essentially the germ of its being, that, rather than by giving it up, we might hope to construct a similar work of art before the eyes of our countrymen, by giving up or changing the substance. The immeasur- able result which has followed works wherein the form has been retained — such as the Homer of Voss, and the Shake- speare of Tieck and Schlegel — is an incontrovertible evi- dence of the vitality of the endeavor. '' ''
')
INSERT [dbo].[BookCopy] ([book_id], [isbn], [type], [price], [content]) VALUES (4, N'1501163791', N'FULL_VIEW_BOOK', 20, N'On s''en revint à Carthage avec toutes sortes de terreurs. On marchait la nuit seulement; le jour on se cachait dans les bois d''oliviers. A chaque étape quelques-uns mouraient; ils se crurent perdus plusieurs fois. Enfin ils atteignirent le cap Hermœum, où des vaisseaux vinrent les prendre.
Hannon était si fatigué, si désespéré, — la perte des éléphants surtout l''accablait, — qu''il demanda, pour en finir, du poison à Demonades. D''ailleurs, il se sen- tait déjà tout étendu sur sa croix.
Carthage n''eut pas la force de s''indigner contre lui. On avait perdu quatre cent mille neuf cent soixante- douze sicles d''argent, quinze mille six cent vingt-trois shekels d''or, dix-huit éléphants, quatorze membres du Grand-Conseil, trois cents Riches, huit mille citoyens, du blé pour trois lunes, un bagage considérable let toutes les machines de guerre 1 La défection de Narr''Havas était certaine, les deux sièges recommen- çaient. L''armée d''Autharite s''étendait maintenant de Tunis à Rhadès. Du haut de l''Acropole, on apercevait dans la campagne de longues fumées montant jusqu''au ciel; c''étaient les châteaux des Riches qui brûlaient.
Un homme, seul, aurait pu sauv^er la République. On se repentit de l''avoir méconnu, et le parti de la
L*Armonciateur-des-Lunes qui veillait toutes les nuits au haut du temple d''Eschmoûn, pour signaler avec sa trompette les agitations de l''astre, aperçut un matin, du côté de l''Occident, quelque chose de semblable à un oiseau frôlant de ses longues ailes la surface de la mer.
C''était un navire à trois rangs de rames; il y avait à la proue un cheval sculpté. Le soleil se levait; l''An- nonciateur-des-Lunes mit sa main devant les yeux; puis saisissant à plein bras son clairon, il poussa sur Carthage un grand cri d''airain.
De toutes les maisons des gens sortirent; on ne voulait pas en croire les paroles, on se disputait, le môle était couvert de peuple. Enfin on reconnut la tri- rème d''Hamilcar.
Elle s''avançait d''une façon orgueilleuse et farouche, l''antenne toute droite, la voile bombée dans la longueur du mât, en fendant l''écume autour d''elle; ses gigan- tesques avirons battaient l''eau en cadence; de temps à autre l''extrémité de sa quille, faite comme un soc de charrue, apparaissait, et sous l''éperon qui terminait sa proue, le cheval à tête d''ivoire, en dressant ses deiiix pieds, semblait courir sur les plaines de la mer.
Autour du promontoire, comme le vent avait cessé, la voile tomba, et l''on aperçut auprès du pilote un homme debout, tête nue; c''était lui, le suffète Hamilcar!  Deux heures après, un homme, qiii arrivait du côté d''Hippo-Zaryte, gravit en courant la montagne. Il agi- tait des tablettes au bout de son bras, et comme il criait très fort, les Barbares l''entourèrent.
Elles étaient expédiées par les soldats grecs de la Sardaigne. Ils recommandaient à leurs compagnons d''Afrique de surveiller Giscon avec les autres captifs. Un marchand de Samos, un certain Hipponax, venant de Carthage, leur avait appris qu''un complot s''organisait pour les faire évader, et on engageait les Barbares à tout prévoir; la République était puissante.
Le stratagème de Spendius ne réussit point d''abord comme il l''avait espéré. Cette assurance d''un péril nouveau, loin d''exciter de la fureur, souleva des craintes; et se rappelant l''avertissement d''Hamilcar jeté naguère au milieu d''eux, ils s''attendaient à quelque chose d''imprévu et qui serait terrible. La nuit se passa dans une grande angoisse; plusieurs même se débar- rassèrent de leurs armes pour attendrir le Suffète quand il se présenterait.
Mais le lendemain, à la troisième veille du jour, un second coureur parut encore plus haletant et noir de poussière. Le Grec lui arracha des mains un rouleau de papyrus chargé d''écritures phéniciennes. On y sup- pliait les Mercenaires de ne pas se décourager; les braves de Tunis allaient venir avec de grands renforts.
Spendius lut d''abord la lettre trois fois de suite; et, soutenu par deux Cappadociens qui le tenaient assis sur leurs épaules, il se faisait transporter de place en place, et il la relisait. Pendant sept heures, il harangua.
Il rappelait aux Mercenaires les promesses du Grand- Conseil; aux Africains, les cruautés des intendants;
Étendu sur le dos, les bras contre les hanches et les genoux serrés, il avait l''air d''un mort disposé pour le sépulcre. Cependant ses côtes maigres s''abaissaient et remontaient, et ses yeux, largement ouverts au milieu de sa figure toute pâle, regardaient d''une façon continue et intolérable.
Les Barbares le considérèrent, d''abord, avec un grand étonnement. Depuis le temps qu''il vivait dans la fosse, on l''avait presque oublié; gênés par de vieux souvenirs, ils se tenaient à distance et n''osaient porter la main sur lui.
Mais ceux qui étaient par derrière murmuraient et se poussaient, quand un Garamante traversa la foule; il brandissait une faucille; tous comprirent sa pensée; leurs visages s''empourprèrent, et, saisis de honte, ils hurlaient : « Oui 1 oui ! »
L''homme au fer recourbé s''approcha de Giscon. Il lui prit la tête, et, l''appuyant sur son genou, il la sciait à coups rapides; elle tomba; deux gros jets de sang firent un trou dans la poussière; Zarxas avait sauté dessus, et, plus léger qu''un léopard, il courait vers les Carthaginois.
Puis, quand il fut aux deux tiers de la montagne, il retira de sa poitrine la tête de Giscon en la tenant par la barbe, il tourna son bras rapidement plusieurs fois. Personne de ses ennemis ne hasarda une plainte ou une récrimination. Par l''enthousiasme des uns et la pusillanimité des autres, avant le délai prescrit, une armée de cinq mille hommes fut prête.
Elle gagna promptement Utique pour appuyer le Suf- fète sur ses derrières, tandis que trois mille des plus considérables montèrent sur des vaisseaux qui devaient les débarquer à Hippo-Zaryte, d''où ils repousseraient les Barbares.
Hannon en avait accepté le commandement; mais il confia l''armée à son lieutenant Magdassan, afin de con- duire les troupes de débarquement lui-même, car il ne pouvait plus endurer les secousses de la litière. Son mal, en rongeant ses lèvres et ses narines, avait creusé dans sa face un large trou; à dix pas, on lui voyait le fond de sa gorge, et il se savait tellement hideux qu''il se mettait, comme une femme, un voile sur la tête.
Hippo-Zaryte n''écouta point ses sommations, ni celles des Barbares non plus; mais chaque matin les habitants leur descendaient des vivres dans des corbeilles, et en criant du haut des tours, ils .s''excusaient sur les exi- gences de la République et les conjuraient de s''éloigner
')
INSERT [dbo].[BookCopy] ([book_id], [isbn], [type], [price], [content]) VALUES (5, N'1734761788', N'HALF_VIEW_BOOK', 10, N'I BELIEVE if we were to question every author upon the sub- ject of his literary grievances, we should find that the most fre- quent of all complaints, was less that of being unappreciated, than that of being misunderstood. All of us write perhaps with some secret object, for which the world cares not a straw ; and while each reader fixes his peculiar moral upon a book, no one, by any chance, hits upon that which the author had in his own heart designed to inculcate. Hence this Edition of " Pelham " acquires that appendage in the shape of an explanatory preface which the unprescient benevolence of the author did not inflict on his readers when he first confided his work to their candor and discretion. Even so, some Candidate for Parliamentary Honors first braves the hustings ; — relying only on the general congeniality of sentiment between himself and the Electors — but alas ! once chosen, the liberal confidence, which took him upon trust is no more, and when he reappears to commend himself to the popular suffrage, he is required to go into the ill-bred ego- tisms of detail — and explain all that he has done and all that he has failed to do, to the satisfaction of an enlightened but too inquisitive constituency.
It is a beautiful part in the economy of this world, that noth- ing is without its use ; every weed in the great thoroughfares of life has a honey, which Observation can easily extract ; and we may glean no unimportant wisdom from Folly itself, if we distin- guish while we survey, and satirize while we share it. It is in this belief that these volumes have their origin. I have not been willing that even the common-places of society should af- ford neither a record nor a moral ; and it is therefore from the common-places of society that the materials of this novel have been wrought. By treating trifles naturally, they may be ren- dered amusing, and that which adherence to Nature renders amusing, the same cause also may render instructive : for Na- ture is the source of all morals, and the enchanted well, from which not a single drop can be taken, that has not the power of curing some of our diseases.
I have drawn from the hero of my Work, such a person as seemed to me best fitted to retail the opinions and customs of the class and age to which he belongs ; a personal combination of antitheses — a fop and a philosopher, a voluptuary and a mor- alist — a trifler in appearance, but rather one to whom trifles are instructive, than one to whom trifles are natural — an Aristippus on a limited scale, accustomed to draw sage conclusions from the follies he adopts, and while professing himself a votary of Pleasure, desirous in reality to become a disciple of Wisdom. Such a character I have found it more difficult to portray than conceive : I have found it more difficult still, because I have with it nothing in common,* except the taste for observation, and some experience in the scenes among which it had been cast ; and it will readily be supposed that it is no easy matter to survey occurrences the most familiar through a vision, as it were, essentially and jDcrpetually different from that through which oneself has been accustomed to view them. This difficulty in execution will perhaps be my excuse in failure ; and some addi- tional indulgence may be reasonably granted to an author who has rarely found in the egotisms of his hero a vent for his own.
With the generality of those into whose hands a novel upon
* I regret extremely that by this remark I should be necessitated to relinquish the flattering character I have for so many months borne, and to undeceive not a few of my most indulgent critics, who in reviewing my work have literally considered the Author and the Hero one flesh. " We have only," said one of them, to complain of the Author''s egotisms ; he is perpetually talking of himself ! "—Poor gentleman ! from the first page to the last, the Author never utters a syllable.— [The few marginal notes in which the Author himself speaks, were not added till the present Edition.] manners is likely to fall, the lighter and less obvious the method in which reflection is conveyed, the greater is its chance to be received without distaste and remembered without aversion. This will be an excuse, perhaps, for the appearance of frivoli- ties not indulged for the sake of the frivolity ; under that which has most the semblance of levity I have often been the most diligent in my endeavors to inculcate the substances of truth. The shallowest stream, whose bed every passenger imagines he surveys, may deposit some golden grains on the plain through which it flows ; and we may weave flowers not only into an idle garland, but, like the thyrsus of the ancients, over a sacred weapon.
It now only remains for me to add my hope that this edition will present the " adventures of a gentleman " in a less im- perfect shape than the last, and in the words of the erudite and memorable Joshua Barnes,* " So to begin my intended dis- course, if not altogether true, yet not wholly vain, nor perhaps- deficient in what may exhilarate a witty fancy, or inform a bad
moralist." The holiday time of life, in which his novel was written, while accounting, perhaps in a certaingaiety of tone, for the popularity it has received, may perhaps also excuse, in some measure, its more evident deficiencies and faults. Although I trust the time has passed when it might seem necessary to protest against those critical assumptions which so long confounded the author with the hero ; — although I equally trust that, even were such assump- tions true, it would be scarcely necessary to dispute the justice of visiting upon later and more sobered life, the supposed foibles and levities of that thoughtless age of eighteen, in which this fic- tion was first begun, — yet, perhaps, some short sketch of the ori- gin of a work, however idle, the success of which determined the literary career of the author, may not be considered alto- gether presumptuous or irrelevant.
While, yet, then a boy in years, but with some experience of the world, which I entered prematurely, I had the good fortune to be confined to my room by a severe illness, towards the end of a London season. All my friends were out of town, and I was left to such resources as solitude can suggest to the tedium of sickness. I amused myself by writing with incredible diffi- culty and lalpor (for till then prose was a country almost as un- known to myself as to Monsieur Jourdain) some half a dozen tales and sketches. Among them was a story called "'' Mortimer, or the Memoirs of a Gentleman." Its commencement was al- most word for word the same as that of " Pelham ; " but the de sign was exactly opposite to that of the latter and later work. " Mortimer " was intended to show the manner in which the world deteriorates its votary, and " Pelham," on the contrary, conveys the newer, and, I believe, sounder moral, of showing how a man of sense can subject the usages of the world to him- self instead of being conquered by them, and gradually grow wise by the very foibles of his youth.
This tale, with the sketches written at the same period, was sent anonymously to a celebrated publisher, who considered the volume of too slight a nature for separate publication, and recom- mended me to select the best of the papers for a magazine. I was not at that time much inclined to a periodical mode of pub- lishing, and thought no more of what, if * migcB to the reader, had indeed been difficiks to the author. Soon afterwards I went abroad. On my return I sent a collection of letters to Mr. Col- burn for publication, which, for various reasons, I afterwards worked up into a fiction, and which (greatly altered from their original form) are now known to the public under the name of " Falkland."
While correcting the sheets of that tale for the press, I was made aware of many of its faults. But it was not till it had been fairly before the public that I was sensible of its greatest ; namely, a sombre coloring in life, and the indulgence of a vein of senti- ment, which, though common enough to all very young minds in their first bitter experience of the disappointment of the world, had certainly ceased to be new in its expression, and had never been true in its philosophy.
The effect which the composition of that work produced upon my mind, was exactly similar to that which (if I may reverently quote so illustrious an example) Goethe informs us the writing of ''* Werter " produced upon his own. T had rid my bosom of its " perilous stuff," — I had confessed my sins, and was absolved, — I could return to real life and its wholesome objects. Encour- aged by the reception which " Falkland " met with, flattering though not brilliant, I resolved to undertake a rie\Y and more important fiction. I had long been impressed with the truth of an observation of Madame de Stael, that a character at once gay and sentimental is always successful on the stage. I re- solved to attempt a similar charter for a novel, making the sen- timent, however, infinitely less prominent than the gaiety. My boyish attempt of the " Memoirs of a Gentleman " occurred to me, and I resolved upon this foundation to build my fiction. After a little consideration I determined, however, to enlarge and ennoble the original character : the character itself, of the clever man of the world corrupted <5_y the world, was not new; it had already been represented by Mackenzie, by Moore in " Ze- luco," and in some measure by the master-genius of Richardson it- self, in the incomparable portraiture of Lovelace. The moral to be derived from such a creation seemed to me also equivocal and dubious. It is a moral of a gloomy and hopeless school. We live in the world \, the great majority of us, in a state of civilization, must, more or less, be men <7/"the world. It struck me that it would be a new, an useful, and perhaps a happy moral, to show in what manner we might redeem and brighten the common-places of life ; to prove (what is really the fact) that the lessons of society do not necessarily corrupt, and that we may be both men of the world, and even, to a certain degree, men of pleasure, and yet be something wiser — nobler — better. With this idea I formed in my mind the character of Pelham ; revolving its qualities long and seriously before I attempted to describe them on paper. For the formation of my story, I studied with no slight attention the great works of my predecessors, and attempted to derive from that study certain rules and canons to serve me as a guide ; and, if some of my younger contemporaries whom I could name would only condescend to take the same preliminary pains that I did, I am sure that the result would be much more brilliant. It oftens happens to me to be consulted by persons about to at- tempt fiction, and I invariably find thai they imagine they have only to sit down and write. They forget that art does not come by inspiration, and that the novelist, dealing constantly with contrast and effect, must, in the widest and deepest sense of the word, study to be an artist. They paint pictures for Posterity without having learned to draw.
')
INSERT [dbo].[BookCopy] ([book_id], [isbn], [type], [price], [content]) VALUES (6, N'B082ZQDH63', N'HALF_VIEW_BOOK', 10, N'Our most precious gift is our brain.
It is what allows us to learn, love, think, create, and even to experience
joy. It is the gateway to our emotions, to our capacity for deeply
experiencing life, to our ability to have lasting intimacy. It allows us to
innovate, grow, and accomplish.
Yet few of us realize that, by applying a handful of practical methods, we
can enhance our brain and supercharge our ability to learn. Most of us know
that we can improve our cardiovascular health through exercise and diet,
but most of us do not realize that we can also greatly improve our brains,
and in doing so, our life.
Unfortunately, our world doesn’t foster a healthy environment for our
brain. Before Jim Kwik provides a road map to become limitless, he indicts
the four growing villains that are challenging our capacity to think, focus,
learn, grow, and be fully human.
The first is digital deluge—the unending flood of information in a world
of finite time and unfair expectations that leads to overwhelm, anxiety, and
sleeplessness. Drowning in data and rapid change, we long for strategies
and tools to regain some semblance of productivity, performance, and peace
of mind.
The second villain is digital distraction. The fleeting ping of digital
dopamine pleasure replaces our ability to sustain the attention necessary for
deep relationship, deep learning, or deep work. I recently sat next to a
friend at a lecture and noticed her picking up her phone multiple times
within a few minutes. I asked for her phone and pulled up the screen time
app. She had picked up her phone more than one thousand times and had
one thousand notifications in one day. Texts, social media notifications, emails, and news alerts, while important in context, can derail our
concentration and train us to be distracted from what matters most in the
moment.
The next villain is digital dementia. Memory is a muscle that we have
allowed to atrophy. While there are benefits to having a supercomputer in
your pocket, think of it like an electric bicycle. It’s fun and easy but doesn’t
get you in shape. Research on dementia proves that the greater our capacity
to learn—the more mental “brainercise” we perform—the lower our risk of
dementia. In many cases, we have outsourced our memory to our detriment.
The last brain-damaging villain is digital deduction. In a world where
information is abundantly accessible, we’ve perhaps gone too far in how we
use that information, even getting to the point where we are letting
technology do much of our critical thinking and reasoning for us. Online,
there are so many conclusions being drawn by others that we have begun to
surrender our own ability to draw conclusions. We would never let another
person do our thinking for us, but we’ve gotten far too comfortable with
letting devices have that very power.
The cumulative effects of these four digital villains robs us of our focus,
attention, learning, and, most importantly, our ability to truly think. It robs
us of our mental clarity and results in brain fatigue, distraction, inability to
easily learn, and unhappiness. While the technological advances of our time
have the potential to both help and harm, the way we use them in our
society can lead to an epidemic of overload, memory loss, distraction, and
dependency. And it’s only going to get worse.
The message of this book couldn’t be more timely. You were born with
the ultimate technology, and there is nothing more important than the health
and fitness of our brain—it controls everything in life. Learning how to
filter all the data, to develop new methods and skills for thriving in a
distracted world drowning in a flood of information, is what is needed to
thrive in the 21st century. Learning and the ability to learn faster and more
easily makes everything else in life possible, which means that it’s never
been a better time to train your brain the way you do your body. Just like
you want a healthy body, you want a flexible, strong, energized, and fit
brain. That’s what Jim does for a living—he is the personal trainer for the
mind.
The four supervillains are just an example of the limits you’ll learn how
to overcome in this book. The key to living an exceptional life, as Jim
states, is a process of unlimiting ourselves. And he has cracked the code for
personal transformation with his Limitless Model. If you are struggling to
reach a goal in any area, you must first ask: Where is the limit? Most likely,
you’re experiencing a limit in your mindset, motivation, or methods—
which means that it’s not a personal shortcoming or failure pointing to any
perceived lack of ability. And contrary to what we tend to believe, our
barriers are not set. We’re in full control and can overcome them at any
time.
If our mindset is not aligned with our desires or goals, we will never
achieve them. It’s critical to identify your limiting beliefs, stories, and
deeply held beliefs, attitudes, and assumptions about yourself and what’s
possible. Examining, excavating, and expunging those beliefs is the first
step to having a limitless mindset. I was told I could do anything by my
mother, that I was smart, capable, and could be the best at anything I tried.
That deeply held belief allowed me to succeed beyond my wildest dreams.
But I also had the belief that relationships were hard and filled with pain
and drama from witnessing my parents’ divorce and marriages. It took me
nearly 50 years to erase that belief and find real happiness in my marriage.
The second secret to a limitless life is your motivation. Jim outlines three
key elements to motivation. First, your purpose. The reason why matters. I
want to age well and am committed to lifting weights and getting stronger
even though it is not my favorite thing to do. The purpose supersedes the
discomfort.
The second key is the ability to do what you want. This requires energy,
and energy requires something called energy management. The science of
human performance is critical to achieving your purpose—eating whole
unprocessed food, exercise, stress management, quality sleep, and skills at
communication and building healthy relationships (and eliminating toxic
ones). And lastly the tasks must be bite-size, small steps that lead to
success. Floss one tooth, read one page of a book, do one push-up, meditate
for one minute, all of which will lead to confidence, and ultimately bigger
successes.
The last key to being limitless is using the right method. We have been
taught 19th- and 20th-century tools for functioning in the 21st century.
Limitless teaches us the five key methods to achieve whatever we want:
Focus, Study, Memory Enhancement, Speed Reading, and Critical
Thinking. Using these upgraded learning technologies allows us to harness
our mindset and motivation to more easily and effectively reach our dreams.
Jim is no stranger to limits. After a head injury as a child impaired his
focus, concentration, and ability to learn, an insensitive teacher pointed to
him and said, “There’s the boy with a broken brain.” Jim has spent his life
learning how to overcome and heal from this injury and turn his challenges
into a superpower of learning. We all suffer to some degree or another from
broken brains. Limitless is the prescription for healing our brains, reframing
limiting beliefs, and upgrading our life. Learning how to learn is the
ultimate superpower, the one that makes every other skill and ability
possible, and teaching this to you is this book’s goal.
In Limitless, Jim Kwik provides a road map for doing exactly this. Most
of us are not raised with the tools we need, but Jim is generously sharing
everything he’s learned in this book. Jim has spent three decades working in
the trenches with people from all walks of life—students, teachers,
celebrities, construction workers, politicians, entrepreneurs, scientists. He
has worked with some of the most advanced educational systems around the
world, training educators, superintendents, and students in his methods. His
teachings truly work and can benefit us all.
There is no pill for genius, but there is a process to get there, and you’ll
find it within these pages. Limitless is a blueprint for upgrading your brain,
for not only learning how to learn faster, better, and more effectively, but
also for healing your physical brain through nutrition, supplements,
exercise, meditation, sleep, and more to increase the creation of new brain
cells and the connections between them.
Jim delivers three books in one. If your current mindset, motivation, and
methods are limiting your ability to achieve your dreams, then Limitless is
the owner’s manual to a better, brighter, brilliant brain and future. Your
learning and life will never be the same.
')
SET IDENTITY_INSERT [dbo].[BookCopy] OFF
GO
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'fdfdsfds', N'fdsfsdfsdf', N'fsdfsdfsdf', N'sdfsdfsdfdsfsd@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'fsdfsdf', N'fsdfsdf', N'fsdfjsdfksdfs', N'fsdfdsfs@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'manh', N'123', N'manh mon', N'nguyenkhoi@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'nam', N'nam', N'nam', N'nam@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'nam123', N'nam', N'nam', N'nam@gmail.com', NULL)
INSERT [dbo].[Borrower] ([username], [password], [name], [email], [deposit]) VALUES (N'nguyen', N'123', N'nguyen khoi', N'nguyenkhoi@gmail.com', NULL)
GO
INSERT [dbo].[Category] ([category_name], [img_link]) VALUES (N'Business', N'https://openlibrary.org/static/images/categories/religion.svg')
INSERT [dbo].[Category] ([category_name], [img_link]) VALUES (N'Fiction', N'https://openlibrary.org/static/images/categories/science_fiction.svg')
INSERT [dbo].[Category] ([category_name], [img_link]) VALUES (N'Health', N'https://openlibrary.org/static/images/categories/medicine.svg')
INSERT [dbo].[Category] ([category_name], [img_link]) VALUES (N'History', N'https://openlibrary.org/static/images/categories/history.svg')
INSERT [dbo].[Category] ([category_name], [img_link]) VALUES (N'Novel', N'https://openlibrary.org/static/images/categories/art.svg')
INSERT [dbo].[Category] ([category_name], [img_link]) VALUES (N'Romance', N'https://openlibrary.org/static/images/categories/romance.svg')
GO
SET IDENTITY_INSERT [dbo].[Review] ON

INSERT [dbo].[Review] ([id], [title], [content], [date], [isbn], [username], [score]) VALUES (1, N'test', N'test', CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'0134685997', N'nam', 5)
INSERT [dbo].[Review] ([id], [title], [content], [date], [isbn], [username], [score]) VALUES (2, N'test', N'test', CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'0134685997', N'nam', 4)
INSERT [dbo].[Review] ([id], [title], [content], [date], [isbn], [username], [score]) VALUES (3, N'test', N'test', CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'B082ZQDH63', N'nam', 3)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([author_id])
    REFERENCES [dbo].[Author] ([author_id])
GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD FOREIGN KEY([author_id])
    REFERENCES [dbo].[Author] ([author_id])
GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD FOREIGN KEY([author_id])
    REFERENCES [dbo].[Author] ([author_id])
GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD FOREIGN KEY([book_isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD FOREIGN KEY([book_isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Book_Category]  WITH CHECK ADD FOREIGN KEY([category_name])
    REFERENCES [dbo].[Category] ([category_name])
GO
ALTER TABLE [dbo].[Book_Category]  WITH CHECK ADD FOREIGN KEY([category_name])
    REFERENCES [dbo].[Category] ([category_name])
GO
ALTER TABLE [dbo].[Book_Category]  WITH CHECK ADD FOREIGN KEY([isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Book_Category]  WITH CHECK ADD FOREIGN KEY([isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Book_Reservation]  WITH CHECK ADD FOREIGN KEY([reservation_id])
    REFERENCES [dbo].[Reservation] ([id])
GO
ALTER TABLE [dbo].[Book_Reservation]  WITH CHECK ADD FOREIGN KEY([isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[BookCopy]  WITH CHECK ADD FOREIGN KEY([isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[BookCopy]  WITH CHECK ADD FOREIGN KEY([isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[BookRentedCount]  WITH CHECK ADD FOREIGN KEY([isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[BookRentedCount]  WITH CHECK ADD FOREIGN KEY([isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD FOREIGN KEY([book_copy_id])
    REFERENCES [dbo].[BookCopy] ([book_id])
GO
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD FOREIGN KEY([book_copy_id])
    REFERENCES [dbo].[BookCopy] ([book_id])
GO
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD FOREIGN KEY([borrower_id])
    REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD FOREIGN KEY([borrower_id])
    REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([username])
    REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([username])
    REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[ReadingLog]  WITH CHECK ADD FOREIGN KEY([username])
    REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[ReadingLog]  WITH CHECK ADD FOREIGN KEY([isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([username])
    REFERENCES [dbo].[Borrower] ([username])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([isbn])
    REFERENCES [dbo].[Book] ([isbn])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([username])
    REFERENCES [dbo].[Borrower] ([username])
GO
