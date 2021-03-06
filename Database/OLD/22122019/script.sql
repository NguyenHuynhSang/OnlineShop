USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 12/22/2019 9:53:15 PM ******/
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
/****** Object:  Table [dbo].[About]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Attributes]    Script Date: 12/22/2019 9:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[ID] [bigint] NULL,
	[Name] [nvarchar](128) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttributeValue]    Script Date: 12/22/2019 9:53:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeValue](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AttributeID] [bigint] NULL,
	[Name] [nvarchar](128) NULL,
 CONSTRAINT [PK_AttributeValue] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Content]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[ContentTag]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Credential]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Footer]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Language]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[MenuType]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 12/22/2019 9:53:16 PM ******/
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
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttributes]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Slide]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[Tag]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 12/22/2019 9:53:16 PM ******/
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
/****** Object:  Table [dbo].[UserGroup]    Script Date: 12/22/2019 9:53:16 PM ******/
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

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (1, NULL, NULL, N'Sang', N'0123456', N'Quan 9', N'nguyentyic1', 1, NULL, N'Bla Bla')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (2, NULL, NULL, N'Jack', N'012', N'nga na', N'nsd', 1, NULL, N'Nuk')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (4, CAST(N'2019-12-22T19:54:17.413' AS DateTime), NULL, N'Sáng', N'069309029', N'Ngã năm sóc trăng', N'sang@gmail.com', NULL, NULL, N'Hello')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (8, CAST(N'2019-12-22T20:25:28.933' AS DateTime), NULL, N'', N'', N'', N'', NULL, NULL, N'')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (9, CAST(N'2019-12-22T20:27:11.527' AS DateTime), NULL, N'', N'', N'', N'', NULL, NULL, N'')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (10, CAST(N'2019-12-22T20:27:54.527' AS DateTime), NULL, N'', N'', N'', N'', NULL, NULL, N'')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (11, CAST(N'2019-12-22T20:28:49.337' AS DateTime), NULL, N'', N'', N'', N'', NULL, NULL, N'')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (12, CAST(N'2019-12-22T20:45:24.287' AS DateTime), NULL, N'A', N'0967096940', N'Ngã năm sóc trănga', N'', NULL, NULL, N'')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (13, CAST(N'2019-12-22T20:45:34.580' AS DateTime), NULL, N'A', N'0967096940', N'Ngã năm sóc trănga', N'', NULL, NULL, N'')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (14, CAST(N'2019-12-22T20:46:47.263' AS DateTime), NULL, N'aâ', N'0967096940', N'a', N'', NULL, NULL, N'')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (15, CAST(N'2019-12-22T20:47:32.040' AS DateTime), NULL, N'aâ', N'0967096940', N'a', N'', NULL, NULL, N'')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (16, CAST(N'2019-12-22T20:47:39.440' AS DateTime), NULL, N'aâ', N'0967096940', N'a', N'', NULL, NULL, N'')
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status], [OrderStatusID], [Note]) VALUES (17, CAST(N'2019-12-22T20:48:20.570' AS DateTime), NULL, N'aâ', N'0967096940', N'a', N'', NULL, NULL, N'')
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 1, 10, CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (2, 1, 100, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (3, 2, 10, CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (3, 4, 4, CAST(12000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (3, 8, 1, CAST(12000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (3, 9, 1, CAST(12000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (3, 10, 1, CAST(12000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (3, 11, 1, CAST(12000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (26, 3, 1, CAST(22000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (26, 4, 1, CAST(20000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (26, 5, 1, CAST(20000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (26, 6, 1, CAST(20000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (26, 7, 1, CAST(20000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (20027, 4, 1, CAST(13000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice]) VALUES (1, N'Iphone 11 Pro Max', NULL, N'iphone-11-max', NULL, N'https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-green-400x460.png', NULL, CAST(28000000 AS Decimal(18, 0)), CAST(26000000 AS Decimal(18, 0)), 1, 100, 2, NULL, NULL, CAST(N'2019-11-25T16:36:37.707' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, N'<h2 dir="ltr">Trong năm 2019 th&igrave; chiếc <a href="https://www.thegioididong.com/dtdd" target="_blank" title="Tham khảo giá điện thoại smartphone chính hãng">smartphone</a> được nhiều người mong muốn sở hữu tr&ecirc;n tay v&agrave; sử dụng nhất kh&ocirc;ng ai kh&aacute;c ch&iacute;nh l&agrave; <a href="https://www.thegioididong.com/dtdd/iphone-11-pro-max" target="_blank" title="Tham khảo điện thoại iPhone 11 Pro Max 64GB chính hãng">iPhone 11 Pro Max 64GB</a>&nbsp;tới từ nh&agrave; Apple.</h2>

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
', NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice]) VALUES (2, N'Điện thoại Samsung Galaxy S10+ (512GB)', NULL, N'sam-sung-galaxy-s10-512gb', NULL, N'https://cdn.tgdd.vn/Products/Images/42/198986/sieu-pham-galaxy-s-moi-2-512gb-black-400x460.png', NULL, CAST(18000000 AS Decimal(18, 0)), CAST(18000000 AS Decimal(18, 0)), NULL, 0, 3, NULL, NULL, CAST(N'2019-11-25T16:58:10.057' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice]) VALUES (3, N'Máy tính bảng iPad 10.2 inch Wifi Cellular 32GB (2019)
', NULL, N'ipad-10-2-inch-wifi-cellular-32gb-2019', NULL, N'https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-gold-400x460.png', NULL, CAST(13999000 AS Decimal(18, 0)), CAST(12000000 AS Decimal(18, 0)), 1, 100, 3, NULL, NULL, CAST(N'2019-12-05T10:52:37.227' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, N'<aside class="left_content">
                
    <div class="characteristics">
        <h2>Đặc điểm nổi bật của iPad 10.2 inch Wifi Cellular 32GB (2019)</h2>
        <div id="owl-detail" class="owl-carousel owl-detail owl-theme" style="opacity: 1; display: block;">
                <div class="owl-wrapper-outer autoHeight" style="height: 433px;"><div class="owl-wrapper" style="width: 20280px; left: 0px; display: block; transform: translate3d(-780px, 0px, 0px); transition: all 0ms ease 0s;"><div class="owl-item" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-thietke.jpg" style="display: block;">
                                    </div></div><div class="owl-item" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" style="display: block;" src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-ipados.jpg">
                                    </div></div><div class="owl-item loading" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" data-src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-tienich.jpg" style="display: none;">
                                    </div></div><div class="owl-item loading" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" data-src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-baomat.jpg" style="display: none;">
                                    </div></div><div class="owl-item loading" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" data-src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-cauhinh.jpg" style="display: none;">
                                    </div></div><div class="owl-item loading" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" data-src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-amthanh.jpg" style="display: none;">
                                    </div></div><div class="owl-item loading" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" data-src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-chinh-sua-video.jpg" style="display: none;">
                                    </div></div><div class="owl-item loading" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" data-src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-app-store.jpg" style="display: none;">
                                    </div></div><div class="owl-item loading" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" data-src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-app-store-2.jpg" style="display: none;">
                                    </div></div><div class="owl-item loading" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" data-src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-giong-laptop.jpg" style="display: none;">
                                    </div></div><div class="owl-item loading" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" data-src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-thaotac.jpg" style="display: none;">
                                    </div></div><div class="owl-item loading" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" data-src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-apple-pencil.jpg" style="display: none;">
                        <a class="slLnk" target="_blank" href="https://www.thegioididong.com/phu-kien-thong-minh/apple-pencil">Tìm hiểu thêm</a>
                                    </div></div><div class="owl-item loading" style="width: 780px;"><div class="item">
                    <img class="lazyOwl" data-src="https://cdn.tgdd.vn/Products/Images/522/213099/Slider/vi-vn-ipad-10-2-inch-wifi-cellular-32gb-2019-apple-pencil-2.jpg" style="display: none;">
                                    </div></div></div></div>
                
                
                
                
                
                
                
                
                
                
                
                
                    <div class="owl-controls clickable"><div class="owl-pagination"><div class="owl-page"><span class=""></span></div><div class="owl-page active"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div></div><div class="owl-buttons"><div class="owl-prev">‹</div><div class="owl-next">›</div></div></div></div>
    </div>

                
                
    <div class="boxArticle">


        <article class="area_article area_articleFull" style="">
            <h2>Nhắc tới <a href="https://www.thegioididong.com/may-tinh-bang" target="_blank" title="Tham khảo máy tính bảng chính hãng">máy tính bảng</a> thì người ta sẽ nghĩ ngay tới iPad và vào những tháng cuối năm 2019 thì Apple giới thiệu chiếc máy tính bảng "giá rẻ" mang tên&nbsp;<a href="https://www.thegioididong.com/may-tinh-bang/ipad-10-2-inch-wifi-32gb-2019" target="_blank" title="Tham khảo iPad 10.2 inch Wifi Cellular 32GB (2019) chính hãng">iPad 10.2 inch Wifi Cellular 32GB (2019)</a>,&nbsp;nhắm tới đối tượng người dùng là các bạn học sinh, sinh viên hay những người muốn một thiết bị màn hình lớn cho làm việc và giải trí.</h2><h3>Màn hình lớn, xài đã hơn</h3><p>Chắc chắn những người lựa chọn <a href="https://www.thegioididong.com/may-tinh-bang-apple-ipad" target="_blank" title="Tham khảo iPad chính hãng">iPad</a> phần lớn đều thích màn hình kích thước lớn của nó.</p><p style="text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd13.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Màn hình giải trí sắc nét" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd13.jpg" class="lazy" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Màn hình giải trí sắc nét" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd13.jpg" style="display: block;"></a></p><p>So với thế hệ tiền nhiệm thì iPad năm nay được Apple nâng cấp kích thước màn hình lên một chút là 10.2 inch so với 9.7 inch như thế hệ trước.</p><p style="text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd9.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Màn hình kích thước lớn" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd9.jpg" class="lazy" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Màn hình kích thước lớn" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd9.jpg" style="display: block;"></a></p><p>Điều này giúp bạn sẽ có nhiều không gian hơn để sử dụng cho việc học tập, làm việc và giải trí của mình.</p><p style="text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd7.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiệm giải trí" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd7.jpg" class="lazy" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiệm giải trí" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd7.jpg" style="display: block;"></a></p><p>Bên cạnh đó thì tấm nền&nbsp;<a href="https://www.thegioididong.com/hoi-dap/man-hinh-ledbacklit-ips-lcd-la-gi-905757" target="_blank" title="Tìm hiểu màn hình LED backlit LCD">LED backlit LCD</a>&nbsp;được đáng giá rất cao bởi độ sáng và màu sắc trung thực mà nó mang lại.</p><p style="text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd8-1.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Thiết kế cổng kết nối smart connector tiện lợi" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd8-1.jpg" class="lazy" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Thiết kế cổng kết nối smart connector tiện lợi" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd8-1.jpg" style="display: block;"></a></p><p>Máy vẫn giữ kiểu thiết kế truyền thống vốn đã tồn tại trên nhiều thế hệ iPad của Apple nhưng vẫn không kém phần sang trọng và tiện dụng.</p><h3>Thời lượng pin vượt trội</h3><p>Những chiếc iPad luôn mang tới cho người dùng thời gian sử dụng vượt trội so với các đối thủ của mình.</p><p style="text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd6.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Thời lượng pin vượt trội" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd6.jpg" class="lazy" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Thời lượng pin vượt trội" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd6.jpg" style="display: block;"></a></p><p>Với chiếc iPad này thì bạn hoàn toàn có thể thoải mái sử dụng trong khoảng 2-3 ngày mới phải sạc pin.</p><p style="text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd4.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Giao diện hệ điều hành iPad OS" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd4.jpg" class="lazy" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Giao diện hệ điều hành iPad OS" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd4.jpg" style="display: block;"></a></p><p>Việc onscreen liên tục được khoảng 10 tiếng là một điều hết thức bình thường với chiếc máy này và nếu bạn chỉ dùng để xem phim thì nó còn ấn tượng hơn nhiều.</p><h3>Hiệu năng mượt mà và ổn định</h3><p>Tuy không có sức mạnh ấn tượng như những chiếc iPad Pro nhưng hiệu năng mà máy mang lại vẫn đủ làm hài lòng phần lớn người dùng.</p><p style="text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd2-1.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Hiệu năng mạnh mẽ" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd2-1.jpg" class="lazy" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Hiệu năng mạnh mẽ" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd2-1.jpg" style="display: block;"></a></p><p>Cung cấp sức mạnh cho máy là con chip&nbsp;<a href="https://www.thegioididong.com/hoi-dap/tong-quan-ve-chip-a10-fusion-cua-apple-885052" target="_blank" title="Tìm hiểu chip Apple A10 Fusion">Apple A10 Fusion</a>&nbsp;kết hợp với 3 GB RAM và 32 GB bộ nhớ trong.</p><p style="text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd11-1.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiếm sử dụng mượt mà" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd11-1.jpg" class="lazy" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiếm sử dụng mượt mà" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd11-1.jpg" style="display: block;"></a></p><p>Máy hoạt động mượt mà và ổn định với hầu hết các thao tác hằng ngày của người dùng.</p><p style="text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd10.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Cổng kết nối Lightning" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd10.jpg" class="lazy" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Cổng kết nối Lightning" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd10.jpg" style="display: block;"></a></p><p>Bạn cũng có thể sử dụng chiếc máy này để chơi game và sẽ có một trải nghiệm mà không một chiếc smartphone nào có được.</p><p style="text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd12.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiệm sử dụng như một chiếc laptop" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd12.jpg" class="lazy" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Trải nghiệm sử dụng như một chiếc laptop" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd12.jpg" style="display: block;"></a></p><p>Thao tác cử chỉ vuốt đơn giản, dễ sử dụng giúp bạn tiết kiệm được nhiều thời gian.</p><p style="text-align: center;"><a class="preventdefault" href="https://www.thegioididong.com/images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd5-1.jpg" onclick="return false;"><img alt="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Cảm biến vân tay Touch ID" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd5-1.jpg" class="lazy" title="Điện thoại iPad 10.2 inch Wifi Cellular 32GB (2019) | Cảm biến vân tay Touch ID" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-tgdd5-1.jpg" style="display: block;"></a></p><p>Cảm biến vân tay cũng được duy trì giúp bạn mở khóa thiết bị một cách dễ dàng.</p>
            <div class="boxRtAtc">
                <div class="likewied">
                    <div class="likeshare">
                        <div class="fb-like fb_iframe_widget" data-href="/may-tinh-bang/ipad-10-2-inch-wifi-cellular-32gb-2019" data-layout="button_count" data-action="like" data-size="small" data-show-faces="false" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=242045172499368&amp;container_width=0&amp;href=https%3A%2F%2Fwww.thegioididong.com%2Fmay-tinh-bang%2Fipad-10-2-inch-wifi-cellular-32gb-2019&amp;layout=button_count&amp;locale=en_US&amp;sdk=joey&amp;share=true&amp;show_faces=false&amp;size=small"><span style="vertical-align: bottom; width: 122px; height: 20px;"><iframe name="f244a9fe6ae1" width="1000px" height="1000px" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://web.facebook.com/v2.4/plugins/like.php?action=like&amp;app_id=242045172499368&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter.php%3Fversion%3D44%23cb%3Df3bca109339728%26domain%3Dwww.thegioididong.com%26origin%3Dhttps%253A%252F%252Fwww.thegioididong.com%252Ff3ef315564f56a8%26relation%3Dparent.parent&amp;container_width=0&amp;href=https%3A%2F%2Fwww.thegioididong.com%2Fmay-tinh-bang%2Fipad-10-2-inch-wifi-cellular-32gb-2019&amp;layout=button_count&amp;locale=en_US&amp;sdk=joey&amp;share=true&amp;show_faces=false&amp;size=small" style="border: none; visibility: visible; width: 122px; height: 20px;" __idm_frm__="435" class="" data-gtm-yt-inspected-1070012_61="true" data-gtm-yt-inspected-1070012_79="true"></iframe></span></div>
                    </div>
                    
                    
<div class="clr"></div>
<div class="order-review">
    <form name="fOrderReview">
        <div class="left">
            <p class="first-left">Bài viết này có hữu ích cho  Bạn không ?</p>
            <p class="before-apprise">
                <b>Cảm ơn bạn đã đánh giá bài viết này <g class="nt"></g> !</b><br>
                <span>Để bài viết đạt chất lượng tốt hơn cho những lần sau! </span><br>
                <span>Mời  Bạn chia sẻ thêm thông tin về mình.</span>
            </p>
        </div>
        <div class="right">
            <a href="javascript:void(0);" onclick="chooseReview(this)" data-val="good" data-name="Hữu ích" class="good none-i"><i class="icondmx-good"></i>Hữu ích</a>
            <a href="javascript:void(0);" onclick="chooseReview(this)" data-val="bad" data-name="Không hữu ích" class="bad none-i"><i class="icondmx-bad"></i>Không Hữu ích</a>
            <a class="replay-icon"></a>
        </div>
        <div class="clr"></div>
        <div class="reason bd">
            <textarea id="Tnote" name="rs_note" placeholder="Bạn có góp ý gì thêm không? (Không bắt buộc)"></textarea>
            <p></p>
            <div class="dropdown">
                <span class="criteria">Chọn độ tuổi</span>
                <div class="age">
                    <a href="javascript:;">18-24</a>
                    <a href="javascript:;">25-34</a>
                    <a href="javascript:;">35-44</a>
                    <a href="javascript:;">45-54</a>
                    <a href="javascript:;">55-64</a>
                    <a href="javascript:;">65+</a>
                </div>
            </div>
            <div class="dropdown">
                <span class="criteria">Chọn giới tính</span>
                <div>
                    <a href="javascript:;" data-gender="1">Nam</a>
                    <a href="javascript:;" data-gender="0">Nữ</a>
                </div>
            </div>
            <a href="javascript:void(0);" class="submit" onclick="submitReview()">Gửi góp ý</a>
            <div class="clr"></div>
        </div>
        <input type="hidden" id="fname" value="Bạn">
        <input type="hidden" id="fGender" value="">
        <input type="hidden" name="rs_phone" value="">
        <input type="hidden" name="rs_gender" value="3">
        <input type="hidden" name="rs_name" value="Bạn">
        <input type="hidden" name="rs_type" value="3">
        <input type="hidden" name="rs_productId" value="213099">
        <input type="hidden" name="rs_satisfationType" value="0">
        <input type="hidden" name="rs_age" value="">
        <p class="er-content"></p>
    </form>
    <div class="thank">
        <div class="left-thank">
            <b>Cảm ơn về thông tin bạn đã chia sẻ.</b><br>
            <span>Với mục tiêu nâng cao chất lượng bài viết.</span><br>
            <span>thegioididong sẽ luôn lắng nghe mọi ý kiến của bạn</span>
        </div>
        <div class="right-thank">
            <a class="replay-icon-thank"></a>
        </div>
    </div>
</div>
<script>
    //#region Đánh giá trang search

    CallCheckAppriseBeforeLoadJquery();

    var gl_submitReview = false;
    function submitReview() {
        if (gl_submitReview) return false;
        gl_submitReview = true;
        var form = $(''.order-review form'');
        var vCt = $.trim($(''.reason [name=rs_note]'').val());
        var vGender = $.trim($(''input[name=rs_gender]'').val());
        var vName = $.trim($(''input[name=rs_name]'').val());
        var vPhone = $.trim($(''input[name=rs_phone]'').val());
        var vAge = $.trim($(''input[name=rs_age]'').val());
        var vLink = encodeURI(window.location.href);
        var vsatisfationType = $.trim($(''input[name=rs_satisfationType]'').val());
        //if (vEmail == '''') { alert(''Vui lòng chọn độ tuổi.''); gl_submitReview = false; return false; }
        //if (vGender == '''') { alert(''Vui lòng chọn giới tính.''); gl_submitReview = false; return false; }

        var data = {
            ct: vCt,
            name: vName,
            phone: vPhone,
            email: "",
            gender: vGender,
            age: vAge,
            type: 3,
            productID: productID,
            lnk: vLink,
            satisfationType: vsatisfationType
        };
        $.ajax({
            type: "POST",
            cache: false,
            data: data,
            url: "/aj/ProductV4/UpdateRatingArticle/",
            beforeSend: function () {
                BeforeSendAjax();
            },
            success: function (e) {
                gl_submitReview = false;
                if (e.mes != null && e.mes != "") {
                    $(''.order-review .er-content'').html(e.mes);
                    $(''.order-review .er-content'').show();
                }
                else {
                    $(''.order-review form'').remove();
                    $(''.order-review .er-content'').html("");
                    $(''.order-review .er-content'').hide();

                    $(''.order-review .thank'').show();
                    setlocalStorage(productID, e.res);
                }
                EndSendAjax();
            },
            error: function (err) {
                gl_submitReview = false;
                $(''#Tnote'').val('''');
                alert("Vui lòng nhập đúng dữ liệu đánh giá");
            }
        });
    }

    function chooseReview(t) {
        $(''.order-review .right a'').removeClass(''act'');
        $(t).addClass(''act'');
        $(''.order-review .right .replay-icon'').addClass($(''.order-review .right a.act'').attr(''data-val''));
        $(''.order-review .right a.replay-icon'').html($(''.order-review .right a.act'').html());
        $(''.replay-icon-thank'').html($(''.order-review .right a.act'').html());
        $(''.order-review .right a.none-i'').hide();
        $(''.order-review .left p.first-left'').hide();
        $(''.before-apprise b g.nt'').html($(''.order-review .right a.act'').attr(''data-name''));
        $(''.order-review .left p.before-apprise'').show();
        if ($(t).data(''val'') == ''good'') {
            $(''input[name=rs_satisfationType]'').val(6);
            $(''.reason textarea'').attr(''placeholder'', $(''#fGender'').val().trim() + '' '' + $(''#fname'').val().trim() + '' có góp ý gì thêm không?'');
            //$(''.reason'').removeClass(''bd'');

            // -------- rule moi : submit truoc r moi show, show ra neu update tiep thi submit tip
            var form = $(''.order-review form'');
            var vCt = $.trim($(''.reason [name=rs_note]'').val());
            var vGender = $.trim($(''input[name=rs_gender]'').val());
            var vName = $.trim($(''input[name=rs_name]'').val());
            var vPhone = $.trim($(''input[name=rs_phone]'').val());
            var vAge = $.trim($(''input[name=rs_age]'').val());
            var vLink = encodeURI(window.location.href);
            var vsatisfationType = $.trim($(''input[name=rs_satisfationType]'').val());
            //if (vEmail == '''') { alert(''Vui lòng chọn độ tuổi.''); gl_submitReview = false; return false; }
            //if (vGender == '''') { alert(''Vui lòng chọn giới tính.''); gl_submitReview = false; return false; }
            var data = {
                ct: vCt,
                name: vName,
                phone: vPhone,
                email : "",
                age: vAge,
                gender: vGender,
                type: 3,
                productID: productID,
                lnk: vLink,
                satisfationType: vsatisfationType
            };
            console.log("before__submit");
            $.ajax({
                type: "POST",
                cache: false,
                data: data,
                url: "/aj/ProductV4/SubmitRatingArticle/",
                beforeSend: function () {
                    BeforeSendAjax();
                },
                success: function (e) {
                    gl_submitReview = false;
                    //if (e.mes != null && e.mes != "") {
                    //    $(''.order-review .er-content'').html(e.mes);
                    //    $(''.order-review .er-content'').show();
                    //}
                    //else {
                    //    $(''.order-review form'').remove();
                    //    $(''.order-review .er-content'').html("");
                    //    $(''.order-review .er-content'').hide();

                    //    $(''.order-review .thank'').show();
                    //    setlocalStorage(productID, e.res);
                    //}
                    console.log("response__submit");
                    EndSendAjax();
                },
                error: function (err) {
                    gl_submitReview = false;
                    $(''#Tnote'').val('''');
                    alert("Vui lòng nhập đúng dữ liệu đánh giá");
                }
            });
            // -------- end rule moi submit

            $(''.reason'').show();
        }
        else {
            $(''input[name=rs_satisfationType]'').val(0);
            $(''.reason textarea'').attr(''placeholder'', ''Điều gì khiến '' + $(''#fGender'').val().trim() + '' '' + $(''#fname'').val().trim() + '' không hài lòng? '');
            //$(''.reason'').addClass(''bd'');
            $(''.reason'').show();
        }
    }

    function setlocalStorage(name, val) {
        if (localStorage !== undefined) {
            localStorage.setItem(name, val);
        }
    }

    function getlocalStorage(name) {
        if (localStorage !== undefined) {
            var data = localStorage.getItem(name);
            if (data !== null)
                return data;
        }
        return null;
    }

    function CheckApprise() {
        var productId = $.trim($(''input[name=rs_productId]'').val());
        var tmp = getlocalStorage(productId);
        if (tmp != null) {
            $(''.order-review'').hide();
        }
    }

    function CallCheckAppriseBeforeLoadJquery() {
        setTimeout(function () {
            if (typeof jQuery !== ''undefined'') {
                CheckApprise();
                return false;
            }
        }, 1000);
    }

//#endregion
</script>
                </div>
                

    <div class="bifRtCt bRtAtc hide">
        <textarea name="txtContent" rows="3" placeholder="Mời bạn góp ý để chúng tôi phục vụ tốt hơn"></textarea>
        <span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (Không bắt buộc):</span>
        <div class="ifRtGd" data-val="">
            <label onclick="rtAtcChangeGder(1)" class="ifGdM "><i></i>Anh</label>
            <label onclick="rtAtcChangeGder(2)" class="ifGdFm"><i></i>Chị</label>
        </div>
        <input type="text" name="txtFullName" placeholder="Họ tên" value="">
        <input type="text" name="txtPhoneNumber" placeholder="Số điện thoại" value="">
        <input type="text" name="txtEmail" placeholder="Email" value="">
        <button type="submit" onclick="sendRatingContent(-1)">Gửi góp ý<span>Cam kết bảo mật thông tin cá nhân</span></button>
        <label class="alert"></label>
        <input type="hidden" name="hdRateType" value="2">
        <input type="hidden" name="hdVideoUrl" value="">
    </div>

            </div>
        </article>
        
            <div class="bottom_order ">
                <div class="info_sp">
                    <img class="lazy" width="70" height="70" data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-gold-400x400.jpg" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-gold-400x400.jpg" style="display: inline-block;">
                    <div>
                        <h3>Máy tính bảng iPad 10.2 inch Wifi Cellular 32GB (2019)</h3>
                                <strong>13.490.000₫</strong>
                                                    <span></span>
                    </div>
                </div>
                <div class="area_order">
                            <a id="mua-ngay" href="/them-vao-gio-hang?ProductId=213099" class="buy_now" data-value="213099"><b>Mua ngay</b><span>Giao tận nơi hoặc nhận tại siêu thị</span></a>

                    <a id="tra-gop" class="buy_repay " href="/tra-gop/may-tinh-bang/ipad-10-2-inch-wifi-cellular-32gb-2019"><b>Mua trả góp 0%</b><span>Thủ tục đơn giản</span></a>
                    <a class="buy_repay s " href="/tra-gop/may-tinh-bang/ipad-10-2-inch-wifi-cellular-32gb-2019?m=credit"><b>Trả góp  qua thẻ</b><span>Visa, Master, JCB</span></a>
                </div>
            </div>
    </div>

                <div class="clr"></div>
    <div class="compare">
        <div class="tcpr">
            <h4>So sánh với các sản phẩm tương tự</h4>
            <div class="sggProd">
                <form action="javascript:void(0)">
                    <input type="text" placeholder="Nhập tên sản phẩm bạn muốn so sánh" onkeyup="SuggestCompare(this,event)">
                    <button type="submit"><i class="icontgdd-search"></i></button>
                </form>
            </div>
        </div>
        <ul>
                    <li>
                        <a href="/may-tinh-bang/ipad-10-2-inch-wifi-cellular-32gb-2019">
                            <img data-original="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-gold-400x400.jpg" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213099/ipad-10-2-inch-wifi-cellular-32gb-2019-gold-400x400.jpg" style="display: inline;">
                            <span class="bdx">
Bạn đang xem:                             </span>
                            <h3>iPad 10.2 inch Wifi Cellular 32GB (2019)</h3>
                                    <strong>13.490.000₫</strong>
                                                                                        <div class="desc"><span>Màn hình 10.2"</span><span>Camera sau 8 MP</span><span>Đàm thoại FaceTime</span></div>
                        </a>
                    </li>
                    <li>
                        <a href="/may-tinh-bang/ipad-air-105-inch-wifi-2019">
                            <img data-original="https://cdn.tgdd.vn/Products/Images/522/202705/ipad-air-105-inch-wifi-2019-gold-400x400.jpg" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/202705/ipad-air-105-inch-wifi-2019-gold-400x400.jpg" style="display: inline;">
                            <span class="bdx">
                            </span>
                            <h3>iPad Air 10.5 inch Wifi 64GB 2019</h3>
                                    <strong>13.490.000₫</strong>
                                                            <span class="rtp">
                                            <i class="iconcom-txtstar"></i>
                                            <i class="iconcom-txtstar"></i>
                                            <i class="iconcom-txtstar"></i>
                                            <i class="iconcom-txtstar"></i>
                                            <i class="iconcom-txtunstar"></i>
                                </span>
                                                            <div class="desc"><span>Màn hình 10.5"</span><span>Camera sau 8 MP</span><span>Đàm thoại FaceTime</span></div>
                        </a>
                            <a href="/may-tinh-bang/ipad-10-2-inch-wifi-cellular-32gb-2019-vs-ipad-air-105-inch-wifi-2019" class="compdetail">So sánh chi tiết</a>
                    </li>
                    <li>
                        <a href="/may-tinh-bang/ipad-mini-79-inch-wifi-cellular-64gb-2019">
                            <img data-original="https://cdn.tgdd.vn/Products/Images/522/202820/ipad-mini-79-inch-wifi-cellular-64gb-2019-gold-400x400.jpg" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/202820/ipad-mini-79-inch-wifi-cellular-64gb-2019-gold-400x400.jpg" style="display: inline;">
                            <span class="bdx">
                            </span>
                            <h3>iPad Mini 7.9 inch Wifi Cellular 64GB (2019)</h3>
                                    <strong>14.490.000₫</strong>
                                                                                        <div class="desc"><span>Màn hình 7.9"</span><span>Camera sau 8 MP</span><span>Đàm thoại FaceTime</span></div>
                        </a>
                            <a href="/may-tinh-bang/ipad-10-2-inch-wifi-cellular-32gb-2019-vs-ipad-mini-79-inch-wifi-cellular-64gb-2019" class="compdetail">So sánh chi tiết</a>
                    </li>
                    <li>
                        <a href="/may-tinh-bang/ipad-10-2-inch-wifi-cellular-128gb-2019">
                            <img data-original="https://cdn.tgdd.vn/Products/Images/522/213105/ipad-10-2-inch-wifi-cellular-128gb-2019-gray-400x400.jpg" class="lazy" src="https://cdn.tgdd.vn/Products/Images/522/213105/ipad-10-2-inch-wifi-cellular-128gb-2019-gray-400x400.jpg" style="display: inline;">
                            <span class="bdx">
                            </span>
                            <h3>iPad 10.2 inch Wifi Cellular 128GB (2019)</h3>
                                    <strong>15.490.000₫</strong>
                                                                                        <div class="desc"><span>Màn hình 10.2"</span><span>Camera sau 8 MP</span><span>Đàm thoại FaceTime</span></div>
                        </a>
                            <a href="/may-tinh-bang/ipad-10-2-inch-wifi-cellular-32gb-2019-vs-ipad-10-2-inch-wifi-cellular-128gb-2019" class="compdetail">So sánh chi tiết</a>
                    </li>
        </ul>
    </div>
                



<div class="clr"></div>
<div class="comdetail">

<div class="boxRatingCmt" id="boxRatingCmt">
    <div class="hrt" id="danhgia">
        <div class="tltRt ">
            <h3 data-s="5" data-gpa="5" data-c="1">1 đánh giá iPad 10.2 inch Wifi Cellular 32GB (2019)</h3>
            
        </div>
    </div>

    <div class="toprt">
            <div class="crt">

                    <div class="lcrt hide" data-gpa="5">
                        <b>5 <i class="iconcom-star"></i></b>
                        
                    </div>
                    <div class="rcrt">
                        <div class="r">
                            <span class="t">5 <i></i></span>
                            <div class="bgb">
                                <div class="bgb-in" style="width: 100%"></div>
                            </div>
                            <span class="c" onclick="ratingCmtList(1,5)" data-buy="1"><strong>1</strong> đánh giá</span>
                        </div>

                        <div class="r">
                            <span class="t">4 <i></i></span>
                            <div class="bgb">
                                <div class="bgb-in" style="width: 0%"></div>
                            </div>
                            <span class="c n" onclick="" data-buy="0"><strong>0</strong> đánh giá</span>
                        </div>

                        <div class="r">
                            <span class="t">3 <i></i></span>
                            <div class="bgb">
                                <div class="bgb-in" style="width: 0%"></div>
                            </div>
                            <span class="c n" onclick="" data-buy="0"><strong>0</strong> đánh giá</span>
                        </div>

                        <div class="r">
                            <span class="t">2 <i></i></span>
                            <div class="bgb">
                                <div class="bgb-in" style="width: 0%"></div>
                            </div>
                            <span class="c n" onclick="" data-buy="0"><strong>0</strong> đánh giá</span>
                        </div>

                        <div class="r">
                            <span class="t">1 <i></i></span>
                            <div class="bgb">
                                <div class="bgb-in" style="width: 0%"></div>
                            </div>
                            <span class="c n" onclick="" data-buy="0"><strong>0</strong> đánh giá</span>
                        </div>

                    </div>
                <div class="bcrt">
                    <a href="javascript:showInputRating()">Gửi đánh giá của bạn</a>
                </div>
            </div>
            <div class="clr"></div>



        <form class="input" name="fRatingComment" style="display: none">
            <input type="hidden" name="hdfStar" id="hdfStar" value="0">
            <input type="hidden" name="hdfProductID" id="hdfProductID" value="213099">
            <input type="hidden" name="hdfRatingImg" class="hdfRatingImg">
            <div class="ips">
                <span>Chọn đánh giá của bạn</span>
                <span class="lStar">
                    <i class="iconcom-unstar" id="s1"></i>
                    <i class="iconcom-unstar" id="s2"></i>
                    <i class="iconcom-unstar" id="s3"></i>
                    <i class="iconcom-unstar" id="s4"></i>
                    <i class="iconcom-unstar" id="s5"></i>
                </span>
                <span class="rsStar hide"></span>
            </div>
            <div class="clr"></div>
            <div class="ipt hide">
                <div class="ct">
                    <textarea name="fRContent" placeholder="Nhập đánh giá về sản phẩm (tối thiểu 80 ký tự)" onkeyup="countTxtRating()"></textarea>
                    <div class="extCt">
                        <label onclick="javascript:void(0);" class="lnksimg btnRatingUpload"><i class="iconcom-pict"></i>Đính kèm ảnh</label>
                        <span class="ckt"></span>
                        <input id="hdFileRatingUpload" type="file" class="hide" accept="image/x-png, image/gif, image/jpeg">
                    </div>
                </div>
                <div class="if">
                    <input type="text" name="fRName" placeholder="Họ tên">
                    <input type="text" name="fRPhone" placeholder="Số điện thoại">
                    <input type="text" name="fREmail" placeholder="Email">
                    <a href="javascript:submitRatingComment();">GỬI ĐÁNH GIÁ</a>
                </div>
                <div class="clr"></div>
                <ul class="resImg hide">
                    
                </ul>
                <span class="lbMsgRt"></span>
            </div>
        </form>
    </div>
        <div class="list">
            <ul class="ratingLst">
    <li id="r-38364798" class="par">
        <div class="rh">
            <span>Phuongnga</span>
                <label class="sttB"><i class="iconcom-checkbuy"></i>Đã mua tại Thegioididong.com</label>
                    </div>

        <div class="rc">
            <p>
                    <span>
                                <i class="iconcom-txtstar"></i>
                                <i class="iconcom-txtstar"></i>
                                <i class="iconcom-txtstar"></i>
                                <i class="iconcom-txtstar"></i>
                                <i class="iconcom-txtstar"></i>
                    </span>
                <i>Mình mới lấy máy lúc trưa mà giờ dùng loa rè quá, nếu bảo hành thì bao lâu thì lấy đc, mình mới mua đc 6 giờ đồng hồ!</i>
            </p>
        </div>

            <div class="rcf"><p>Thegioididong.com xác nhận: <label><i class="iconcom-rtusr"></i><span>Khách hàng <b class="name">Phuongnga</b></span></label><label><i class="iconcom-rtadr"></i><span>Mua online trên website Thegioididong.com</span></label></p><div class="clr"></div><label><i class="iconcom-rttime"></i><span>Mua <b>6 ngày </b> trước</span></label><p></p></div>

        <div class="ra">
                <a href="javascript:showRatingCmtChild(''r-38364798'');" class="cmtr">Thảo luận</a>
                <span>• </span>
            <a href="javascript:likeRating(38364798);" class="cmtl" data-like="0"><i class="iconcom-like"></i>Thích</a><span> • </span>
            <a href="javascript:;" class="cmtd">5 ngày trước</a>
        </div>
    </li>
                        <li class="rr-38364798 reply hide">
                            <input placeholder="Nhập thảo luận của bạn">
                            <a href="javascript:ratingRelply(38364798);" class="rrSend">GỬI</a>
                            <div class="ifrl hide">
                                <span>Khách</span> | <a href="javascript:cmtEditName()">Nhập tên</a>
                            </div>
                        </li>
            </ul>

                <div class="clr"></div>
                <div class="pgrc"></div>
        </div>
</div>




    <div class="wrap_comment" title="Bình luận sản phẩm" id="comment" cmtcategoryid="2" siteid="1" detailid="213099" cateid="15" urlpage="" pagesize="5">
<div class="tltCmt">    <textarea id="txtEditor" name="" cols="" rows="" class="parent_input txtEditor" placeholder="Mời bạn để lại bình luận..." onclick="cmtaddcommentclick();" onkeyup="cmtaddcommentclick();"></textarea>    <div class="sortcomment">        <div class="statistical hide" id="notifycmtmsg">Bình luận mới vừa được thêm vào. <a href="javascript:void(0)">Click để xem</a></div>            </div>    <div class="clr"></div>    <div class="midcmt">        <span class="totalcomment">25 bình luận                <span class="tech" onclick="showCmtTech();"><i class="iconcom-uncheck"></i>Xem bình luận kỹ thuật</span>        </span>        <div class="s_comment">            <form method="post" onsubmit="return false;">                <input class="cmtKey" type="text" placeholder="Tìm theo nội dung, người gửi..." onkeyup="cmtSearch(event);">                <i class="iconcom-search"></i>            </form>        </div>        <div class="fts_comment" data-val="0">            <span class="c_lbl">Sắp xếp theo</span>            <span class="c_ods c_ods_d" onclick="cmt_selOdSeach(0)"><i class="iconcom-radcheck"></i>&nbsp;Độ chính xác</span>            <span class="c_ods c_ods_m" onclick="cmt_selOdSeach(1)"><i class="iconcom-raduncheck"></i>&nbsp;Mới nhất</span>        </div>    </div></div><ul class="listcomment"><li class="comment_ask" id="38442178"><div class="rowuser"><a href="javascript:void(0)"><div>H</div><strong onclick="selCmt(38442178)">Heo</strong></a></div><div class="question">Cấu hình này ngang với ip7 đúng kĩ tgdd ơi</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtaddreplyclick(38442178)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38442178)">9 giờ trước </a></div><div class="listreply" id="r38442178"><div class="reply " id="38443084" data-parent="38442178"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38443084)">Kiều Khanh</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Chào anh ! Dạ xin lỗi đã để anh chờ lâu. <br>Dạ theo thông tin em kiểm tra thì iPad này và điện thoại iPhone 7 có cấu hình là&nbsp;Apple A10 Fusion có cấu hình tương đương nhau ạ.<br>Xin thông tin đến anh !</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38443084,38442178)">Trả lời</a><a href="javascript:satisfiedCmt(38443084);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38443084);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38443084)">2 giờ trước </a><div id="wrs38443084" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Kiều Khanh</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38443084)">GỬI</a></div></div></div></div></div><div class="inputreply hide"></div></li><li class="comment_ask" id="38419564"><div class="rowuser"><a href="javascript:void(0)"><div>H</div><strong onclick="selCmt(38419564)">Hậu</strong></a></div><div class="question">Có chơi pung mb được không ạ? Ở đồ họa nào ạ</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtaddreplyclick(38419564)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38419564)">1 ngày trước </a></div><div class="listreply" id="r38419564"><div class="reply " id="38419726" data-parent="38419564"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38419726)">Hoàng Tú</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Chào anh!<br>Dạ máy có thể chơi tốt PUBG Mobile ở mức đồ họa HDR anh nhé.<br> Thông tin đến anh</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38419726,38419564)">Trả lời</a><a href="javascript:satisfiedCmt(38419726);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38419726);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38419726)">1 ngày trước </a><div id="wrs38419726" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Hoàng Tú</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38419726)">GỬI</a></div></div></div></div></div><div class="inputreply hide"></div></li><li class="comment_ask" id="38409380"><div class="rowuser"><a href="javascript:void(0)"><div>t</div><strong onclick="selCmt(38409380)">Thanh Tâm</strong></a></div><div class="question">hôm qua vừa thấy giảm 2tr xong hnay lại hết giảm khi nào giảm lại 2tr vậy để mình đi mua 😂😂😂 hqua địh đi mua thì bận hnay muốn đi mua lên xem lại giá vs máy thì lại tăng giá rồi</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtaddreplyclick(38409380)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38409380)">2 ngày trước </a></div><div class="listreply" id="r38409380"><div class="reply " id="38409395" data-parent="38409380"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38409395)">Đình Thắng</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont"><div class="conticon"><div class="content_s">Chào chị. <br>Dạ hiện&nbsp;sản phẩm&nbsp;đã hết&nbsp;khuyến mãi mà mình&nbsp;quan tâm rồi nha chị, bên em chưa có&nbsp;thông tin về ngày&nbsp;khuyến mãi có lại&nbsp;ạ, hiện&nbsp;sản phẩm&nbsp;đang có các&nbsp;chương trình&nbsp;khuyến mãi&nbsp;<br>Giảm ngay 500.000đ (đã trừ vào giá) *<br>Mua kèm Office 365 Personal ưu đãi giảm 600.000đ nha chị. Chị&nbsp;quan tâm&nbsp;sản phẩm mình&nbsp;vui lòng cung cấp thông tin khu vực mình đang sinh sống cụ thể (phường/xã, quận/huyện, tỉnh/thành phố) để bên em hỗ trợ kiểm tra và thông tin các siêu thị có hàng gần nhất cho chị<br>Mong nhận phản ... <span class="seeMore" onclick="expandCmtChild(38409395);">Xem tiếp ▾ </span></div></div><div class="content hide">Chào chị. <br>Dạ hiện&nbsp;sản phẩm&nbsp;đã hết&nbsp;khuyến mãi mà mình&nbsp;quan tâm rồi nha chị, bên em chưa có&nbsp;thông tin về ngày&nbsp;khuyến mãi có lại&nbsp;ạ, hiện&nbsp;sản phẩm&nbsp;đang có các&nbsp;chương trình&nbsp;khuyến mãi&nbsp;<br>Giảm ngay 500.000đ (đã trừ vào giá) *<br>Mua kèm Office 365 Personal ưu đãi giảm 600.000đ nha chị. Chị&nbsp;quan tâm&nbsp;sản phẩm mình&nbsp;vui lòng cung cấp thông tin khu vực mình đang sinh sống cụ thể (phường/xã, quận/huyện, tỉnh/thành phố) để bên em hỗ trợ kiểm tra và thông tin các siêu thị có hàng gần nhất cho chị<br>Mong nhận phản hồi từ chị</div></div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38409395,38409380)">Trả lời</a><a href="javascript:satisfiedCmt(38409395);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38409395);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38409395)">2 ngày trước </a><div id="wrs38409395" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Đình Thắng</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38409395)">GỬI</a></div></div></div></div></div><div class="inputreply hide"></div></li><li class="comment_ask" id="38357158"><div class="rowuser"><a href="javascript:void(0)"><div>L</div><strong onclick="selCmt(38357158)">Linh</strong></a></div><div class="question">Gia đó la giá giảm 2tr uj hả ad vs lại mh co sinh nhat thang 11co giảm them ko ak</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtaddreplyclick(38357158)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38357158)">5 ngày trước </a></div><div class="listreply" id="r38357158"><div class="reply " id="38357512" data-parent="38357158"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38357512)">Hồ Ngọc Thiện</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Chào chị.<br>Dạ nếu có sinh nhật trong tháng 11 thì chị sẽ mua được sản phẩm với giá khuyến mãi là&nbsp;11.570.000₫ chị nhé. Nếu quan tâm chị vui lòng đặt mua, điền đầy đủ thông tin CMND và địa chỉ nhận hàng để bên em hỗ trợ chị ạ.<br>Thông tin đến chị.</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38357512,38357158)">Trả lời</a><a href="javascript:satisfiedCmt(38357512);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38357512);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38357512)">5 ngày trước </a><div id="wrs38357512" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Hồ Ngọc Thiện</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38357512)">GỬI</a></div></div></div></div></div><div class="inputreply hide"></div></li><li class="comment_ask" id="38350640"><div class="rowuser"><a href="javascript:void(0)"><div>N</div><strong onclick="selCmt(38350640)">Phan Hoàng Nam</strong></a></div><div class="question">iPad air 2019 kết nối được chuột nào vậy. Nhờ tgdd tư vấn loại chuột có thể mua để kết nối iPad ải 2019 nha</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtaddreplyclick(38350640)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38350640)">6 ngày trước </a></div><div class="listreply" id="r38350640"><div class="reply " id="38352439" data-parent="38350640"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38352439)">Đào Khánh</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Chào anh ! <br>Dạ không biết tầm giá anh đang nhắm đến là bao nhiêu để bên em hỗ trợ anh ạ .&nbsp;<br>Mong phản hồi từ bạn.</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38352439,38350640)">Trả lời</a><a href="javascript:satisfiedCmt(38352439);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38352439);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38352439)">6 ngày trước </a><div id="wrs38352439" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Đào Khánh</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38352439)">GỬI</a></div></div></div></div></div><div class="inputreply hide"></div></li><li class="comment_ask" id="38309968"><div class="rowuser"><a href="javascript:void(0)"><div>y</div><strong onclick="selCmt(38309968)">Đỗ Thi Hải Yến</strong></a></div><div class="question">Máy có dùng được bút k ạ</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtaddreplyclick(38309968)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38309968)">8 ngày trước </a></div><div class="listreply" id="r38309968"><div class="reply " id="38310003" data-parent="38309968"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38310003)">Thế Linh</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Chào chị!&nbsp;<br>Dạ theo em kiểm tra thì sản phẩm vẫn có thể sử dụng được với các lại bút cảm ứng thông thường đó ạ<br>Thông tin đến chị!</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38310003,38309968)">Trả lời</a><a href="javascript:satisfiedCmt(38310003);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38310003);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38310003)">8 ngày trước </a><div id="wrs38310003" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Thế Linh</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38310003)">GỬI</a></div></div></div></div><div class="reply " id="38315709" data-parent="38309968"><div class="rowuser"><a href="javascript:void(0)"><div>C</div><strong onclick="selCmt(38315709)">Nguyễn Chí Cường</strong></a></div><div class="cont">@Thế Linh: bút thông thường tức là bao gồm các loại bút nào ạ?</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38315709,38309968)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38315709)">8 ngày trước </a></div></div><div class="reply " id="38315827" data-parent="38309968"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38315827)">Dương Phi</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Dạ trường hợp này&nbsp;Máy tính bảng iPad 10.2 inch Wifi Cellular 32GB (2019) trên có thể sử dụng được một số loại bút cảm ứng cho điện thoại, máy tính bảng thường, trên thị trường chị nhé. Rât tiếc bên em không kinh doanh mẫu bút cảm ứng hỗ trợ cho máy nên không thể kiểm tra chính xác cho chị được ạ.<br>Xin thông tin đến chị.</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38315827,38309968)">Trả lời</a><a href="javascript:satisfiedCmt(38315827);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38315827);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38315827)">8 ngày trước </a><div id="wrs38315827" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Dương Phi</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38315827)">GỬI</a></div></div></div></div></div><div class="inputreply hide"></div></li><li class="comment_ask" id="38281717"><div class="rowuser"><a href="javascript:void(0)"><div>L</div><strong onclick="selCmt(38281717)">Lộc Lâm</strong></a></div><div class="question">Mình đặt mua hôm nay thì có được giảm 2tr không ad , cảm ởn ad</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtaddreplyclick(38281717)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38281717)">10 ngày trước </a></div><div class="listreply" id="r38281717"><div class="reply " id="38281730" data-parent="38281717"><div class="rowuser"><a href="javascript:void(0)"><div>L</div><strong onclick="selCmt(38281730)">Lộc Lâm</strong></a></div><div class="cont">@Lộc Lâm: với có được thêm phầm giảm 500k phiếu mua hàng và sinh nhật tháng 11 không ad</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38281730,38281717)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38281730)">10 ngày trước </a></div></div><div class="reply " id="38281775" data-parent="38281717"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38281775)">Mạnh Hùng</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Chào anh,<br>Dạ hiện thì anh có thể nhần vào nút màu đỏ để "ĐĂNG KÍ MUA TRƯỚC" với khuyến mãi&nbsp;Giảm ngay 2.000.000₫ (Giao và nhận hàng ngày 25-29/11) ạ. Và ngày mai bên em sẽ liên hệ trực tiếp với mình xác nhận đơn hàng anh nhé.&nbsp;<br>Xin thông tin đến anh !</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38281775,38281717)">Trả lời</a><a href="javascript:satisfiedCmt(38281775);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38281775);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38281775)">10 ngày trước </a><div id="wrs38281775" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Mạnh Hùng</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38281775)">GỬI</a></div></div></div></div><div class="fullcomment" onclick="showFullCmt(38281717)"><i class="iconcom-comblue"></i> Xem tiếp 3 trả lời khác ▾</div><div class="reply hide" id="38281798" data-parent="38281717"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38281798)">Mạnh Hùng</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Dạ dự kiến khuyến mãi "Giảm ngay 2.000.000₫ (Giao và nhận hàng ngày 25-29/11)" sẽ không hỗ trợ áp dụng thêm các khuyến mãi khác ạ, và anh có thể quay lại website vào ngay mai để cập nhật thông tin chính xác nhất về khuyến mãi này anh nhé.&nbsp;<br>Xin thông tin đến anh !</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38281798,38281717)">Trả lời</a><a href="javascript:satisfiedCmt(38281798);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38281798);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38281798)">10 ngày trước </a><div id="wrs38281798" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Mạnh Hùng</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38281798)">GỬI</a></div></div></div></div><div class="reply hide" id="38282016" data-parent="38281717"><div class="rowuser"><a href="javascript:void(0)"><div>L</div><strong onclick="selCmt(38282016)">Lộc Lâm</strong></a></div><div class="cont">@Mạnh Hùng: ok cảm ơn ad</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38282016,38281717)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38282016)">10 ngày trước </a></div></div><div class="reply hide" id="38282233" data-parent="38281717"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38282233)">Mạnh Hùng</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Dạ vâng ạ, nếu có thêm thông tin nào cần giải đáp anh có thể để lại phía bên dưới để bên em hỗ trợ mình kịp thời, anh nhé.<br>Xin chia sẻ cùng anh !</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38282233,38281717)">Trả lời</a><a href="javascript:satisfiedCmt(38282233);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38282233);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38282233)">10 ngày trước </a><div id="wrs38282233" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Mạnh Hùng</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38282233)">GỬI</a></div></div></div></div></div><div class="inputreply hide"></div></li><li class="comment_ask" id="38281583"><div class="rowuser"><a href="javascript:void(0)"><div>L</div><strong onclick="selCmt(38281583)">Lộc Lâm</strong></a></div><div class="question">Cho mình hỏi giảm 2tr thì có được hưởng thêm ưu đãi như giãm 500k phiêu mua hàng và sinh nhật trong tháng 11 khôhg ạ, mình ở quận ninh kiều cần thơ, cảm ơn ad.</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtaddreplyclick(38281583)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38281583)">10 ngày trước </a></div><div class="listreply" id="r38281583"><div class="reply " id="38281733" data-parent="38281583"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38281733)">Mạnh Hùng</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Chào anh,<br>Dạ dự kiến khuyến mãi "Giảm ngay 2.000.000₫ (Giao và nhận hàng ngày 25-29/11)" sẽ không hỗ trợ áp dụng thêm các khuyến mãi khác ạ. Và anh có thể quay lại website vào ngày mai giúp em để có thông tin chính xác nhất về khuyến mãi này anh nhé.&nbsp;<br>Xin thông tin đến anh !</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38281733,38281583)">Trả lời</a><a href="javascript:satisfiedCmt(38281733);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38281733);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38281733)">10 ngày trước </a><div id="wrs38281733" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Mạnh Hùng</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38281733)">GỬI</a></div></div></div></div><div class="reply " id="38281757" data-parent="38281583"><div class="rowuser"><a href="javascript:void(0)"><div>L</div><strong onclick="selCmt(38281757)">Lộc Lâm</strong></a></div><div class="cont">@Mạnh Hùng: ok cảm ơn ad</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38281757,38281583)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38281757)">10 ngày trước </a></div></div><div class="reply " id="38281802" data-parent="38281583"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38281802)">Mạnh Hùng</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Dạ nếu có thêm thông tin nào cần giải đáp anh có thể để lại phía bên dưới để bên em hỗ trợ mình kịp thời, anh nhé.<br>Xin chia sẻ cùng anh !</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38281802,38281583)">Trả lời</a><a href="javascript:satisfiedCmt(38281802);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38281802);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38281802)">10 ngày trước </a><div id="wrs38281802" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Mạnh Hùng</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38281802)">GỬI</a></div></div></div></div></div><div class="inputreply hide"></div></li><li class="comment_ask" id="38264168"><div class="rowuser"><a href="javascript:void(0)"><div>H</div><strong onclick="selCmt(38264168)">Hiếu</strong></a></div><div class="question">Em mới xem giá của chiếc này lúc sáng 23/11 ipad 10.2 Wi-Fi  2019 là 9.990.000 giờ là chiều 23/11 là 13.990.000 cho giảm 2.000.000, tặng phiếu mua hàng luôn cũng không giống giá ban đầu. Rõ ràng là đã được nâng lên. Xin báo giá chính xác</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtaddreplyclick(38264168)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38264168)">11 ngày trước </a></div><div class="listreply" id="r38264168"><div class="reply " id="38264232" data-parent="38264168"><div class="rowuser"><a href="javascript:void(0)"><div>H</div><strong onclick="selCmt(38264232)">Hiếu</strong></a></div><div class="cont">@Hiếu: chênh lệch tới 4 tr. Mong được giải đáp thắc mắc<div class="imgCmt"><img class="lazy" data-original="https://cdn.tgdd.vn/comment/38264232/Screenshot_2019-11-23-13-28-46-768BF9D.png" onclick="openCmtSlide(38264232,0)" src="https://cdn.tgdd.vn/comment/38264232/Screenshot_2019-11-23-13-28-46-768BF9D.png" style="display: block;"></div></div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38264232,38264168)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38264232)">11 ngày trước </a></div></div><div class="reply " id="38264297" data-parent="38264168"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38264297)">Thanh Thiên</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Chào anh<br>Dạ với giá 9.990.000₫ là giá của sản phẩm <a target="_blank" href="https://www.thegioididong.com/may-tinh-bang/ipad-10-2-inch-wifi-32gb-2019">Máy tính bảng iPad 10.2 inch Wifi 32GB (2019)</a> còn đây là sản phẩm Máy tính bảng iPad 10.2 inch Wifi Cellular 32GB (2019) có giá 13.990.000₫ anh nhé. Vì đây là 2 bản khác nhau nên có giá khác nhau anh nha.<br>Xin gửi thông tin đến anh ạ.</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38264297,38264168)">Trả lời</a><a href="javascript:satisfiedCmt(38264297);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38264297);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38264297)">11 ngày trước </a><div id="wrs38264297" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Thanh Thiên</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38264297)">GỬI</a></div></div></div></div><div class="fullcomment" onclick="showFullCmt(38264168)"><i class="iconcom-comblue"></i> Xem tiếp 3 trả lời khác ▾</div><div class="reply hide" id="38264301" data-parent="38264168"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38264301)">Thanh Thiên</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Dạ bên em đã thông tin cho mình ở trên rồi đó ạ. Mình vui lòng tải lại trang để cập nhật phản hồi mới nhất nhé.<br>Xin gửi thông tin đến anh ạ.</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38264301,38264168)">Trả lời</a><a href="javascript:satisfiedCmt(38264301);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38264301);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38264301)">11 ngày trước </a><div id="wrs38264301" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Thanh Thiên</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38264301)">GỬI</a></div></div></div></div><div class="reply hide" id="38264547" data-parent="38264168"><div class="rowuser"><a href="javascript:void(0)"><div>H</div><strong onclick="selCmt(38264547)">Hiếu</strong></a></div><div class="cont">@Thanh Thiên: dạ. E xin lỗi, giờ mới thấy phản hồi, hihi. 2 chiếc ipad này có j khác nhau mà giá của cellular lại cao hơn vậy ad</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38264547,38264168)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38264547)">11 ngày trước </a></div></div><div class="reply hide" id="38264585" data-parent="38264168"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38264585)">Minh Hoàng</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Dạ 1 phiên bản có hỗ trợ 3G, 4G còn 1 phiên bản không hỗ trợ anh nha, ngoài ra&nbsp;iPad 10.2 inch Wifi Cellular 32GB (2019) có kết nối khác là Miracast còn&nbsp;iPad 10.2 inch Wifi 32GB (2019) không có ạ,...<br>Thông tin đến anh.</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38264585,38264168)">Trả lời</a><a href="javascript:satisfiedCmt(38264585);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38264585);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38264585)">11 ngày trước </a><div id="wrs38264585" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Minh Hoàng</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38264585)">GỬI</a></div></div></div></div></div><div class="inputreply hide"></div></li><li class="comment_ask" id="38208308"><div class="rowuser"><a href="javascript:void(0)"><div>N</div><strong onclick="selCmt(38208308)">Nghia</strong></a></div><div class="question">Ad cho hỏi ipad này khi mua xách tay về là có tieng việt k ạ</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtaddreplyclick(38208308)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38208308)">15 ngày trước </a></div><div class="listreply" id="r38208308"><div class="reply " id="38208429" data-parent="38208308"><div class="rowuser"><a href="javascript:void(0)"><div class="c"><i class="iconcom-avactv"></i></div><strong onclick="selCmt(38208429)">Nghĩa Tùng</strong><b class="qtv">Quản trị viên</b></a></div><div class="cont">Chào anh,&nbsp;<br>Dạ bên em không kinh doanh hàng xách tay nên không có thông tin để hỗ trợ anh trong vấn đề này được ạ. Mong anh thông cảm.&nbsp;<br>Thông tin đến anh.</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38208429,38208308)">Trả lời</a><a href="javascript:satisfiedCmt(38208429);" class="favor satis cmthl"><i class="iconcom-like"></i>Hài lòng<span></span></a><a href="javascript:unsatisfiedCmt(38208429);" class="favor satis cmtkhl"><i class="iconcom-unlike"></i>Không hài lòng<span></span></a><a href="javascript:void(0)" class="time" onclick="cmtReport(38208429)">15 ngày trước </a><div id="wrs38208429" class="wrapsatis" style="display: none;"><div class="wrsct"><i class="iconcom-close" onclick="closeSatis();"></i><span>Thegioididong.com rất tiếc đã làm bạn chưa hài lòng. Mời bạn góp ý để <b>QTV Nghĩa Tùng</b> phục vụ tốt hơn:</span><textarea placeholder="Nhập nội dung góp ý" type="text" class="ustCt"></textarea><span>Hãy để lại thông tin để được hỗ trợ khi cần thiết (không bắt buộc):</span><input placeholder="Họ tên" type="text" class="ustName"><input placeholder="Số điện thoại" type="text" class="ustPhone"><a href="javascript:sendUnSatisfied(38208429)">GỬI</a></div></div></div></div><div class="reply " id="38221450" data-parent="38208308"><div class="rowuser"><a href="javascript:void(0)"><div>T</div><strong onclick="selCmt(38221450)">Tú</strong></a></div><div class="cont">@Nghia: Có. Bây giờ máy xách tay nào cũng có Tiếng Việt và nhiều ngôn ngữ khác.</div><div class="actionuser" data-cl="0"><a href="javascript:void(0)" class="respondent" onclick="cmtChildAddReplyClick(38221450,38208308)">Trả lời</a><a href="javascript:void(0)" class="time" onclick="cmtReport(38221450)">14 ngày trước </a></div></div></div><div class="inputreply hide"></div></li><div class="pagcomment"><span class="active">1</span><a onclick="listcomment(2,1,2);return false;" title="trang 2">2</a><a onclick="listcomment(2,1,3);return false;" title="trang 3">3</a><a onclick="listcomment(2,1,2);return false;" title="trang 2">»</a></div></ul><textarea id="txtEditorExt" name="" cols="" rows="" class="txtEditor" placeholder="Mời Bạn để lại bình luận..."></textarea><div class="ajaxcomment hide"><div id="loadcomment"></div></div>
    </div>
</div>




            </aside>', NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice]) VALUES (26, N'Điện thoại Samsung Galaxy Note 10 Đỏ', N'CODE01', N'Dien-thoai-Samsung-Galaxy-Note-10-Do', N'abc', N'/Data/images/DienThoai/SamSung/GalaxyS10Do/samsung-galaxy-note-10-do-docquyen-400x460.png', N'/Data/images/DienThoai/SamSung/GalaxyS10Do/samsung-galaxy-note-10-do-13-180x125.jpg
/Data/images/DienThoai/SamSung/GalaxyS10Do/samsung-galaxy-note-10-do-15-180x125.jpg
/Data/images/DienThoai/SamSung/GalaxyS10Do/samsung-galaxy-note-10-do-5-180x125.jpg', CAST(22000000 AS Decimal(18, 0)), CAST(20000000 AS Decimal(18, 0)), NULL, 29, 3, NULL, NULL, CAST(N'2019-12-07T10:32:22.877' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice]) VALUES (10026, N'Laptop HP 348 G5 i3 7020U/4GB/256GB/Win10', N'LP-01', N'Laptop-HP-348-G5-i3-7020U-4GB-256GB-Win104', N'Laptop HP 348 G5 i3 có độ dày và trọng lượng lần lượt là 19.89 mm và 1.42 kg giúp người dùng dễ dàng mang theo khi đi học hay đi làm. ', N'/Data/files/hp-348-g5-i3-7020u-4gb-256gb-win10-7xj62pa-210172-600x600.jpg', NULL, CAST(9900000 AS Decimal(18, 0)), CAST(9000000 AS Decimal(18, 0)), NULL, 1, 14, NULL, NULL, CAST(N'2019-12-19T15:58:05.407' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice]) VALUES (20026, N'Laptop Apple Macbook Air 2019 i5 1.6GHz', N'MVFM2SA/A', N'Laptop-Apple-Macbook-Air-2019-i5-1-6GHz5', N'MacBook Air 2019 128 GB i5 đã ra mắt giữ nguyên các ưu điểm vốn có của dòng MacBook Air: Mỏng nhẹ, cấu hình khỏe và pin trâu', N'/Data/files/apple-macbook-air-2019-i5-16ghz-8gb-128gb-mvfm2sa-13-32-600x600.jpg', NULL, CAST(27999000 AS Decimal(18, 0)), CAST(20999000 AS Decimal(18, 0)), NULL, 100, 14, NULL, NULL, CAST(N'2019-12-22T16:06:45.677' AS DateTime), NULL, CAST(N'2019-12-22T16:11:15.770' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludedVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount], [Content], [OrginalPrice]) VALUES (20027, N'Laptop Asus VivoBook A412FA i3 8145U-4GB', N'EK661T', N'Laptop-Asus-VivoBook-A412FA-i3-8145U-4GB6', N'Hiện đại và tiện dụng là những gì mà laptop ASUS VivoBook A412F i3 (EK661T) đem lại. Với thiết kế mỏng nhẹ cùng ổ cứng SSD tích hợp Intel Optane siêu nhanh đem đến những trải nghiệm tuyệt vời cho người dùng, đặc biệt phù hợp với giới trẻ. ', N'/Data/files/asus-vivobook-a412f-i3-8145u-4gb-32gb-512gb-win10-600x600.jpg', NULL, CAST(13000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, 100, 14, NULL, NULL, CAST(N'2019-12-22T16:13:59.993' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (1, N'Điện thoại', N'dien-thoai', NULL, 0, NULL, CAST(N'2019-11-25T11:08:08.257' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
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

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'assets/client/images/banner/banner-1.jpg', 1, NULL, N'XBOX one mới', CAST(N'2019-11-27T22:33:26.793' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'assets/client/images/banner/banner-2.jpg', 2, NULL, N'IPhone 11', CAST(N'2019-11-27T22:44:12.340' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'assets/client/images/banner/banner-3.jpg', 3, NULL, N'Mac Book', CAST(N'2019-11-27T22:47:44.750' AS DateTime), NULL, NULL, NULL, 1)
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
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
