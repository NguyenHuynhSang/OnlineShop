USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 12/27/2019 7:42:10 AM ******/
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 
GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShop', N'ON'
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE = OFF
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[About]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[ID] [varchar](2) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[OrderStatusID] [nchar](10) NULL,
	[Note] [nvarchar](250) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](10) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludedVAT] [bit] NULL,
	[Quantity] [int] NOT NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Content] [ntext] NULL,
	[OrginalPrice] [decimal](18, 0) NULL,
	[IsHot] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttributes]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttributes](
	[ProductID] [bigint] NOT NULL,
	[AttribureValueID] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductAttributes] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[AttribureValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[GroupID] [varchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (1, N'ABC', NULL, NULL, 0, NULL, CAST(N'2019-12-07T10:11:12.080' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome], [Language]) VALUES (2, N'XYZ', NULL, 1, 0, NULL, CAST(N'2019-12-07T10:11:16.147' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Tags], [Language]) VALUES (1, N'ABC', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-07T10:10:17.213' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Tags], [Language]) VALUES (2, N'XYZ', NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2019-12-07T10:10:31.070' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Content] OFF
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'ADD_CONTENT')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'ADD_USER')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'DEL_USER')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'EDIT_CONTENT')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'EDIT_USER')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'VIEW_USER')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'MOD', N'EDIT_USER')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'MOD', N'VIEW_USER')
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (1, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-25T19:56:09.353' AS DateTime), 1)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (2, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-25T19:56:20.593' AS DateTime), 1)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (3, N'sad', N'ádas', N'ádas', NULL, N'ádas', CAST(N'2019-12-25T19:59:01.593' AS DateTime), 1)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreatedDate], [Status]) VALUES (4, N'Sáng', N'0123456', N'yourname@gmail.com', NULL, N'áds', CAST(N'2019-12-26T15:14:10.843' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/', 1, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Giới thiệu', N'/gioi-thieu', 2, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Tin tức', N'/tin-tuc', 3, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Sản phẩm', N'/san-pham', 4, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên hệ', N'/lien-he', 5, N'_self', 1, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu Client Chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu Client Top')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (10018, CAST(N'2019-12-24T23:48:46.743' AS DateTime), NULL, N'Sáng', N'0967096940', N'Ngã năm sóc trăng', N'16521022@gm.uit.edu.vn', 5, NULL, N'')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (10019, CAST(N'2019-12-25T14:40:36.303' AS DateTime), NULL, N'Nam', N'0123424212', N'Xóm chó', N'nam@ge.com', 4, NULL, N'Có tặng quà không shop')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (10020, CAST(N'2019-12-25T14:42:09.613' AS DateTime), NULL, N'A', N'0123424212', N'Ngã năm sóc trănga', N'yourname@gmail.com', 4, NULL, N'a')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (10021, CAST(N'2019-12-26T17:27:29.870' AS DateTime), NULL, N'Sáng', N'0123424212', N'Ngã năm sóc trăng', N'16521022@gm.uit.edu.vn', 3, NULL, N'd')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (10022, CAST(N'2019-12-26T23:57:13.777' AS DateTime), NULL, N'A', N'0123424212', N'Ngã năm sóc trăng', N'yourname@gmail.com', 1, NULL, N'dsd')
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 10019, 20, CAST(26000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 10020, 20, CAST(26000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10026, 10019, 1, CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10026, 10022, 1, CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (20026, 10018, 1, CAST(20999000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (20026, 10019, 30, CAST(20999000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (20027, 10021, 1, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (20028, 10018, 1, CAST(1290000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice], [IsHot]) VALUES (1, N'Iphone 11 Pro Max', NULL, N'iphone-11-max', NULL, N'https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-green-400x460.png', NULL, CAST(28000000 AS Decimal(18, 0)), CAST(26000000 AS Decimal(18, 0)), 1, 100, 2, NULL, NULL, CAST(N'2019-11-25T16:36:37.707' AS DateTime), NULL, CAST(N'2019-12-26T19:27:43.423' AS DateTime), NULL, NULL, NULL, 1, NULL, 0, N'<h2 dir="ltr">Trong năm 2019 th&igrave; chiếc <a href="https://www.thegioididong.com/dtdd" target="_blank" title="Tham khảo giá điện thoại smartphone chính hãng">smartphone</a> được nhiều người mong muốn sở hữu tr&ecirc;n tay v&agrave; sử dụng nhất kh&ocirc;ng ai kh&aacute;c ch&iacute;nh l&agrave; <a href="https://www.thegioididong.com/dtdd/iphone-11-pro-max" target="_blank" title="Tham khảo điện thoại iPhone 11 Pro Max 64GB chính hãng">iPhone 11 Pro Max 64GB</a>&nbsp;tới từ nh&agrave; Apple.</h2>

<h3 dir="ltr">Camera được cải tiến mạnh mẽ</h3>

<p dir="ltr">Chắc chắn l&yacute; do lớn nhất m&agrave; bạn muốn n&acirc;ng cấp l&ecirc;n iPhone 11 Pro Max ch&iacute;nh l&agrave; cụm camera mới được Apple n&acirc;ng cấp rất nhiều.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-6.jpg" onclick="return false;"><img alt="iPhone 11 Pro Max 64GB | Cụm ba camera sau ấn tượng" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-6.jpg" style="display:block" title="iPhone 11 Pro Max 64GB | Cụm ba camera sau ấn tượng" /></a></p>

<p dir="ltr">Lần đầu ti&ecirc;n ch&uacute;ng ta sẽ c&oacute; một chiếc <a href="https://www.thegioididong.com/dtdd-apple-iphone" target="_blank" title="Tham khảo iPhone chính hãng">iPhone</a> với 3 camera ở mặt sau v&agrave; cả 3 camera n&agrave;y đều c&oacute; độ ph&acirc;n giải l&agrave; 12 MP.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-3.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Giao diện chụp ảnh camera" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-3.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Giao diện chụp ảnh camera" /></a></p>

<p dir="ltr">Ch&uacute;ng ta sẽ c&oacute; một camera g&oacute;c thường, một camera g&oacute;c rộng v&agrave; một camera tele đ&aacute;p ứng đầy đủ nhu cầu chụp ảnh h&agrave;ng ng&agrave;y của người d&ugrave;ng.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd11.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Ảnh chụp chân dung bằng camera sau" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd11.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Ảnh chụp chân dung bằng camera sau" /></a></p>

<p dir="ltr" style="text-align:center"><em>Ảnh chụp ch&acirc;n dung camera sau</em></p>

<p dir="ltr">Một cải tiến nữa cũng rất đ&aacute;ng ch&uacute; &yacute; ch&iacute;nh l&agrave; <a href="https://www.thegioididong.com/hoi-dap/night-mode-la-gi-diem-khac-nhau-giu-night-mode-va-1197122" target="_blank" title="Tìm hiểu chế độ Night Mode" type="Tìm hiểu chế độ Night Mode">chế độ Night Mode</a> mới sẽ gi&uacute;p bạn cải thiện rất nhiều chất lượng ảnh chụp đ&ecirc;m tr&ecirc;n iPhone.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd10.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Ảnh chụp chân dung ngược sáng với HDR" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd10.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Ảnh chụp chân dung ngược sáng với HDR" /></a></p>

<p dir="ltr" style="text-align:center"><em>Ảnh chụp ch&acirc;n dung ngược s&aacute;ng với HDR</em></p>

<p dir="ltr">T&ugrave;y thuộc v&agrave;o điều kiện m&ocirc;i trường bạn chụp m&agrave; iPhone sẽ đưa ra những th&ocirc;ng số ph&ugrave; hợp để bạn c&oacute; thể c&oacute; cho m&igrave;nh được một bức ảnh ưng &yacute; nhất.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd12.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Chế độ Night Mode mới" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd12.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Chế độ Night Mode mới" /></a></p>

<p dir="ltr" style="text-align:center"><em>Chế độ Night Mode mới</em></p>

<p dir="ltr">Chế độ ch&acirc;n dung kh&ocirc;ng chỉ tốt hơn trong việc lấy n&eacute;t v&agrave;o đối tượng muốn chụp, m&agrave; c&ograve;n hoạt động được ở khoảng c&aacute;ch &#39;b&igrave;nh thường&#39; nhờ sự trợ gi&uacute;p của cảm biến độ s&acirc;u.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd1-1.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Ảnh chụp bằng chế độ Night Mode" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd1-1.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Ảnh chụp bằng chế độ Night Mode" /></a></p>

<p dir="ltr" style="text-align:center"><em>Sự kh&aacute;c biệt với Night Mode tr&ecirc;n iPhone 11 Pro Max</em></p>

<p dir="ltr">So với người anh em <a href="https://www.thegioididong.com/dtdd/iphone-xs-max" target="_blank" title="Tham khảo giá điện thoại iPhone Xs Max chính hãng" type="Tham khảo giá điện thoại iPhone Xs Max chính hãng">iPhone Xs Max</a> th&igrave; với việc được t&iacute;ch hợp th&ecirc;m một camera g&oacute;c rộng người d&ugrave;ng iPhone giờ đ&acirc;y sẽ c&oacute; được cho m&igrave;nh những khung h&igrave;nh độc đ&aacute;o hơn.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd7.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Ảnh chụp chế độ thường bằng camera sau" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd7.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Ảnh chụp chế độ thường bằng camera sau" /></a></p>

<p dir="ltr" style="text-align:center"><em>Ảnh chụp chế độ cơ bản b&igrave;nh thường với camera ch&iacute;nh</em></p>

<p dir="ltr">Bạn muốn chụp một t&ograve;a nh&agrave; cao tầng, bạn muốn ghi lại khung cảnh thi&ecirc;n nhi&ecirc;n h&ugrave;ng vĩ m&agrave; m&igrave;nh nh&igrave;n thấy th&igrave; camera <a href="https://www.thegioididong.com/dtdd-camera-goc-rong" target="_blank" title="Tham khảo các dòng điện thoại hỗ trợ chụp góc rộng" type="Tham khảo các dòng điện thoại hỗ trợ chụp góc rộng">g&oacute;c si&ecirc;u rộng</a>&nbsp;sẽ l&agrave;m rất tốt trong những điều kiện n&agrave;y.</p>

<p dir="ltr"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd16.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Giao diện chuyển đổi các ống kính camera" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd16.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Giao diện chuyển đổi các ống kính camera" /></a></p>

<h3 dir="ltr">Camera trước cũng mang lại sự kh&aacute;c biệt</h3>

<p dir="ltr">Kh&ocirc;ng chỉ c&oacute; camera ch&iacute;nh m&agrave; camera selfie tr&ecirc;n iPhone 11 Pro Max cũng được cải thiện rất nhiều.</p>

<p dir="ltr"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-20.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Trải nghiệm Face ID" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-20.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Trải nghiệm Face ID" /></a></p>

<p dir="ltr">Đầu ti&ecirc;n ch&uacute;ng ta c&oacute; thể kể tới l&agrave; độ ph&acirc;n giải giờ đ&acirc;y đ&atilde; được n&acirc;ng l&ecirc;n th&agrave;nh 12 MP thay v&igrave; 7 MP như tr&ecirc;n thế hệ trước.</p>

<p dir="ltr"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-19.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | So sánh khả năng selfie với Xs Max" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-19.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | So sánh khả năng selfie với Xs Max" /></a></p>

<p dir="ltr" style="text-align:center"><em>So s&aacute;nh ảnh selfie iPhone 11 Pro Max v&agrave; iPhone Xs Max</em></p>

<p dir="ltr">Tiếp theo ch&uacute;ng ta sẽ c&oacute; c&ocirc;ng nghệ quay video độ ph&acirc;n giải 4K ngay tr&ecirc;n camera trước một điều m&agrave; những chiếc iPhone trước đ&acirc;y chưa thể l&agrave;m được.</p>

<p dir="ltr">Ngo&agrave;i ra bạn cũng c&oacute; thể d&ugrave;ng camera trước để quay video slow motion (quay chậm) gi&uacute;p bạn c&oacute; được những video&nbsp; th&uacute; vị v&agrave; vui vẻ với bạn b&egrave;.</p>

<p dir="ltr"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd6.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Giao diện chụp ảnh chế độ zoom quang học" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd6.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Giao diện chụp ảnh chế độ zoom quang học" /></a></p>

<p dir="ltr">Một t&iacute;nh năng mới cũng được Apple t&iacute;ch hợp tr&ecirc;n iPhone mới đ&oacute; ch&iacute;nh l&agrave; khả năng tự động nhận diện để thay đổi g&oacute;c chụp gi&uacute;p bạn lấy được nhiều chi tiết hơn.</p>

<p dir="ltr"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max.gif" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Ảnh chụp chế độ slofie" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max.gif" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Ảnh chụp chế độ slofie" /></a></p>

<p dir="ltr">V&iacute; dụ khi bạn để điện thoại ở chế độ chụp dọc th&igrave; m&aacute;y sẽ chụp ở g&oacute;c b&igrave;nh thường, c&ograve;n khi bạn xoay điện thoại nằm ngang th&igrave; m&aacute;y tự động sẽ điều chỉnh để bạn c&oacute; được một g&oacute;c chụp rộng hơn.</p>

<p dir="ltr">Xem th&ecirc;m:&nbsp;<a href="https://www.thegioididong.com/tin-tuc/danh-gia-chi-tiet-iphone-11-pro-max-1199526" target="_blank" title="Đánh giá chi tiết iPhone 11 Pro Max" type="Đánh giá chi tiết iPhone 11 Pro Max">Đ&aacute;nh gi&aacute; chi tiết iPhone 11 Pro Max: Chiếc smartphone đỉnh nhất 2019?</a></p>

<h3 dir="ltr">Hiệu năng &quot;đ&egrave; bẹp&quot; mọi đối thủ</h3>

<p dir="ltr">Mỗi năm ra mắt iPhone mới th&igrave; Apple lại n&acirc;ng cấp con chip của m&igrave;nh để m&aacute;y c&oacute; thể đạt được một hiệu năng tốt nhất v&agrave; với iPhone 11 Pro Max năm nay cũng kh&ocirc;ng phải l&agrave; một ngoại lệ.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-14.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Giao diện màn hình chính" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-14.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Giao diện màn hình chính" /></a></p>

<p dir="ltr">Chiếc iPhone mới n&agrave;y chạy tr&ecirc;n con chip <a href="https://www.thegioididong.com/hoi-dap/tim-hieu-ve-chip-apple-a13-bionic-tren-iphone-11-n-1197492" target="_blank" title="Tham khảo thêm về chip Apple A13 Bionic">Apple A13 Bionic</a>, con chip mạnh mẽ nhất d&agrave;nh cho những chiếc iPhone trong năm 2019.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-21.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Điểm hiệu năng Antutu Benchmark" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-21.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Điểm hiệu năng Antutu Benchmark" /></a></p>

<p dir="ltr">B&ecirc;n cạnh đ&oacute; bạn vẫn sẽ c&oacute; cho m&igrave;nh 4 GB RAM v&agrave; 64 GB bộ nhớ trong thoải m&aacute;i cho bạn c&agrave;i đặt game v&agrave; ứng dụng.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-2.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Trải nghiệm chơi game" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-2.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Trải nghiệm chơi game" /></a></p>

<p dir="ltr">Tất nhi&ecirc;n m&aacute;y cũng sẽ chạy tr&ecirc;n phi&ecirc;n bản <a href="https://www.thegioididong.com/hoi-dap/tat-ca-nhung-tinh-nang-moi-duoc-cap-nhat-tren-ios-1171206" target="_blank" title="Tìm hiểu những tính năng mới trên iOS 13" type="Tìm hiểu những tính năng mới trên iOS 13">iOS 13</a> mới nhất với nhiều cải tiến gi&uacute;p tối ưu h&oacute;a hiệu năng đem lại trải nghiệm mượt m&agrave; hơn cho người d&ugrave;ng.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd8.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Giao diện iOS 13 mới" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd8.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Giao diện iOS 13 mới" /></a></p>

<p dir="ltr" style="text-align:center"><em>Những t&iacute;nh năng tr&ecirc;n iOS 13 mới</em></p>

<p dir="ltr">Mọi game v&agrave; ứng dụng tr&ecirc;n iPhone 11 Pro Max hoạt động rất mượt m&agrave; v&agrave; ổn định, bạn hầu như sẽ kh&ocirc;ng thấy bất cứ độ trễ n&agrave;o trong qu&aacute; tr&igrave;nh sử dụng.</p>

<p dir="ltr">Năm nay Face ID cũng được cải thiện để c&oacute; thể nhận dạng ở nhiều g&oacute;c kh&aacute;c nhau mang lại trải nghiệm mở kh&oacute;a tốt hơn.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd17.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Công nghệ Haptic Engine mới " class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd17.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Công nghệ Haptic Engine mới " /></a></p>

<p dir="ltr">C&ocirc;ng nghệ Haptic Engine mới sẽ dựa tr&ecirc;n thời gian ấn v&agrave; giữ icon để hiện l&ecirc;n những menu chức năng kh&aacute;c nhau thay v&igrave; dựa v&agrave;o lực ấn như 3D Touch.</p>

<h3 dir="ltr">Dung lượng pin &#39;tr&acirc;u&#39;</h3>

<p dir="ltr">Apple đ&atilde; tuy&ecirc;n bố rằng iPhone 11 Pro Max c&oacute; thời lượng pin l&acirc;u hơn 5 giờ so với iPhone Xs&nbsp;Max.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd5.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Thời lượng sử dụng pin" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd5.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Thời lượng sử dụng pin" /></a></p>

<p dir="ltr">V&agrave; nếu bạn chưa biết th&igrave; iPhone 11 Pro Max l&agrave; chiếc iPhone c&oacute; dung lượng pin lớn nhất từ trước tới nay m&agrave; Apple từng sản xuất.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd9.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Thời lượng sử dụng pin trên iOS 13" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd9.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Thời lượng sử dụng pin trên iOS 13" /></a></p>

<p dir="ltr">Bạn c&oacute; thể sử dụng m&aacute;y thoải m&aacute;i từ s&aacute;ng tới tối m&agrave; kh&ocirc;ng cần phải bận t&acirc;m về việc nạp năng lượng cho m&aacute;y giữa chừng.</p>

<p dir="ltr">Tin vui l&agrave; năm nay Apple đ&atilde; trang bị củ <a href="https://www.thegioididong.com/dtdd?f=sac-pin-nhanh" target="_blank" title="Tham khảo giá điện thoại smartphone sạc pin nhanh">sạc nhanh</a> 18W đi k&egrave;m b&ecirc;n trong hộp của chiếc iPhone mới n&agrave;y.</p>

<p dir="ltr" style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-4.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Cổng sạc trên máy" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-4.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Cổng sạc trên máy" /></a></p>

<p dir="ltr">Tất nhi&ecirc;n bạn vẫn sẽ c&oacute; c&ocirc;ng nghệ sạc kh&ocirc;ng d&acirc;y v&agrave; thậm ch&iacute; l&agrave; sạc nhanh kh&ocirc;ng d&acirc;y để bạn c&oacute; thể sử dụng h&agrave;ng ng&agrave;y.</p>

<h3 dir="ltr">Những thay đổi về thiết kế v&agrave; m&agrave;n h&igrave;nh</h3>

<p dir="ltr">Để ph&acirc;n biệt iPhone 11 Pro Max v&agrave; iPhone Xs Max th&igrave; bạn bắt buộc phải nh&igrave;n v&agrave;o mặt lưng nơi sẽ c&oacute; cụm camera to bản hơn cũng như phần k&iacute;nh được ho&agrave;n thiện k&iacute;nh mờ thay v&igrave; b&oacute;ng như tr&ecirc;n thế trước.</p>

<p dir="ltr"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-17.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Thiết kế mặt lưng nổi bật cụm camera sau" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-17.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Thiết kế mặt lưng nổi bật cụm camera sau" /></a></p>

<p dir="ltr">Thiết kế mới n&agrave;y của Apple gi&uacute;p hạn chế mồ h&ocirc;i v&agrave; bụi bẩn b&aacute;m lại sau qu&aacute; tr&igrave;nh sử dụng, gi&uacute;p thiết bị lu&ocirc;n lu&ocirc;n c&oacute; được sự sang trọng v&agrave; b&oacute;ng bẩy.</p>

<p dir="ltr"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-7.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Thiết kế mặt lưng kính cao cấp" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-7.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Thiết kế mặt lưng kính cao cấp" /></a></p>

<p dir="ltr">Ngo&agrave;i ra logo Apple quen thuộc năm nay đ&atilde; được đặt ở ch&iacute;nh giữa mặt lưng thay v&igrave; đặt lệch về ph&iacute;a cạnh tr&ecirc;n như những chiếc iPhone trước đ&oacute;.</p>

<p dir="ltr">Một trong những điểm quan trọng được n&acirc;ng cấp trong m&agrave;n h&igrave;nh của iPhone mới đ&oacute; l&agrave; khả năng ph&aacute;t nội dung Dolby Vision.</p>

<p dir="ltr"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-tgdd3.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Trải nghiệm xem phim" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-tgdd3.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Trải nghiệm xem phim" /></a></p>

<p dir="ltr">Nhờ đ&oacute;, trải nghiệm xem phim sẽ cho h&igrave;nh ảnh chi tiết hơn v&agrave; mang đến những thước phim điện ảnh hơn nhiều.</p>

<p dir="ltr">iPhone thường đạt được độ s&aacute;ng 800 nits, nhưng với Dolby Vision mọi thứ thậm ch&iacute; c&ograve;n ấn tượng hơn (l&ecirc;n tới 1200 nits, theo Apple).</p>

<p dir="ltr"><a class="preventdefault" href="https://www.thegioididong.com/images/42/200533/iphone-11-pro-max-16.jpg" onclick="return false;"><img alt="Điện thoại iPhone 11 Pro Max 64GB | Khả năng hiển thị màn hình" class="lazy" src="https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-16.jpg" style="display:block" title="Điện thoại iPhone 11 Pro Max 64GB | Khả năng hiển thị màn hình" /></a></p>

<p dir="ltr">Với những n&acirc;ng cấp kh&aacute; nhiều đặc biệt l&agrave; về mặt camera v&agrave; hiệu năng th&igrave; iPhone 11 Pro Max năm nay hứa hẹn sẽ lại đem về th&agrave;nh c&ocirc;ng lớn cho Apple.</p>

<div class="boxRtAtc">
<div class="likewied">
<div class="likeshare">
<div class="fb-like fb_iframe_widget">&nbsp;</div>
</div>

<div class="clr">&nbsp;</div>
</div>
</div>
', CAST(23000000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice], [IsHot]) VALUES (2, N'Điện thoại Samsung Galaxy S10+ (512GB)', NULL, N'sam-sung-galaxy-s10-512gb', NULL, N'https://cdn.tgdd.vn/Products/Images/42/198986/sieu-pham-galaxy-s-moi-2-512gb-black-400x460.png', NULL, CAST(18000000 AS Decimal(18, 0)), CAST(18000000 AS Decimal(18, 0)), NULL, 0, 3, NULL, NULL, CAST(N'2019-11-25T16:58:10.057' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, CAST(18000000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice], [IsHot]) VALUES (3, N'Máy tính bảng iPad 10.2 inch Wifi Cellular 32GB (2019)', NULL, N'ipad-10-2-inch-wifi-cellular-32gb-2019', NULL, N'https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-gold-400x460.png', NULL, CAST(13999000 AS Decimal(18, 0)), CAST(12000000 AS Decimal(18, 0)), 1, 100, 3, NULL, NULL, CAST(N'2019-12-05T10:52:37.227' AS DateTime), NULL, CAST(N'2019-12-25T16:07:48.233' AS DateTime), NULL, NULL, NULL, 1, NULL, 0, N'<div class="characteristics">
<h2>Đặc điểm nổi bật của iPad 10.2 inch Wifi Cellular 32GB (2019)Nhắc tới <a href="https://www.thegioididong.com/may-tinh-bang" style="font-size: 13px;" target="_blank" title="Tham khảo máy tính bảng chính hãng">m&aacute;y t&iacute;nh bảng</a><span style="font-size:13px"> th&igrave; người ta sẽ nghĩ ngay tới iPad v&agrave; v&agrave;o những th&aacute;ng cuối năm 2019 th&igrave; Apple giới thiệu chiếc m&aacute;y t&iacute;nh bảng &quot;gi&aacute; rẻ&quot; mang t&ecirc;n&nbsp;</span><a href="https://www.thegioididong.com/may-tinh-bang/ipad-10-2-inch-wifi-32gb-2019" style="font-size: 13px;" target="_blank" title="Tham khảo iPad 10.2 inch Wifi Cellular 32GB (2019) chính hãng">iPad 10.2 inch Wifi Cellular 32GB (2019)</a><span style="font-size:13px">,&nbsp;nhắm tới đối tượng người d&ugrave;ng l&agrave; c&aacute;c bạn học sinh, sinh vi&ecirc;n hay những người muốn một thiết bị m&agrave;n h&igrave;nh lớn cho l&agrave;m việc v&agrave; giải tr&iacute;.</span></h2>
</div>

<div class="boxArticle">
<h3>M&agrave;n h&igrave;nh lớn, x&agrave;i đ&atilde; hơn</h3>

<p>Chắc chắn những người lựa chọn <a href="https://www.thegioididong.com/may-tinh-bang-apple-ipad" target="_blank" title="Tham khảo iPad chính hãng">iPad</a> phần lớn đều th&iacute;ch m&agrave;n h&igrave;nh k&iacute;ch thước lớn của n&oacute;.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd13.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Màn hình giải trí sắc nét" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd13.jpg" style="display:block" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Màn hình giải trí sắc nét" /></a></p>

<p>So với thế hệ tiền nhiệm th&igrave; iPad năm nay được Apple n&acirc;ng cấp k&iacute;ch thước m&agrave;n h&igrave;nh l&ecirc;n một ch&uacute;t l&agrave; 10.2 inch so với 9.7 inch như thế hệ trước.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd9.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Màn hình kích thước lớn" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd9.jpg" style="display:block" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Màn hình kích thước lớn" /></a></p>

<p>Điều n&agrave;y gi&uacute;p bạn sẽ c&oacute; nhiều kh&ocirc;ng gian hơn để sử dụng cho việc học tập, l&agrave;m việc v&agrave; giải tr&iacute; của m&igrave;nh.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd7.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiệm giải trí" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd7.jpg" style="display:block" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiệm giải trí" /></a></p>

<p>B&ecirc;n cạnh đ&oacute; th&igrave; tấm nền&nbsp;<a href="https://www.thegioididong.com/hoi-dap/man-hinh-ledbacklit-ips-lcd-la-gi-905757" target="_blank" title="Tìm hiểu màn hình LED backlit LCD">LED backlit LCD</a>&nbsp;được đ&aacute;ng gi&aacute; rất cao bởi độ s&aacute;ng v&agrave; m&agrave;u sắc trung thực m&agrave; n&oacute; mang lại.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd8-1.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Thiết kế cổng kết nối smart connector tiện lợi" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd8-1.jpg" style="display:block" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Thiết kế cổng kết nối smart connector tiện lợi" /></a></p>

<p>M&aacute;y vẫn giữ kiểu thiết kế truyền thống vốn đ&atilde; tồn tại tr&ecirc;n nhiều thế hệ iPad của Apple nhưng vẫn kh&ocirc;ng k&eacute;m phần sang trọng v&agrave; tiện dụng.</p>

<h3>Thời lượng pin vượt trội</h3>

<p>Những chiếc iPad lu&ocirc;n mang tới cho người d&ugrave;ng thời gian sử dụng vượt trội so với c&aacute;c đối thủ của m&igrave;nh.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd6.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Thời lượng pin vượt trội" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd6.jpg" style="display:block" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Thời lượng pin vượt trội" /></a></p>

<p>Với chiếc iPad n&agrave;y th&igrave; bạn ho&agrave;n to&agrave;n c&oacute; thể thoải m&aacute;i sử dụng trong khoảng 2-3 ng&agrave;y mới phải sạc pin.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd4.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Giao diện hệ điều hành iPad OS" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd4.jpg" style="display:block" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Giao diện hệ điều hành iPad OS" /></a></p>

<p>Việc onscreen li&ecirc;n tục được khoảng 10 tiếng l&agrave; một điều hết thức b&igrave;nh thường với chiếc m&aacute;y n&agrave;y v&agrave; nếu bạn chỉ d&ugrave;ng để xem phim th&igrave; n&oacute; c&ograve;n ấn tượng hơn nhiều.</p>

<h3>Hiệu năng mượt m&agrave; v&agrave; ổn định</h3>

<p>Tuy kh&ocirc;ng c&oacute; sức mạnh ấn tượng như những chiếc iPad Pro nhưng hiệu năng m&agrave; m&aacute;y mang lại vẫn đủ l&agrave;m h&agrave;i l&ograve;ng phần lớn người d&ugrave;ng.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd2-1.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Hiệu năng mạnh mẽ" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd2-1.jpg" style="display:block" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Hiệu năng mạnh mẽ" /></a></p>

<p>Cung cấp sức mạnh cho m&aacute;y l&agrave; con chip&nbsp;<a href="https://www.thegioididong.com/hoi-dap/tong-quan-ve-chip-a10-fusion-cua-apple-885052" target="_blank" title="Tìm hiểu chip Apple A10 Fusion">Apple A10 Fusion</a>&nbsp;kết hợp với 3 GB RAM v&agrave; 32 GB bộ nhớ trong.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd11-1.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiếm sử dụng mượt mà" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd11-1.jpg" style="display:block" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiếm sử dụng mượt mà" /></a></p>

<p>M&aacute;y hoạt động mượt m&agrave; v&agrave; ổn định với hầu hết c&aacute;c thao t&aacute;c hằng ng&agrave;y của người d&ugrave;ng.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd10.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Cổng kết nối Lightning" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd10.jpg" style="display:block" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Cổng kết nối Lightning" /></a></p>

<p>Bạn cũng c&oacute; thể sử dụng chiếc m&aacute;y n&agrave;y để chơi game v&agrave; sẽ c&oacute; một trải nghiệm m&agrave; kh&ocirc;ng một chiếc smartphone n&agrave;o c&oacute; được.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd12.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiệm sử dụng như một chiếc laptop" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd12.jpg" style="display:block" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiệm sử dụng như một chiếc laptop" /></a></p>

<p>Thao t&aacute;c cử chỉ vuốt đơn giản, dễ sử dụng gi&uacute;p bạn tiết kiệm được nhiều thời gian.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd5-1.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Cảm biến vân tay Touch ID" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd5-1.jpg" style="display:block" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Cảm biến vân tay Touch ID" /></a></p>

<p>&nbsp;</p>
</div>
', CAST(12000000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice], [IsHot]) VALUES (26, N'Điện thoại Samsung Galaxy Note 10 Đỏ', N'CODE01', N'Dien-thoai-Samsung-Galaxy-Note-10-Do', N'abc', N'/Data/images/DienThoai/SamSung/GalaxyS10Do/samsung-galaxy-note-10-do-docquyen-400x460.png', N'/Data/images/DienThoai/SamSung/GalaxyS10Do/samsung-galaxy-note-10-do-13-180x125.jpg
/Data/images/DienThoai/SamSung/GalaxyS10Do/samsung-galaxy-note-10-do-15-180x125.jpg
/Data/images/DienThoai/SamSung/GalaxyS10Do/samsung-galaxy-note-10-do-5-180x125.jpg', CAST(22000000 AS Decimal(18, 0)), CAST(20000000 AS Decimal(18, 0)), NULL, 29, 3, NULL, NULL, CAST(N'2019-12-07T10:32:22.877' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(20000000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice], [IsHot]) VALUES (10026, N'Laptop HP 348 G5 i3 7020U/4GB/256GB/Win10', N'LP-01', N'Laptop-HP-348-G5-i3-7020U-4GB-256GB-Win104', N'Laptop HP 348 G5 i3 có độ dày và trọng lượng lần lượt là 19.89 mm và 1.42 kg giúp người dùng dễ dàng mang theo khi đi học hay đi làm. ', N'/Data/files/hp-348-g5-i3-7020u-4gb-256gb-win10-7xj62pa-210172-600x600.jpg', NULL, CAST(9900000 AS Decimal(18, 0)), CAST(9000000 AS Decimal(18, 0)), NULL, 1, 14, NULL, NULL, CAST(N'2019-12-19T15:58:05.407' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(9000000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice], [IsHot]) VALUES (20026, N'Laptop Apple Macbook Air 2019 i5 1.6GHz', N'MVFM2SA/A', N'Laptop-Apple-Macbook-Air-2019-i5-1-6GHz5', N'MacBook Air 2019 128 GB i5 đã ra mắt giữ nguyên các ưu điểm vốn có của dòng MacBook Air: Mỏng nhẹ, cấu hình khỏe và pin trâu', N'/Data/files/apple-macbook-air-2019-i5-16ghz-8gb-128gb-mvfm2sa-13-32-600x600.jpg', NULL, CAST(27999000 AS Decimal(18, 0)), CAST(20999000 AS Decimal(18, 0)), NULL, 100, 14, NULL, NULL, CAST(N'2019-12-22T16:06:45.677' AS DateTime), NULL, CAST(N'2019-12-22T16:11:15.770' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(20999000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice], [IsHot]) VALUES (20027, N'Laptop Asus VivoBook A412FA i3 8145U-4GB', N'EK661T', N'Laptop-Asus-VivoBook-A412FA-i3-8145U-4GB6', N'Hiện đại và tiện dụng là những gì mà laptop ASUS VivoBook A412F i3 (EK661T) đem lại. Với thiết kế mỏng nhẹ cùng ổ cứng SSD tích hợp Intel Optane siêu nhanh đem đến những trải nghiệm tuyệt vời cho người dùng, đặc biệt phù hợp với giới trẻ. ', N'/Data/files/asus-vivobook-a412f-i3-8145u-4gb-32gb-512gb-win10-600x600.jpg', NULL, CAST(13000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, 100, 14, NULL, NULL, CAST(N'2019-12-22T16:13:59.993' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, CAST(13000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice], [IsHot]) VALUES (20028, N'Tay Cầm Xbox One S Chính Hãng', N'EK661T1', N'Tay-Cam-Xbox-One-S-Chinh-Hang7', N'<h4><span style="font-family:georgia,serif"><span style="font-size:12px">Khuyến m&atilde;i hot nhất:</span></span></h4>

<ul>
	<li><span style="font-family:georgia,serif"><span style="font-size:12px">- Tặng&nbsp;ngay Giftcard l&ecirc;n tới 50K cho đơn h&agrave;ng tr&ecirc;n 2.000.000 VNĐ</span></span></li>
	<li><span style="font-family:georgia,serif"><span style="font-size:12px">- Tặng ngay Giftcard l&ecirc;n tới 100K cho đơn h&agrave;ng tr&ecirc;n 5.000.000 VND</span></span></li>
</ul>
', N'/Data/files/Tay-cam-xbox-one-s-chinh-hang-co-day-cap-usb-cho-pc-bluetooth-gia-tai-ha-noi-tphcm-shoptaycam_com-01_02.jpg', NULL, CAST(1490000 AS Decimal(18, 0)), CAST(1290000 AS Decimal(18, 0)), NULL, 100, 5, NULL, NULL, CAST(N'2019-12-24T19:59:03.543' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'<h3>Ngoại h&igrave;nh mỏng nhẹ, đẹp mắt</h3>

<p>Ấn tượng đầu ti&ecirc;n về chiếc&nbsp;<a href="https://www.thegioididong.com/may-tinh-bang-samsung" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);" target="_blank" title="Tham khảo máy tính bảng Samsung chính hãng">m&aacute;y t&iacute;nh bảng Samsung</a>&nbsp;n&agrave;y ch&iacute;nh l&agrave; n&oacute; rất mỏng v&agrave; sang trọng, nếu&nbsp;bạn đang c&oacute; suy nghĩ l&agrave; những chiếc m&aacute;y t&iacute;nh bảng thường c&oacute; k&iacute;ch thước lớn, trọng lượng nặng v&agrave; kh&oacute; mang theo th&igrave; đ&acirc;y sẽ l&agrave; một trải nghiệm ho&agrave;n to&agrave;n kh&aacute;c.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/208870/samsung-galaxy-tab-s6-tgdd1.jpg" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);"><img alt="Máy tính bảng Samsung Galaxy Tab S6 | Thiết kế" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/208870/samsung-galaxy-tab-s6-tgdd1.jpg" style="border:0px; display:block; height:auto; margin:10px auto; max-height:584px; max-width:100%; padding:0px" title="Điện thoại Samsung Galaxy Tab S6 | Thiết kế" /></a></p>

<p>Với độ d&agrave;y chỉ 5.7 mm th&igrave; bạn c&oacute; thể dễ d&agrave;ng cho v&agrave;o t&uacute;i x&aacute;ch v&agrave; mang theo đi bất cứ đ&acirc;u m&agrave; m&igrave;nh muốn.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/208870/samsung-galaxy-tab-s6-tgdd3.jpg" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);"><img alt="Máy tính bảng Samsung Galaxy Tab S6 | Thiết kế" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/208870/samsung-galaxy-tab-s6-tgdd3.jpg" style="border:0px; display:block; height:auto; margin:10px auto; max-height:584px; max-width:100%; padding:0px" title="Điện thoại Samsung Galaxy Tab S6 | Thiết kế" /></a></p>

<p><a href="https://www.thegioididong.com/may-tinh-bang?g=tren-10" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);" target="_blank" title="Tham khảo giá máy tính bảng chính hãng màn hình khoảng 10 inch" type="Tham khảo giá máy tính bảng chính hãng màn hình khoảng 10 inch">M&agrave;n h&igrave;nh k&iacute;ch thước lớn</a>&nbsp;10.5 inch với tấm nền&nbsp;<a href="https://www.thegioididong.com/hoi-dap/man-hinh-super-amoled-la-gi-905770" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);" target="_blank" title="Tìm hiểu tấm nền Super AMOLED">Super AMOLED</a>&nbsp;chất lượng cao gi&uacute;p bạn dễ d&agrave;ng sử dụng ngay cả trong điều kiện &aacute;nh s&aacute;ng mạnh.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/208870/samsung-galaxy-tab-s6-tgdd2.jpg" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);"><img alt="Máy tính bảng Samsung Galaxy Tab S6 | Màn hình" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/208870/samsung-galaxy-tab-s6-tgdd2.jpg" style="border:0px; display:block; height:auto; margin:10px auto; max-height:584px; max-width:100%; padding:0px" title="Điện thoại Samsung Galaxy Tab S6 | Màn hình" /></a></p>

<p>Samsung Galaxy Tab S6&nbsp;ho&agrave;n to&agrave;n hỗ trợ tốt mọi người d&ugrave;ng cho mọi nhu cầu sử dụng: từ giải tr&iacute; xem phim, chơi game, cho đến học tập, l&agrave;m việc khi phải sử dụng m&aacute;y l&acirc;u d&agrave;i.</p>

<p>&nbsp;</p>

<div class="video" style="margin: 0px auto; padding: 0px; max-width: 100%; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;"><iframe frameborder="0" id="406204654" src="https://www.youtube.com/embed/YESDOyUkhSo?rel=0&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fwww.thegioididong.com" style="margin: 0px; padding: 0px; width: 750px; min-height: 422px;"></iframe></div>

<p>&nbsp;</p>

<h3>Chiếc tablet đầu ti&ecirc;n c&oacute; camera k&eacute;p</h3>

<p>Samsung Galaxy Tab S6 l&agrave; chiếc m&aacute;y t&iacute;nh bảng đầu ti&ecirc;n của Samsung được trang bị camera k&eacute;p &quot;xịn x&ograve;&quot;.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/208870/samsung-galaxy-tab-s6-tgdd6.jpg" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);"><img alt="Máy tính bảng Samsung Galaxy Tab S6 | Camera sau" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/208870/samsung-galaxy-tab-s6-tgdd6.jpg" style="border:0px; display:block; height:auto; margin:10px auto; max-height:584px; max-width:100%; padding:0px" title="Điện thoại Samsung Galaxy Tab S6 | Camera sau" /></a></p>

<p>Samsung n&oacute;i rằng 86% những người đ&atilde; mua Galaxy Tab S4 đ&atilde; sử dụng ứng dụng m&aacute;y ảnh &quot;thường xuy&ecirc;n&quot; v&igrave; thế h&atilde;ng muốn n&acirc;ng cao trải nghiệm về nhiếp ảnh tr&ecirc;n chiếc tablet mới của m&igrave;nh.</p>

<p>Ngo&agrave;i cảm biến ch&iacute;nh 13 MP th&igrave; m&aacute;y sở hữu th&ecirc;m 1 cảm biến g&oacute;c si&ecirc;u rộng với độ ph&acirc;n giải 5 MP nữa.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/208870/samsung-galaxy-tab-s6-tgdd11.jpg" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);"><img alt="Máy tính bảng Samsung Galaxy Tab S6 | Camera sau" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/208870/samsung-galaxy-tab-s6-tgdd11.jpg" style="border:0px; display:block; height:auto; margin:10px auto; max-height:584px; max-width:100%; padding:0px" title="Điện thoại Samsung Galaxy Tab S6 | Camera sau" /></a></p>

<p>Giờ đ&acirc;y bạn c&oacute; thể s&aacute;ng tạo cho m&igrave;nh nhiều bức ảnh đẹp hơn để chia sẻ với bạn b&egrave; nhờ camera g&oacute;c si&ecirc;u rộng n&agrave;y.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/208870/samsung-galaxy-tab-s6-tgdd-4.jpg" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);"><img alt="Máy tính bảng Samsung Galaxy Tab S6 | Ảnh chụp bằng camera sau" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/208870/samsung-galaxy-tab-s6-tgdd-4.jpg" style="border:0px; display:block; height:auto; margin:10px auto; max-height:584px; max-width:100%; padding:0px" title="Máy tính bảng Samsung Galaxy Tab S6 | Ảnh chụp bằng camera sau" /></a></p>

<p>Bạn vẫn sẽ c&oacute; camera trước 8 MP để thực hiện c&aacute;c cuộc gọi video với bạn b&egrave; v&agrave; người th&acirc;n.</p>

<p>Xem th&ecirc;m:&nbsp;<a href="https://www.thegioididong.com/tin-tuc/tren-tay-danh-gia-nhanh-galaxy-tab-s6-doi-thu-xung-tam-cua-ipad-1195380" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);" target="_blank" title="Trên tay &amp; đánh giá nhanh Galaxy Tab S6: Đối thủ xứng tầm của iPad đã xuất hiện?" type="Trên tay &amp; đánh giá nhanh Galaxy Tab S6: Đối thủ xứng tầm của iPad đã xuất hiện?">Tr&ecirc;n tay &amp; đ&aacute;nh gi&aacute; nhanh Galaxy Tab S6: Đối thủ xứng tầm của iPad đ&atilde; xuất hiện?</a></p>

<h3>B&uacute;t S Pen nhiều t&iacute;nh năng</h3>

<p>Samsung Galaxy Tab S6 sở hữu b&uacute;t S Pen mới với khả năng hỗ trợ Bluetooth như tr&ecirc;n chiếc Galaxy Note 9.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/208870/samsung-galaxy-tab-s6-tgdd9.jpg" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);"><img alt="Máy tính bảng Samsung Galaxy Tab S6 | Bút S-Pen" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/208870/samsung-galaxy-tab-s6-tgdd9.jpg" style="border:0px; display:block; height:auto; margin:10px auto; max-height:584px; max-width:100%; padding:0px" title="Máy tính bảng Samsung Galaxy Tab S6 | Bút S-Pen" /></a></p>

<p>Kết hợp b&uacute;t với m&aacute;y t&iacute;nh bảng sẽ hỗ trợ người d&ugrave;ng c&oacute; thể note, ph&aacute;c thảo c&aacute;c bản vẽ đồ họa, hoặc sử dụng như b&agrave;n di chuột thực thụ.</p>

<p>S Pen giờ đ&acirc;y c&oacute; thể thực hiện nhiều thao t&aacute;c hơn so với phi&ecirc;n bản cũ v&agrave; tr&ecirc;n ph&acirc;n th&acirc;n của chiếc tablet n&agrave;y c&ograve;n c&oacute; từ t&iacute;nh để bạn c&oacute; thể gắn S Pen v&agrave;o.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/208870/samsung-galaxy-tab-s6-tgdd12.jpg" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);"><img alt="Máy tính bảng Samsung Galaxy Tab S6 | Bàn phím" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/208870/samsung-galaxy-tab-s6-tgdd12.jpg" style="border:0px; display:block; height:auto; margin:10px auto; max-height:584px; max-width:100%; padding:0px" title="Máy tính bảng Samsung Galaxy Tab S6 | Bàn phím" /></a></p>

<p>B&ecirc;n cạnh đ&oacute;&nbsp;Galaxy Tab S6 c&ograve;n hỗ trợ th&ecirc;m b&agrave;n ph&iacute;m rời gi&uacute;p biến chiếc m&aacute;y th&agrave;nh một chiếc laptop &quot;thực thụ&quot;.</p>

<p>Điểm n&acirc;ng cấp của bộ b&agrave;n ph&iacute;m n&agrave;y so với thế hệ cũ ch&iacute;nh l&agrave; hỗ trợ th&ecirc;m phần&nbsp;trackpad để bạn c&oacute; thể sử dụng tiện lợi hơn thay v&igrave; phải cảm ứng tr&ecirc;n phần m&agrave;n h&igrave;nh như trước.</p>

<h3>Hiệu năng h&agrave;ng đầu thế giới Android</h3>

<p>Samsung Galaxy Tab S6&nbsp;với nền tảng Android 9.0, trang bị chip&nbsp;Qualcomm Snapdragon 855 8 nh&acirc;n, RAM 6 GB c&ugrave;ng bộ nhớ ROM 128 GB cho hoạt động nhanh ch&oacute;ng.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/208870/samsung-galaxy-tab-s6-tgdd8.jpg" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);"><img alt="Máy tính bảng Samsung Galaxy Tab S6 | Cấu hình" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/208870/samsung-galaxy-tab-s6-tgdd8.jpg" style="border:0px; display:block; height:auto; margin:10px auto; max-height:584px; max-width:100%; padding:0px" title="Máy tính bảng Samsung Galaxy Tab S6 | Cấu hình" /></a></p>

<p>B&ecirc;n cạnh đ&oacute;, vi&ecirc;n pin 7.040 mAh cho thời gian ph&aacute;t video l&ecirc;n đến 15 giờ li&ecirc;n tục theo như lời tuy&ecirc;n bố từ h&atilde;ng Samsung.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/208870/samsung-galaxy-tab-s6-tgdd-2.jpg" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);"><img alt="Máy tính bảng Samsung Galaxy Tab S6 | Điểm Antutu Benmark" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/208870/samsung-galaxy-tab-s6-tgdd-2.jpg" style="border:0px; display:block; height:auto; margin:10px auto; max-height:584px; max-width:100%; padding:0px" title="Máy tính bảng Samsung Galaxy Tab S6 | Điểm Antutu Benmark" /></a></p>

<p>M&aacute;y cũng hỗ trợ sạc nhanh qua cổng USB Type C gi&uacute;p bạn r&uacute;t ngắn được đ&aacute;ng kể thời gian chờ sạc.</p>

<p style="text-align:center"><a class="preventdefault" href="https://www.thegioididong.com/images/522/208870/samsung-galaxy-tab-s6-tgdd10.jpg" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);"><img alt="Máy tính bảng Samsung Galaxy Tab S6 | Cảm biến vân tay" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/208870/samsung-galaxy-tab-s6-tgdd10.jpg" style="border:0px; display:block; height:auto; margin:10px auto; max-height:584px; max-width:100%; padding:0px" title="Máy tính bảng Samsung Galaxy Tab S6 | Cảm biến vân tay" /></a></p>

<p>Cảm biến v&acirc;n tay trong m&agrave;n h&igrave;nh cũng xuất hiện tr&ecirc;n chiếc tablet n&agrave;y gi&uacute;p bạn c&oacute; thể trải nghiệm việc mở kh&oacute;a bằng v&acirc;n tay ở mặt trước m&agrave; kh&ocirc;ng phải hi sinh bất cứ bộ phận n&agrave;o.</p>
', CAST(1290000 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (1, N'Điện thoại', N'dien-thoai', NULL, NULL, NULL, CAST(N'2019-11-25T11:08:08.257' AS DateTime), NULL, CAST(N'2019-12-26T17:35:19.260' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (2, N'Iphone', N'iphone', 1, 0, NULL, CAST(N'2019-11-25T13:20:38.557' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'Samsung', N'samsung', 1, 0, NULL, CAST(N'2019-11-25T13:27:13.050' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (4, N'GamePad', N'gamepad', NULL, 0, NULL, CAST(N'2019-11-25T13:59:08.133' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'Xbox Controller', N'xbox-controller', 4, 0, NULL, CAST(N'2019-11-25T14:00:24.407' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (6, N'Máy tính', N'may-tinh', NULL, 0, NULL, CAST(N'2019-11-30T21:24:55.813' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (7, N'Console', N'console', NULL, 0, NULL, CAST(N'2019-11-30T21:25:59.800' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (8, N'Laptop', N'laptop', NULL, 0, NULL, CAST(N'2019-11-30T21:26:35.603' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (9, N'Game', NULL, NULL, 0, NULL, CAST(N'2019-11-30T21:26:53.963' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (10, N'Thiết bị âm thanh', NULL, NULL, 0, NULL, CAST(N'2019-11-30T21:27:08.870' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (11, N'Kính thực tế ảo', NULL, NULL, 0, NULL, CAST(N'2019-11-30T21:27:15.983' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (13, N'Sony Phone', N'Sony-Phone', 1, NULL, NULL, CAST(N'2019-12-14T11:50:27.627' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (14, N'HP', N'HP', 6, NULL, NULL, CAST(N'2019-12-19T15:53:52.647' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ACTIVE_USER', N'Kích hoạt tài khoản')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_CONTENT', N'Thêm tin tức')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', N'Thêm người dùng')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DEL_USER', N'Xóa User')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_CONTENT', N'Chỉnh sửa tin tức')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Chỉnh sửa User')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách User')
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'assets/client/images/banner/banner-2.jpg', 2, NULL, N'IPhone 11', CAST(N'2019-11-27T22:44:12.340' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'assets/client/images/banner/banner-3.jpg', 3, NULL, N'Mac Book', CAST(N'2019-11-27T22:47:44.750' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'assets/client/images/banner/banner-1.jpg', 1, NULL, N'XBOX one mới', CAST(N'2019-11-27T22:33:26.793' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'/Data/files/apple-macbook-air-2019-i5-16ghz-8gb-128gb-mvfm2sa-13-32-600x600.jpg', NULL, NULL, N'MacBook mới', CAST(N'2019-12-25T15:55:38.467' AS DateTime), NULL, CAST(N'2019-12-25T19:29:23.057' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'admin', N'admin', N'ADMIN', N'Quy', N'TD', N'quy@gmail.com', N'0123456789', 69, 1, CAST(N'2019-11-24T23:34:44.880' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'mem', N'mem', N'MEMBER', N'Sáng', N'Q9', N'sang@gmail.com', N'0987654321', 96, 2, CAST(N'2019-11-24T23:35:34.557' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'tester', N'tester', N'MOD', N'tester', N'tester', NULL, N'0123456789', NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'DEFAULT', N'Chưa phân nhóm')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MOD', N'Quản lí')
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Language] ADD  CONSTRAINT [DF_Language_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_PromotionPrice]  DEFAULT ((0)) FOR [PromotionPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_PromotionPrice1]  DEFAULT ((0)) FOR [OrginalPrice]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsHot]  DEFAULT ((0)) FOR [IsHot]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  StoredProcedure [dbo].[GetRevenueStatistic]    Script Date: 12/27/2019 7:42:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetRevenueStatistic]
@fromDate [nvarchar](max),
@toDate [nvarchar](max)
AS 
BEGIN
select CAST(o.CreatedDate as Date) as Date,sum(od.Price*od.Quantity) as  Revenunes,sum(od.Price*od.Quantity - od.Quantity*p.OrginalPrice) as  Benefis from "Order" o
inner join OrderDetail od
on o.ID=od.OrderID 
inner join Product p
on od.ProductID=p.ID
where o.CreatedDate>=@fromDate and o.CreatedDate<=@toDate
group by  CAST(o.CreatedDate as Date)
END
GO
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
