USE [OnlineShopping]
GO
/****** Object:  Table [dbo].[ActionInFunctions]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionInFunctions](
	[FunctionId] [int] IDENTITY(1,1) NOT NULL,
	[ActionId] [int] NOT NULL,
 CONSTRAINT [PK_ActionInFunctions] PRIMARY KEY CLUSTERED 
(
	[FunctionId] ASC,
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[Id] [int] NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdvertisementPages]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisementPages](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AdvertisementPages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdvertisementPositions]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisementPositions](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PageId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AdvertisementPositions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertisements]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PositionId] [varchar](50) NOT NULL,
	[PageId] [varchar](50) NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
	[Video] [nvarchar](250) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[ClickCount] [int] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Advertisements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttributeValues]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttributeId] [int] NULL,
	[Name] [nvarchar](128) NULL,
 CONSTRAINT [PK_AttributeValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogs]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[SeoAlias] [varchar](128) NULL,
	[SiteTitle] [nvarchar](128) NULL,
	[MetaKeywords] [nvarchar](158) NULL,
	[MetaDescription] [nvarchar](158) NULL,
	[ParentId] [int] NULL,
	[SortOrder] [int] NULL,
	[Visibility] [bit] NOT NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[ParentId] [int] NULL,
	[SortOrder] [int] NULL,
	[ShowInMenu] [bit] NULL,
	[ShowInHome] [bit] NULL,
	[Thumbnail] [nvarchar](250) NULL,
	[SeoAlias] [varchar](128) NULL,
	[SiteTitle] [nvarchar](128) NULL,
	[MetaKeywords] [nvarchar](158) NULL,
	[MetaDescription] [nvarchar](158) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
	[Report] [int] NULL,
	[PostId] [int] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] NOT NULL,
	[CustomerName] [nvarchar](128) NULL,
	[CustomerPhone] [nvarchar](128) NULL,
	[CustomerEmail] [nvarchar](128) NULL,
	[CustomerAddress] [nvarchar](128) NULL,
	[CustomerCity] [nvarchar](128) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footers]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footers](
	[Id] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Footers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Functions]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ParentId] [int] NULL,
	[SortOrder] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Functions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quanity] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrdersDate] [datetime] NULL,
	[Status] [int] NOT NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 9/23/2019 5:36:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[SeoAlias] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[SiteTitle] [nvarchar](128) NULL,
	[MetaKeywords] [nvarchar](158) NULL,
	[MetaDescription] [nvarchar](158) NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[UserId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
	[FunctionId] [int] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ActionId] ASC,
	[FunctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostInCategories]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostInCategories](
	[PostId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_PostInCategories] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostInTags]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostInTags](
	[PostId] [int] NOT NULL,
	[TagId] [varchar](250) NOT NULL,
 CONSTRAINT [PK_PostInTags] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Content] [ntext] NULL,
	[Thumbnail] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[ImageCaption] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[PublishedDate] [datetime] NULL,
	[Source] [nvarchar](250) NULL,
	[Status] [int] NOT NULL,
	[SeoAlias] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoMetaKeywords] [nvarchar](158) NULL,
	[SeoMetaDescription] [nvarchar](158) NULL,
	[HotDate] [datetime] NULL,
	[NewDate] [datetime] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttributes]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttributes](
	[ProductId] [int] NOT NULL,
	[AttributeValueId] [int] NOT NULL,
 CONSTRAINT [PK_ProductAttributes] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[AttributeValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductLinks]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLinks](
	[Id] [int] NOT NULL,
	[ProductId] [int] NULL,
	[LinkedProductId] [int] NULL,
 CONSTRAINT [PK_ProductLinks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[CatalogId] [int] NULL,
	[Description] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[Price] [decimal](18, 2) NULL,
	[PromotionPrice] [decimal](18, 2) NULL,
	[Image] [nvarchar](128) NULL,
	[ThumbImage] [nvarchar](128) NULL,
	[ImageList] [nvarchar](max) NULL,
	[SiteTitle] [nvarchar](128) NULL,
	[MetaKeywords] [nvarchar](158) NULL,
	[MetaDescription] [nvarchar](158) NULL,
	[ViewCount] [int] NULL,
	[Warranty] [int] NULL,
	[Video] [nvarchar](128) NULL,
	[DateCreated] [datetime] NULL,
	[UserCreated] [int] NULL,
	[DateModified] [datetime] NULL,
	[UserModified] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ValueNumber] [int] NULL,
	[ValueBit] [bit] NULL,
	[ValueString] [nvarchar](50) NULL,
	[ValueDate] [date] NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[Id] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [nvarchar](250) NULL,
	[SortOrder] [int] NULL,
	[Url] [varchar](250) NULL,
	[Target] [varchar](10) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [varchar](250) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/23/2019 5:36:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Birthday] [date] NULL,
	[Address] [nvarchar](250) NULL,
	[RegisteredDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActionInFunctions]  WITH CHECK ADD  CONSTRAINT [FK_ActionInFunctions_Actions] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Actions] ([Id])
GO
ALTER TABLE [dbo].[ActionInFunctions] CHECK CONSTRAINT [FK_ActionInFunctions_Actions]
GO
ALTER TABLE [dbo].[ActionInFunctions]  WITH CHECK ADD  CONSTRAINT [FK_ActionInFunctions_Functions] FOREIGN KEY([FunctionId])
REFERENCES [dbo].[Functions] ([Id])
GO
ALTER TABLE [dbo].[ActionInFunctions] CHECK CONSTRAINT [FK_ActionInFunctions_Functions]
GO
ALTER TABLE [dbo].[AdvertisementPositions]  WITH CHECK ADD  CONSTRAINT [FK_AdvertisementPositions_AdvertisementPages] FOREIGN KEY([PageId])
REFERENCES [dbo].[AdvertisementPages] ([Id])
GO
ALTER TABLE [dbo].[AdvertisementPositions] CHECK CONSTRAINT [FK_AdvertisementPositions_AdvertisementPages]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_AdvertisementPages] FOREIGN KEY([PageId])
REFERENCES [dbo].[AdvertisementPages] ([Id])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_AdvertisementPages]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_AdvertisementPositions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[AdvertisementPositions] ([Id])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_AdvertisementPositions]
GO
ALTER TABLE [dbo].[AttributeValues]  WITH CHECK ADD  CONSTRAINT [FK_AttributeValues_Attributes] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[Attributes] ([Id])
GO
ALTER TABLE [dbo].[AttributeValues] CHECK CONSTRAINT [FK_AttributeValues_Attributes]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [dbo].[Functions]  WITH CHECK ADD  CONSTRAINT [FK_Functions_Functions] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Functions] ([Id])
GO
ALTER TABLE [dbo].[Functions] CHECK CONSTRAINT [FK_Functions_Functions]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Actions] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Actions] ([Id])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Actions]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Functions] FOREIGN KEY([FunctionId])
REFERENCES [dbo].[Functions] ([Id])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Functions]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Users]
GO
ALTER TABLE [dbo].[PostInCategories]  WITH CHECK ADD  CONSTRAINT [FK_PostInCategories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[PostInCategories] CHECK CONSTRAINT [FK_PostInCategories_Categories]
GO
ALTER TABLE [dbo].[PostInCategories]  WITH CHECK ADD  CONSTRAINT [FK_PostInCategories_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostInCategories] CHECK CONSTRAINT [FK_PostInCategories_Posts]
GO
ALTER TABLE [dbo].[PostInTags]  WITH CHECK ADD  CONSTRAINT [FK_PostInTags_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostInTags] CHECK CONSTRAINT [FK_PostInTags_Posts]
GO
ALTER TABLE [dbo].[PostInTags]  WITH CHECK ADD  CONSTRAINT [FK_PostInTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[PostInTags] CHECK CONSTRAINT [FK_PostInTags_Tags]
GO
ALTER TABLE [dbo].[ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributes_AttributeValues] FOREIGN KEY([ProductId])
REFERENCES [dbo].[AttributeValues] ([Id])
GO
ALTER TABLE [dbo].[ProductAttributes] CHECK CONSTRAINT [FK_ProductAttributes_AttributeValues]
GO
ALTER TABLE [dbo].[ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributes_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductAttributes] CHECK CONSTRAINT [FK_ProductAttributes_Products]
GO
ALTER TABLE [dbo].[ProductLinks]  WITH CHECK ADD  CONSTRAINT [FK_ProductLinks_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductLinks] CHECK CONSTRAINT [FK_ProductLinks_Products]
GO
ALTER TABLE [dbo].[ProductLinks]  WITH CHECK ADD  CONSTRAINT [FK_ProductLinks_Products1] FOREIGN KEY([LinkedProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductLinks] CHECK CONSTRAINT [FK_ProductLinks_Products1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Catalogs] FOREIGN KEY([CatalogId])
REFERENCES [dbo].[Catalogs] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Catalogs]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
