USE [daycare_v1]
GO
/****** Object:  User [daycare_webuser]    Script Date: 09/18/2012 01:03:13 ******/
CREATE USER [daycare_webuser] FOR LOGIN [daycare_webuser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [daycare_web_fullaccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE ROLE [daycare_web_fullaccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 09/18/2012 01:03:13 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProviderAmenities]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderAmenities](
	[ProviderAmenityID] [int] IDENTITY(1000000,10) NOT NULL,
	[ProviderID] [int] NOT NULL,
	[AmenityTypeID] [int] NOT NULL,
	[DateCreated] [int] NOT NULL,
 CONSTRAINT [PK_ProviderAmenities] PRIMARY KEY CLUSTERED 
(
	[ProviderAmenityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLog]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLog](
	[userLogID] [int] IDENTITY(1000000,10) NOT NULL,
	[date] [smalldatetime] NOT NULL,
	[aspnetUserID] [uniqueidentifier] NULL,
	[userID] [int] NOT NULL,
	[action] [nvarchar](2048) NOT NULL,
	[ip] [varchar](15) NOT NULL,
	[userAgent] [varchar](255) NOT NULL,
	[surferID] [varchar](50) NOT NULL,
	[dateModified] [smalldatetime] NULL,
 CONSTRAINT [PK_UserLog] PRIMARY KEY CLUSTERED 
(
	[userLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserID] [int] NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Address1] [nvarchar](256) NOT NULL,
	[Address2] [nvarchar](256) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[States]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[States](
	[cultureID] [varchar](5) NOT NULL,
	[code] [char](2) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[sortrank] [smallint] NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[cultureID] ASC,
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(10000000,10) NOT NULL,
	[ExternalType] [varchar](100) NOT NULL,
	[ExternalID] [int] NOT NULL,
	[PaymentMethodID] [int] NOT NULL,
	[SubscriptionID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[PaymentType] [tinyint] NOT NULL,
	[TransactionType] [char](1) NOT NULL,
	[Amount] [money] NOT NULL,
	[TransactionID] [varchar](50) NOT NULL,
	[OriginalTransactionID] [varchar](50) NOT NULL,
	[ResultFinal] [varchar](50) NOT NULL,
	[ResultCode] [int] NOT NULL,
	[ResponseMessage] [varchar](255) NOT NULL,
	[AuthorizationCode] [varchar](10) NOT NULL,
	[CscMatch] [varchar](10) NOT NULL,
	[AvsMatch] [varchar](10) NOT NULL,
	[InternationalAvs] [char](1) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[Ip] [varchar](15) NOT NULL,
	[IpCountry] [char](2) NOT NULL,
	[CcExpDate] [smalldatetime] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Company] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Address1] [nvarchar](100) NOT NULL,
	[Address2] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[State] [char](2) NOT NULL,
	[Province] [nvarchar](100) NOT NULL,
	[Zip] [varchar](10) NOT NULL,
	[CountryID] [smallint] NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[MobilePhone] [varchar](50) NOT NULL,
	[PayflowRequestID] [varchar](50) NOT NULL,
	[VoidTransactionID] [varchar](50) NOT NULL,
	[CaptureTransactionID] [varchar](50) NOT NULL,
	[CaptureTransactionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SqlErrorLog]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SqlErrorLog](
	[sqlErrorLogID_db] [int] IDENTITY(100000,1) NOT NULL,
	[date_db] [datetime] NOT NULL,
	[currentUser_db] [nvarchar](128) NOT NULL,
	[errorNumber_db] [int] NOT NULL,
	[errorSeverity_db] [int] NOT NULL,
	[errorState_db] [int] NOT NULL,
	[errorProcedure_db] [nvarchar](200) NOT NULL,
	[errorLine_db] [int] NOT NULL,
	[errorMessage_db] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_SqlErrorLog] PRIMARY KEY CLUSTERED 
(
	[sqlErrorLogID_db] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProviderTypes]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderTypes](
	[ProviderTypeID] [int] NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ProviderTypes] PRIMARY KEY CLUSTERED 
(
	[ProviderTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Providers](
	[ProviderID] [int] IDENTITY(1000000,10) NOT NULL,
	[AspnetUserID] [int] NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[LicenseNumber] [nvarchar](256) NOT NULL,
	[AccessType] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderPictures]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProviderPictures](
	[PictureID] [int] IDENTITY(1000000,10) NOT NULL,
	[ProviderID] [int] NOT NULL,
	[PictureTypeID] [int] NOT NULL,
	[FileLocation] [nvarchar](512) NOT NULL,
	[FileName] [nvarchar](512) NOT NULL,
	[FileExtension] [nvarchar](50) NOT NULL,
	[FileSize] [int] NOT NULL,
	[FileContentType] [varchar](50) NOT NULL,
	[Bio] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ProviderPictures] PRIMARY KEY CLUSTERED 
(
	[PictureID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProviderHoursOfOperation]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderHoursOfOperation](
	[ProviderID] [int] NOT NULL,
	[DayOfWeekID] [int] NOT NULL,
	[StartTime] [nvarchar](50) NOT NULL,
	[EndTime] [nvarchar](50) NOT NULL,
	[IsClosed] [bit] NOT NULL,
	[IsOpenEntireDay] [bit] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ProviderHoursOfOperation] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC,
	[DayOfWeekID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProviderDetails]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderDetails](
	[ProviderID] [int] NOT NULL,
	[ProviderTypeID] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Address1] [nvarchar](256) NOT NULL,
	[Address2] [nvarchar](256) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Education] [nvarchar](512) NOT NULL,
	[YearsOfExperience] [decimal](5, 1) NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_ProviderDetails] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DayCareRepository]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayCareRepository](
	[LicenseNo] [int] NOT NULL,
	[Name] [nvarchar](512) NOT NULL,
	[Address] [nvarchar](512) NOT NULL,
	[Latitude] [decimal](10, 6) NOT NULL,
	[Longitude] [decimal](10, 6) NOT NULL,
	[DayCareType] [nvarchar](256) NOT NULL,
	[Age] [nvarchar](512) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DayCareRepository] PRIMARY KEY CLUSTERED 
(
	[LicenseNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethodID] [int] IDENTITY(10000000,10) NOT NULL,
	[ExternalType] [varchar](100) NOT NULL,
	[ExternalID] [int] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[IsBackup] [bit] NOT NULL,
	[CcType] [tinyint] NOT NULL,
	[CcNumHash] [varchar](100) NOT NULL,
	[CcLast4] [char](4) NOT NULL,
	[CcExpDate] [smalldatetime] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Company] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Address1] [nvarchar](100) NOT NULL,
	[Address2] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[State] [char](2) NOT NULL,
	[Province] [nvarchar](100) NOT NULL,
	[Zip] [varchar](10) NOT NULL,
	[CountryID] [smallint] NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[MobilePhone] [varchar](50) NOT NULL,
	[CscMatch] [varchar](10) NOT NULL,
	[AvsMatch] [varchar](10) NOT NULL,
	[InternationalAvs] [char](1) NOT NULL,
	[DateValidated] [smalldatetime] NOT NULL,
	[DateSignatureReceived] [smalldatetime] NOT NULL,
	[DateAdded] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[LastApprovedTransactionID] [varchar](50) NOT NULL,
	[LastApprovedTransactionDate] [smalldatetime] NOT NULL,
	[IssuingBankInfo] [varchar](255) NOT NULL,
	[Ip] [varchar](15) NOT NULL,
	[IpCountry] [char](2) NOT NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[DurationTypes]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DurationTypes](
	[DurationTypeID] [int] NOT NULL,
	[DurationType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DurationTypes] PRIMARY KEY CLUSTERED 
(
	[DurationTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AmenityTypes]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmenityTypes](
	[AmenityTypeID] [int] IDENTITY(1000,10) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_AmenityTypes] PRIMARY KEY CLUSTERED 
(
	[AmenityTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1000000,10) NOT NULL,
	[AspnetUserID] [uniqueidentifier] NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[AccessType] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserSubscriptions]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSubscriptions](
	[SubscriptionID] [int] IDENTITY(1000000,10) NOT NULL,
	[UserID] [int] NOT NULL,
	[SubscriptionTypeID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DateStart] [smalldatetime] NOT NULL,
	[DateEnd] [smalldatetime] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateCancelled] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_UserSubscriptions] PRIMARY KEY CLUSTERED 
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSubscriptionStatus]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSubscriptionStatus](
	[UserID] [int] NOT NULL,
	[DateEnd] [smalldatetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_UserSubscriptionStatus] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSubscriptionTypes]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserSubscriptionTypes](
	[SubscriptionTypeID] [int] IDENTITY(1000,10) NOT NULL,
	[Amount] [money] NOT NULL,
	[DurationTypeID] [int] NOT NULL,
	[DurationTime] [decimal](10, 2) NOT NULL,
	[TotalCycles] [int] NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Status] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_UserSubscriptionTypes] PRIMARY KEY CLUSTERED 
(
	[SubscriptionTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Util_RethrowSqlError]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Util_RethrowSqlError]
AS
BEGIN
	SET NOCOUNT ON
	
	IF ERROR_NUMBER() IS NULL
		RETURN

	DECLARE 
        @ErrorMessage    NVARCHAR(4000),
        @ErrorNumber     INT,
        @ErrorSeverity   INT,
        @ErrorState      INT,
        @ErrorLine       INT,
        @ErrorProcedure  NVARCHAR(200)
    
    -- Assign variables to error-handling functions that 
    -- capture information for RAISERROR.
    SELECT 
        @ErrorNumber = ERROR_NUMBER(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE(),
        @ErrorLine = ERROR_LINE(),
        @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-');
    
    -- Build the message string that will contain original
    -- error information.
    SELECT @ErrorMessage = N'Error %d, Level %d, State %d, Procedure %s, Line %d, Message: '+ ERROR_MESSAGE();
            
    -- Raise an error: msg_str parameter of RAISERROR will contain
    -- the original error information.
    RAISERROR 
        (
        @ErrorMessage, 
        @ErrorSeverity, 
        1,               
        @ErrorNumber,    -- parameter: original error number.
        @ErrorSeverity,  -- parameter: original error severity.
        @ErrorState,     -- parameter: original error state.
        @ErrorProcedure, -- parameter: original error procedure name.
        @ErrorLine       -- parameter: original error line number.
        );
END
GO
/****** Object:  StoredProcedure [dbo].[UserSubscriptionTypes_Get]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSubscriptionTypes_Get]
AS

SELECT
	*
FROM UserSubscriptionTypes s WITH (NOLOCK)
WHERE s.Status = 1
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 09/18/2012 01:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  StoredProcedure [dbo].[UserSubscriptionStatus_Get]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSubscriptionStatus_Get]
(
	@UserID				int
)
AS
	
SELECT
	*
FROM UserSubscriptionStatus s WITH (NOLOCK)
WHERE UserID = @UserID and Status = 1
GO
/****** Object:  StoredProcedure [dbo].[UserSubscriptions_Get]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSubscriptions_Get]
(
	@Status			int = 0,
	@DateStart		smalldatetime = '1/1/1900',
	@DateEnd		smalldatetime = '1/1/1900',
	@UserID			int = 0	
)
AS
	
SELECT
	*
FROM UserSubscriptions s WITH (NOLOCK)
WHERE
(@UserID = 0 or s.UserID = @UserID) and
(@Status = 0 or s.Status = @Status) and
(@DateStart = '1/1/1900' or s.DateStart <= @DateStart) and
(@DateEnd = '1/1/1900'  or s.DateEnd >= @DateEnd) and
((@Status <> 1 and @DateEnd <> '1/1/1900') or @DateEnd >= GETUTCDATE())
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[DayCareRepository_GetAll]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DayCareRepository_GetAll]
AS	
BEGIN

SELECT
	*
FROM DayCareRepository dr WITH (NOLOCK) 
ORDER BY LicenseNo

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  StoredProcedure [dbo].[PaymentMethods_Get]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PaymentMethods_Get]
	@ExternalType						varchar(100),
	@ExternalID							int,
	@Type								tinyint,
	@UserPaymentMethodID				int = null,
	@IsPrimary							bit = null,
	@IncludeInactive					bit = 0		-- by default, only active credit cards are included
AS
SELECT
	PaymentMethodID = PaymentMethodID, 
	ExternalType = ExternalType,
	ExternalID = ExternalID,
	[Type] = Type,
	[Status] = Status,
	IsPrimary = IsPrimary,
	IsBackup = IsBackup,
	CcType = CcType,
	CcNumHash = CcNumHash,
	CcLast4 = CcLast4,
	CcExpDate = CcExpDate,
	FirstName = FirstName,
	LastName = LastName,
	Company = Company,
	Email = Email,
	Address1 = Address1,
	Address2 = Address2,
	City = City,
	[State] = State,
	Province = Province,
	Zip = Zip,
	CountryID = CountryID,	
	Country = 'US',
	Phone = Phone,
	MobilePhone = MobilePhone,
	CscMatch = CscMatch,
	AvsMatch = AvsMatch,
	InternationalAvs = InternationalAvs,
	DateValidated = DateValidated,
	DateSignatureReceived = DateSignatureReceived,
	DateAdded = DateAdded,
	DateModified = DateModified,
	LastApprovedTransactionID = LastApprovedTransactionID,
	LastApprovedTransactionDate = LastApprovedTransactionDate,
	IssuingBankInfo = IssuingBankInfo,
	IP = ip,
	IpCountry = ipCountry
FROM PaymentMethods pm WITH (NOLOCK)
WHERE
	ExternalType = @ExternalType AND ExternalID = @ExternalID AND Type = @Type
	AND  PaymentMethodID = IsNull(@UserPaymentMethodID, PaymentMethodID)
	AND IsPrimary = IsNull(@IsPrimary, IsPrimary)
	AND (@IncludeInactive = 1 OR (pm.Status = 0 AND pm.LastApprovedTransactionID <> '' AND pm.LastApprovedTransactionDate >= dateadd(month,-11,getdate())))
ORDER BY IsPrimary DESC, IsBackup DESC, DateAdded DESC
GO
/****** Object:  Table [dbo].[ProviderAmenityTypes]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderAmenityTypes](
	[ProviderTypeID] [int] NOT NULL,
	[AmenityTypeID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SqlErrorLog_Add]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlErrorLog_Add]
(
	@sqlErrorLogID	INT = 0 OUTPUT 
)
AS
BEGIN
	SET NOCOUNT ON
	
	SET @sqlErrorLogID = 0
	
	BEGIN TRY
		-- Return if there is no error information to log
		IF ERROR_NUMBER() IS NULL
			RETURN
			
		-- Return if inside an uncommittable transaction.
		-- Data insertion/modification is not allowed when
		-- a transaction is in an uncommittable state
		IF XACT_STATE() = -1
		BEGIN
			PRINT 'Cannot log error since the current transaction is in an uncommittable state. Rollback the transaction before executing SqlErrorLog_Add in order to successfully log error information.'
			RETURN			
		END
		
		INSERT INTO SqlErrorLog (currentUser_db, errorNumber_db, errorSeverity_db, errorState_db, errorProcedure_db, errorLine_db, errorMessage_db)
		VALUES (CONVERT(sysname, CURRENT_USER), ERROR_NUMBER(), ERROR_SEVERITY(), ERROR_STATE(), LEFT(IsNull(ERROR_PROCEDURE(),''),200), ERROR_LINE(), LEFT(ERROR_MESSAGE(),4000))
		
		SELECT @sqlErrorLogID = SCOPE_IDENTITY()
	END TRY
	BEGIN CATCH
		PRINT 'An error occurred in stored procedure SqlErrorLog_Add: '
		
		-- Print error information. 
		PRINT	'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
				', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
				', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
				', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
				', Line ' + CONVERT(varchar(5), ERROR_LINE());
		
		PRINT ERROR_MESSAGE();
    
		RETURN -1	
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[States_Get]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[States_Get]
(
	@cultureID	varchar(10)
)
AS

SELECT
	Code = code,
	[State] = s.state
FROM States s WITH (NOLOCK)
WHERE s.cultureID = @cultureID AND s.sortrank <> 0
ORDER BY s.sortrank ASC, s.state ASC
GO
/****** Object:  StoredProcedure [dbo].[Payments_GetVelocityLimitCode]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Payments_GetVelocityLimitCode]
	@ExternalType		varchar(100),
	@ExternalID			int,
	@CcNumHash			varchar(100),
	@Ip					varchar(15),
	@UserAgent			varchar(255),
	@SurferID			varchar(50),
	@LimitCode			int output	-- 999 = could not execude
AS

BEGIN

DECLARE @count	INT

IF @ExternalID IN (10000050)
BEGIN
	SET @LimitCode = 0
	RETURN
END

-- Max 4 trans per externalID within 60 minutes
SELECT @count = count(*) FROM Payments WITH (NOLOCK) WHERE ExternalType = @ExternalType AND ExternalID = @ExternalID and date > DATEADD(MINUTE,-60,GETUTCDATE())
IF @count > 4
BEGIN
	SET @LimitCode = 1001
	RETURN
END

-- Max 5 trans per credit card within 60 minutes
SELECT @count = count(*) FROM Payments WITH (NOLOCK) WHERE [Date] > DATEADD(MINUTE,-60,GETUTCDATE())
AND PaymentMethodID IN (SELECT PaymentMethodID FROM PaymentMethods WITH (NOLOCK) WHERE CcNumHash = @CcNumHash)
IF @count > 5
BEGIN
	SET @LimitCode = 1002
	RETURN
END

-- Max 10 trans per IP within 60 minutes
SELECT @count = count(*) from Payments WITH (NOLOCK) WHERE Date > DATEADD(MINUTE,-60,GETUTCDATE())
AND Ip = @Ip AND Ip NOT LIKE '172.16.%'
IF @count > 10
BEGIN
	SET @LimitCode = 1003
	RETURN
END

-- Max 4 declined trans per credit card per 12 hours
SELECT @count = count(*) FROM Payments WITH (NOLOCK) WHERE Date > DATEADD(HOUR,-12,GETUTCDATE())
AND PaymentMethodID IN (SELECT PaymentMethodID FROM PaymentMethods WITH (NOLOCK) WHERE CcNumHash = @CcNumHash)
AND ResultFinal <> 'Approved' AND ResultFinal <> 'CommError'
IF @count > 4
BEGIN
	SET @LimitCode = 1004
	RETURN
END

-- Max 6 declined trans per externalID per 24 hours
SELECT @count = count(*) FROM Payments WITH (NOLOCK) WHERE date > DATEADD(HOUR,-24,GETUTCDATE())
AND ExternalType = @ExternalType AND ExternalID = @ExternalID
AND ResultFinal <> 'Approved' AND ResultFinal <> 'CommError'
IF @count > 6
BEGIN
	SET @LimitCode = 1005
	RETURN
END

-- No limits reached
SET @LimitCode = 0

END
GO
/****** Object:  StoredProcedure [dbo].[Payments_Get]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Payments_Get]
	@ExternalType		varchar(100),
	@ExternalID			int,
	@PaymentID			int = 0
AS	
BEGIN

SELECT
	PaymentID = p.PaymentID,
	ExternalType = p.ExternalType,
	ExternalID = p.ExternalID,
	TransactionDate = p.Date,
	PaymentMethodID = p.PaymentMethodID,
	SubscriptionID = p.SubscriptionID,
	CcExpDate = p.CcExpDate,
	Amount = p.Amount,
	AvsMatch = p.AvsMatch,
	InternationalAvs = p.InternationalAvs,
	CscMatch = p.CscMatch,
	ResultFinal = p.ResultFinal,
	[Description] = p.Description,
	IP = p.Ip,
	IPCountry = p.IpCountry,
	PaymentType = p.PaymentType,
	TransactionType = p.TransactionType,
	TransactionID = p.TransactionID,
	OriginalTransactionID = p.OriginalTransactionID,
	FirstName = p.FirstName,
	LastName = p.LastName,
	Company = p.Company,
	Email = p.Email,
	Address1 = p.Address1,
	Address2 = p.Address2,
	City = p.City,
	[State] = p.State,
	Province = p.Province,
	Zip = p.Zip,
	CountryID = p.CountryID,
	Country = 'US',
	Phone = p.Phone,
	MobilePhone = p.MobilePhone,
	VoidTransactionID = p.VoidTransactionID,
	CaptureTransactionID = p.CaptureTransactionID,
	CaptureTransactionDate = p.CaptureTransactionDate,
	ResultCode = p.ResultCode,
	ResponseMessage = p.ResponseMessage,
	AuthorizationCode = p.AuthorizationCode,
	PayflowRequestID = p.PayflowRequestID
FROM Payments p WITH (NOLOCK) 
WHERE p.ExternalType = @ExternalType AND p.ExternalID = @ExternalID
AND (@PaymentID = 0 OR p.PaymentID = @PaymentID)
ORDER BY p.Date DESC

END
GO
/****** Object:  StoredProcedure [dbo].[UserLog_CountRecentPasswordResetRequests]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserLog_CountRecentPasswordResetRequests]
	@ip					varchar(15),
	@surferID			varchar(50),
	@email				nvarchar(255)
AS

SELECT
	[Count] = COUNT(*)
FROM UserLog ul WITH (NOLOCK)
WHERE ul.date > DATEADD(MINUTE,-30,GETUTCDATE())
AND ul.action like 'PASSWORD RESET REQUEST%'
AND (ul.ip = @ip or (ul.surferID = @surferID and ul.surferID <> '') or ul.action like '%' + @email + '%')
GO
/****** Object:  StoredProcedure [dbo].[UserLog_Add]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserLog_Add]	
(
	@aspnetUserID			uniqueidentifier,
	@userID					int,	
	@action					nvarchar(2048),
	@ip						varchar(15),
	@userAgent				varchar(255),
	@surferID				varchar(50),
	@userLogID				int = 0 output    
)
AS

-- LOCAL VARIABLES 
DECLARE @error					INT,
		@errorMsg				VARCHAR(200),
		@transactionName		VARCHAR(50),
		@rowCount				INT,
		@startTransactionCount	INT
      
SELECT 
	@transactionName		= '', 
	@rowCount				= 0,
	@errorMsg				= '',
	@startTransactionCount	= @@TRANCOUNT

/* ********************************************************** */
/* BEGIN TRANSACTION */
/* ********************************************************** */
BEGIN TRAN 

INSERT INTO UserLog (aspnetUserID, date, userID, action, ip, userAgent, surferID)
VALUES (@aspnetUserID, GETUTCDATE(), @userID, @action, @ip, @userAgent, @surferID)

SELECT @error = @@ERROR, @rowCount = @@ROWCOUNT, @userLogID = SCOPE_IDENTITY()
IF @error != 0 OR @rowCount < 1 OR @userLogID = 0
BEGIN
	SELECT @userLogID = 0
	GOTO ProcedureError
END

/* ********************************************************** */
/* END OF PROCEDURE -- SUCCESS !!!!!!*/
/* ********************************************************** */
ProcedureSuccess:
IF @startTransactionCount < @@TRANCOUNT AND @@TRANCOUNT > 0
BEGIN
	COMMIT		
END

/* ********************************************************** */
/* EXIT SUCCESS                                               */
/* ********************************************************** */
RETURN @userLogID

/* ********************************************************** */
/* PROCEDURE ERROR*/
/* ********************************************************** */
ProcedureError:
-- Rollback if open tran
IF @startTransactionCount < @@TRANCOUNT AND @@TRANCOUNT > 0
BEGIN 
 	ROLLBACK TRAN 
END 

RETURN @userLogID
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Payments_UpdateVoidTransactionID]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Payments_UpdateVoidTransactionID]
	@ExternalType				varchar(100),
	@ExternalID					int,
	@PaymentID					int,
	@VoidTransactionID			varchar(50),
	@ResultCode					int = -1 output
AS

BEGIN

DECLARE @hasOuterTransaction	bit,
		@rollbackPoint			char(32),
		@sqlErrorLogID			int,
		@rowCount				int
		
SELECT 
	@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
	@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
	@rowCount				= 0,	
	@resultCode				= -1

BEGIN TRY

	IF @hasOuterTransaction = 1 
	BEGIN
		SAVE TRANSACTION @rollbackPoint
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION @rollbackPoint
	END
	
	-- ******************** START TRANSACTION WORK ************************
	
	UPDATE Payments SET 
		VoidTransactionID = @VoidTransactionID
	WHERE ExternalType = @ExternalType AND ExternalID = @ExternalID AND PaymentID = @PaymentID
	
	SELECT @rowCount = @@ROWCOUNT
	
	-- ******************** END TRANSACTION WORK ************************
		
	IF @hasOuterTransaction = 0
	BEGIN
		COMMIT TRANSACTION
	END	
	
	IF @rowCount > 0
		SET @resultCode = 0
		
	RETURN 0
END TRY
BEGIN CATCH
	-- ******************** ERROR HANDLING ************************
	
	-- An error occurred, rollback the transaction
	IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
	BEGIN
		ROLLBACK TRANSACTION @rollbackPoint
	END
	
	-- Log SQL error
	EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
		
	-- Rethrow original error
	EXECUTE Util_RethrowSqlError

	RETURN 0
END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[Payments_AddPayPalPayment]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Payments_AddPayPalPayment]
	@externalType				varchar(100),
	@externalID					int,
	@subscriptionID				int,
	@amount						money,
	@transactionDate			datetime = '01/01/1900',
	@paymentType				tinyint,
	@transactionID				varchar(50),
	@payPalPayerID				varchar(50),
	@payPalEmail				varchar(100),
	@payPalFirstName			varchar(100),
	@payPalLastName				varchar(100),
	@payPalCompany				varchar(100),
	@payPalPhone				varchar(50),
	@payPalAddress1				varchar(100),
	@payPalAddress2				varchar(100),
	@payPalCity					varchar(100),
	@payPalStateOrProvince		varchar(100),
	@payPalZip					varchar(10),
	@payPalCountryCode			char(2),
	@payPalPayerStatus			varchar(10),
	@payPalAddressStatus		varchar(10),
	@payPalPaymentStatus		varchar(10),
	@payPalResponseMessage		varchar(255),
	@description				varchar(255),
	@ip							varchar(15),
	@payPalToken				varchar(50),
	@paymentID					int output,
	@resultFinal				varchar(50) output
AS

BEGIN

DECLARE @hasOuterTransaction	bit,
		@rollbackPoint			char(32),
		@sqlErrorLogID			int,
		@rowCount				int,
		@paymentMethodID		int,
		@transactionType		char(1),
		@internationalAvs		char(1),
		@resultCode				int,
		@countryID				smallint,
		@state					char(2),
		@province				varchar(100),
		@ipCountry				char(2),
		@emptyDate				datetime
		
SELECT 
	@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
	@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
	@rowCount				= 0,
	@paymentID				= 0,
	@resultFinal			= '',
	@emptyDate				= '01/01/1900'

BEGIN TRY
	
	IF @transactionDate = '01/01/1900'
		SET @transactionDate = GETUTCDATE()
	
	SET @paymentMethodID = 1 -- PayPal
	SET @transactionType = 'S' -- PayPal Sale
	SET @internationalAvs = ''
	SET @ipCountry	= 'US' -- TODO: Use correct country code
	SELECT @countryID = 840
	
	IF LEN(@payPalStateOrProvince) = 2
	BEGIN
		SET @state = UPPER(@payPalStateOrProvince)
		SET @province = ''
	END
	ELSE
	BEGIN
		SET @province = @payPalStateOrProvince
		SET @state = ''
	END

	IF @payPalPaymentStatus = 'Completed'
	BEGIN
		SET @resultFinal = 'Approved'
		SET @resultCode = 0
	END
	ELSE
	BEGIN
		SET @resultFinal = 'Declined'
		SET @resultCode = 1
	END
	
	IF @hasOuterTransaction = 1 
	BEGIN
		SAVE TRANSACTION @rollbackPoint
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION @rollbackPoint
	END
	
	-- ******************** START TRANSACTION WORK ************************
	
	-- Log the result of this credit card transaction
	INSERT INTO Payments (externalType, externalID, paymentMethodID, SubscriptionID, date, paymentType, transactionType, amount, transactionID, originalTransactionID, description, resultFinal, resultCode, responseMessage, authorizationCode, cscMatch, avsMatch, internationalAvs, ip, ipCountry, ccExpDate, firstName, lastName, company, email, address1, address2, city, state, province, zip, countryID, phone, mobilePhone, payflowRequestID, voidTransactionID, captureTransactionID, captureTransactionDate)
	VALUES (@externalType, @externalID, @paymentMethodID, @subscriptionID, @transactionDate, @paymentType, @transactionType, @amount, @transactionID, @payPalPayerID, @description, @resultFinal, @resultCode, @payPalResponseMessage, @payPalPaymentStatus, @payPalPayerStatus, @payPalAddressStatus, @internationalAvs, @ip, @ipCountry, '01/01/1900', @payPalFirstName, @payPalLastName, @payPalCompany, @payPalEmail, @payPalAddress1, @payPalAddress2, @payPalCity, @state, @province, @payPalZip, @countryID, @payPalPhone, '', @payPalToken, '', '', @emptyDate)

	SET @paymentID = SCOPE_IDENTITY()
	
	-- ******************** END TRANSACTION WORK ************************
		
	IF @hasOuterTransaction = 0
	BEGIN
		COMMIT TRANSACTION
	END	
	
	RETURN @paymentID
END TRY
BEGIN CATCH
	-- ******************** ERROR HANDLING ************************
	
	-- An error occurred, rollback the transaction
	IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
	BEGIN
		ROLLBACK TRANSACTION @rollbackPoint
	END
	
	-- Log SQL error
	EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
		
	-- Rethrow original error
	EXECUTE Util_RethrowSqlError

	RETURN 0
END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[Payments_AddCreditCardPayment]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Payments_AddCreditCardPayment]
	@ExternalType				varchar(100),
	@ExternalID					int,
	@PaymentMethodID			int,	
	@SubscriptionID				int,
	@TransactionDate			datetime = '01/01/1900',
	@PaymentType				tinyint,
	@TransactionType			char(1),
	@Amount						money,
	@TransactionID				varchar(50),
	@OriginalTransactionID		varchar(50),
	@Description				varchar(255),
	@ResultCode					int,
	@ResponseMessage			varchar(255),
	@AuthorizationCode			varchar(10),
	@CscMatch					varchar(10),
	@AvsMatch					varchar(10),
	@InternationalAvs			char(1),
	@Ip							varchar(15),
	@PayflowRequestID			varchar(50),
	@PaymentID					int OUTPUT,
	@ResultFinal				varchar(50) OUTPUT
AS


BEGIN
-- LOCAL VARIABLES 


DECLARE @hasOuterTransaction	bit,
		@rollbackPoint			char(32),
		@sqlErrorLogID			int,
		@rowCount				int,	
		@ccExpDate				smalldatetime,
		@firstName				varchar(100),
		@lastName				varchar(100),
		@company				varchar(100),
		@email					varchar(100),
		@address1				varchar(100),
		@address2				varchar(100),
		@city					varchar(100),
		@state					char(2),
		@province				varchar(100),
		@zip					varchar(10),
		@countryID				smallint,
		@phone					varchar(50),
		@mobilePhone			varchar(50),
		@ipCountry				char(2),
		@emptyDate				smalldatetime
		
SELECT 
	@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
	@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
	@rowCount				= 0,	
	@paymentID				= 0,
	@emptyDate				= '1/1/1900',	
	@ccExpDate				= '1/1/1900',
	@ipCountry				= 'US'

BEGIN TRY
	
	IF @transactionDate = '01/01/1900'
		SET @transactionDate = GETUTCDATE()
		
	SELECT @ccExpDate = ccExpDate, @firstName = firstName, @lastName = lastName, @company = company, @email = email, @address1 = address1, 
		@address2 = address2, @city = city, @state = state, @province = province, @zip = zip, @countryID = countryID, 
		@phone = phone, @mobilePhone = mobilePhone
	FROM PaymentMethods WITH (NOLOCK) WHERE paymentMethodID = @paymentMethodID AND externalType = @externalType AND externalID = @externalID
	
	IF @ccExpDate = @emptyDate
	BEGIN
		-- Invalid (paymentID, externalType, externalID) combination
		RETURN @paymentID
	END
	
	-- Convert Payflow Specific Result Code (see Payflow Pro Developer's Guide) to company's business-rule dictated resultFinal
	IF @resultCode = 0
	BEGIN
		-- If both street and zip AVS failed, billing country is USA decline this transaction
		IF @avsMatch = 'NN' and @countryID in (840)
			set @resultFinal = 'AVSFailed'
		-- Decline all CSC non-matches 
		else if @cscMatch = 'N' 
			set @resultFinal = 'CSCFailed'
		else
			-- Approved
			set @resultFinal = 'Approved'
	END
	ELSE IF @resultCode in (4,12,13,23,24,25,50,51,111,112,114,120,125,126,127,128,132)
		-- Hard Decline
		SET @resultFinal = 'Declined'
	ELSE
		-- Communication Error
		SET @resultFinal = 'CommError'

	/* ********************************************************** */
	/* BEGIN TRANSACTION */
	/* ********************************************************** */
	IF @hasOuterTransaction = 1 
	BEGIN
		SAVE TRANSACTION @rollbackPoint
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION @rollbackPoint
	END
	
	-- ******************** START TRANSACTION WORK ************************
	
	-- Log the result of this credit card transaction
	INSERT INTO Payments (ExternalType, ExternalID, PaymentMethodID, SubscriptionID, Date, PaymentType, TransactionType, Amount, TransactionID, OriginalTransactionID, Description, ResultFinal, ResultCode, ResponseMessage, AuthorizationCode, CscMatch, AvsMatch, InternationalAvs, Ip, IpCountry, CcExpDate, FirstName, LastName, Company, Email, Address1, Address2, City, State, Province, Zip, CountryID, Phone, MobilePhone, PayflowRequestID, VoidTransactionID, CaptureTransactionID, CaptureTransactionDate)
	VALUES (@ExternalType, @ExternalID, @PaymentMethodID, @SubscriptionID, @TransactionDate, @PaymentType, @TransactionType, @Amount, @TransactionID, @OriginalTransactionID, @Description, @ResultFinal, @ResultCode, @ResponseMessage, @AuthorizationCode, @CscMatch, @AvsMatch, @InternationalAvs, @Ip, @ipCountry, @ccExpDate, @firstName, @lastName, @company, @email, @address1, @address2, @city, @state, @province, @zip, @countryID, @phone, @mobilePhone, @PayflowRequestID, '', '', @emptyDate)

	SET @paymentID = SCOPE_IDENTITY()

	UPDATE PaymentMethods SET 
		AvsMatch = case when @AvsMatch = '' then AvsMatch else @AvsMatch end,
		InternationalAvs = case when @InternationalAvs = '' then InternationalAvs else @InternationalAvs end,
		CscMatch = case when @CscMatch = '' then CscMatch else @CscMatch end,
		LastApprovedTransactionID = case when @ResultFinal = 'Approved' then @TransactionID else LastApprovedTransactionID end,
		LastApprovedTransactionDate = case when @ResultFinal = 'Approved' then @TransactionDate else LastApprovedTransactionDate end,
		status = case when @ResultFinal = 'Approved' then 0 else status end
	WHERE PaymentMethodID = @PaymentMethodID AND ExternalType = @ExternalType AND ExternalID = @ExternalID
	
	-- ******************** END TRANSACTION WORK ************************
		
	IF @hasOuterTransaction = 0
	BEGIN
		COMMIT TRANSACTION
	END	
	
	RETURN @paymentID
END TRY
BEGIN CATCH
	-- ******************** ERROR HANDLING ************************
	
	-- An error occurred, rollback the transaction
	IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
	BEGIN
		ROLLBACK TRANSACTION @rollbackPoint
	END
	
	-- Log SQL error
	EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
		
	-- Rethrow original error
	EXECUTE Util_RethrowSqlError

	RETURN 0
END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[PaymentMethods_UpdateStatus]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PaymentMethods_UpdateStatus]	
(
	@PaymentMethodID			int,
	@ExternalType				varchar(100),
	@ExternalID					int,
	@NewStatus					int,
	@ResultCode					int = -1 output
)
AS
BEGIN
	DECLARE @hasOuterTransaction	BIT,
			@rollbackPoint			CHAR(32),
			@sqlErrorLogID			INT, 
			@rowCount				INT

	BEGIN TRY

		SELECT 
			@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
			@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
			@resultCode				= -1
		
		IF @hasOuterTransaction = 1 
		BEGIN
			SAVE TRANSACTION @rollbackPoint
		END
		ELSE
		BEGIN
			BEGIN TRANSACTION @rollbackPoint
		END
		
		-- ******************** START TRANSACTION WORK ************************
		
		UPDATE PaymentMethods SET 
			Status = @NewStatus
		WHERE ExternalType = @ExternalType AND ExternalID = @ExternalID AND PaymentMethodID = @PaymentMethodID AND Status <> @NewStatus
	
		-- ******************** END TRANSACTION WORK ************************
		
		IF @hasOuterTransaction = 0
		BEGIN
			COMMIT TRANSACTION
		END
		
		SET @resultCode = 0
		
		RETURN 0
	END TRY
	BEGIN CATCH
		-- ******************** ERROR HANDLING ************************
		
		-- An error occurred, rollback the transaction
		IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
		BEGIN
			ROLLBACK TRANSACTION @rollbackPoint
		END
		
		-- Log SQL error
		EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
			
		-- Rethrow original error
		EXECUTE Util_RethrowSqlError
	
		RETURN -1
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[PaymentMethods_UpdateCreditCardIssuingBankInfo]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PaymentMethods_UpdateCreditCardIssuingBankInfo]	
(
	@ExternalType				varchar(100),
	@ExternalID					int,
	@PaymentMethodID			int,
	@IssuingBankInfo			varchar(255),
	@ResultCode					int = -1 output
)
AS
BEGIN
	DECLARE @hasOuterTransaction	BIT,
			@rollbackPoint			CHAR(32),
			@sqlErrorLogID			INT, 
			@rowCount				INT

	BEGIN TRY

		SELECT 
			@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
			@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
			@resultCode				= -1
		
		IF @hasOuterTransaction = 1 
		BEGIN
			SAVE TRANSACTION @rollbackPoint
		END
		ELSE
		BEGIN
			BEGIN TRANSACTION @rollbackPoint
		END
		
		-- ******************** START TRANSACTION WORK ************************
		
		UPDATE PaymentMethods SET 
			IssuingBankInfo = @IssuingBankInfo
		WHERE ExternalType = @ExternalType AND ExternalID = @ExternalID AND PaymentMethodID = @PaymentMethodID
	
		-- ******************** END TRANSACTION WORK ************************
		
		IF @hasOuterTransaction = 0
		BEGIN
			COMMIT TRANSACTION
		END
		
		SET @resultCode = 0
		
		RETURN 0
	END TRY
	BEGIN CATCH
		-- ******************** ERROR HANDLING ************************
		
		-- An error occurred, rollback the transaction
		IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
		BEGIN
			ROLLBACK TRANSACTION @rollbackPoint
		END
		
		-- Log SQL error
		EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
			
		-- Rethrow original error
		EXECUTE Util_RethrowSqlError
	
		RETURN -1
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[PaymentMethods_UpdateCreditCard]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PaymentMethods_UpdateCreditCard]	
(
	@ExternalType				varchar(100),
	@ExternalID					int,
	@PaymentMethodID			int,
	@FirstName					nvarchar(100),
	@LastName					nvarchar(100),
	@Company					nvarchar(100),
	@Email						nvarchar(100),
	@Address1					nvarchar(100),
	@Address2					nvarchar(100),
	@City						nvarchar(100),
	@State						char(2),
	@Province					nvarchar(100),
	@Zip						varchar(10),
	@CountryID					int,
	@Phone						varchar(50),
	@MobilePhone				varchar(50),
	@CcExpDate					datetime,
	@Ip							varchar(15),
	@ResultCode					int = -1 output
)
AS
BEGIN
	DECLARE @hasOuterTransaction	BIT,
			@rollbackPoint			CHAR(32),
			@sqlErrorLogID			INT, 
			@rowCount				INT

	BEGIN TRY

		SELECT 
			@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
			@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
			@resultCode				= -1
		
		IF @hasOuterTransaction = 1 
		BEGIN
			SAVE TRANSACTION @rollbackPoint
		END
		ELSE
		BEGIN
			BEGIN TRANSACTION @rollbackPoint
		END
		
		-- ******************** START TRANSACTION WORK ************************
		
		UPDATE PaymentMethods SET 
			FirstName = @FirstName,
			LastName = @LastName,
			Company = @Company,
			Email = @Email,
			Address1 = @Address1,
			Address2 = @Address2,
			City = @City,
			State = @State,
			Province = @Province,
			Zip = @Zip,
			CountryID = @CountryID,
			Phone = @Phone,
			MobilePhone = @MobilePhone,
			CcExpDate  = case when @CcExpDate <> '01/01/1900' then @CcExpDate else CcExpDate end,
			Ip = case when @ip <> '' then @Ip else Ip end,
			dateModified = GETUTCDATE()
		WHERE ExternalType = @ExternalType AND ExternalID = @ExternalID AND PaymentMethodID = @PaymentMethodID
	
		-- ******************** END TRANSACTION WORK ************************
		
		IF @hasOuterTransaction = 0
		BEGIN
			COMMIT TRANSACTION
		END
		
		SET @resultCode = 0
		
		RETURN 0
	END TRY
	BEGIN CATCH
		-- ******************** ERROR HANDLING ************************
		
		-- An error occurred, rollback the transaction
		IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
		BEGIN
			ROLLBACK TRANSACTION @rollbackPoint
		END
		
		-- Log SQL error
		EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
			
		-- Rethrow original error
		EXECUTE Util_RethrowSqlError
	
		RETURN -1
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[PaymentMethods_MarkAsPrimaryOrBackup]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PaymentMethods_MarkAsPrimaryOrBackup]	
(
	@ExternalType				varchar(100),
	@ExternalID					int,
	@PaymentMethodID			int,
	@MarkAs						varchar(10),
	@ResultCode					int = -1 output
)
AS
BEGIN
	DECLARE @hasOuterTransaction	BIT,
			@rollbackPoint			CHAR(32),
			@sqlErrorLogID			INT, 
			@rowCount				INT

	BEGIN TRY

		SELECT 
			@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
			@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
			@resultCode				= -1
		
		IF @hasOuterTransaction = 1 
		BEGIN
			SAVE TRANSACTION @rollbackPoint
		END
		ELSE
		BEGIN
			BEGIN TRANSACTION @rollbackPoint
		END
		
		-- ******************** START TRANSACTION WORK ************************
		IF @MarkAs = 'primary'
		BEGIN
			UPDATE PaymentMethods SET IsPrimary = 1, IsBackup = 0 WHERE PaymentMethodID = @PaymentMethodID AND ExternalType = @ExternalType AND ExternalID = @ExternalID AND IsPrimary = 0
			IF @@ROWCOUNT > 0
				UPDATE PaymentMethods SET IsPrimary = 0 WHERE PaymentMethodID <> @PaymentMethodID AND ExternalType = @ExternalType AND ExternalID = @ExternalID 
		END
		ELSE IF @MarkAs = 'backup'
		BEGIN
			UPDATE PaymentMethods SET IsBackup = 1, IsPrimary = 0 WHERE PaymentMethodID = @PaymentMethodID AND ExternalType = @externalType AND ExternalID = @ExternalID AND IsBackup = 0
			IF @@ROWCOUNT > 0
				UPDATE PaymentMethods SET IsBackup = 0 WHERE PaymentMethodID <> @PaymentMethodID AND externalType = @ExternalType AND ExternalID = @ExternalID 
		END
		
		-- ******************** END TRANSACTION WORK ************************
		
		IF @hasOuterTransaction = 0
		BEGIN
			COMMIT TRANSACTION
		END
		
		SET @resultCode = 0
		
		RETURN 0
	END TRY
	BEGIN CATCH
		-- ******************** ERROR HANDLING ************************
		
		-- An error occurred, rollback the transaction
		IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
		BEGIN
			ROLLBACK TRANSACTION @rollbackPoint
		END
		
		-- Log SQL error
		EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
			
		-- Rethrow original error
		EXECUTE Util_RethrowSqlError
	
		RETURN -1
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[PaymentMethods_AddCreditCard]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PaymentMethods_AddCreditCard]
	@ExternalType			varchar(100),
	@ExternalID				int,
	@CcType					tinyint,
	@CcNumHash				varchar(100),
	@CcLast4				char(4),
	@CcExpDate				smalldatetime,
	@FirstName				nvarchar(100),
	@LastName				nvarchar(100),
	@Company				nvarchar(100),
	@Email					nvarchar(100),
	@Address1				nvarchar(100),
	@Address2				nvarchar(100),
	@City					nvarchar(100),
	@State					char(2),
	@Province				nvarchar(100),
	@Zip					varchar(10),
	@CountryID				smallint,
	@Phone					varchar(50),
	@MobilePhone			varchar(50),
	@Ip						varchar(15),
	@PaymentMethodID		int = 0 output
AS

BEGIN
-- LOCAL VARIABLES 
DECLARE @hasOuterTransaction	BIT,
		@rollbackPoint			CHAR(32),
		@sqlErrorLogID			INT,
		@rowCount				INT,		
		@type					TINYINT,
		@isPrimary				BIT,
		@isBackup				BIT,
		@status					TINYINT,
		@ipCountry				CHAR(2)
		
SELECT 
	@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
	@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
	@rowCount				= 0,	
	@paymentMethodID		= 0,
	@type					= 1,
	@isBackup				= 0,
	@status					= 1,
	@ipCountry				= ''	

BEGIN TRY

	-- Make sure that the same ccNumHash is not yet in this customer's account
	SELECT @paymentMethodID = paymentMethodID from PaymentMethods WITH (NOLOCK) WHERE ExternalType = @ExternalType AND ExternalID = @ExternalID and CcNumHash = @CcNumHash
	
	IF @paymentMethodID > 0	
		RETURN @paymentMethodID


	/* ********************************************************** */
	/* BEGIN TRANSACTION */
	/* ********************************************************** */
	IF @hasOuterTransaction = 1 
	BEGIN
		SAVE TRANSACTION @rollbackPoint
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION @rollbackPoint
	END
	
	-- ******************** START TRANSACTION WORK ************************
	
	-- If there is already a primary card, keep that one primary. Otherwise, make the new card primary.
	IF (SELECT COUNT(*) from PaymentMethods WITH (NOLOCK) WHERE ExternalType = @ExternalType AND ExternalID = @ExternalID AND Type = @type AND Status = 0 and IsPrimary = 1) > 0
		SET @isPrimary = 0
	ELSE 
	BEGIN
		SET @isPrimary = 1

		-- Make sure that no other credit card is marked as primary
		UPDATE PaymentMethods SET isPrimary = 0 WHERE externalType = @externalType AND externalID = @externalID AND isPrimary = 1	
	END

	INSERT INTO PaymentMethods (ExternalType, ExternalID, Type, Status, IsPrimary, IsBackup, CcType, CcNumHash, CcLast4, CcExpDate, 
		FirstName, LastName, Company, Email, Address1, Address2, City, State, Province, Zip, CountryID, Phone, MobilePhone, Ip, IpCountry,
		CscMatch, AvsMatch, InternationalAvs, DateValidated, DateSignatureReceived, DateAdded, DateModified,LastApprovedTransactionID, LastApprovedTransactionDate, 
		issuingBankInfo) 
	VALUES (@ExternalType, @ExternalID, @type, @status, @isPrimary, @isBackup, @CcType, @CcNumHash, @CcLast4, @CcExpDate, @FirstName, @LastName, @Company, @Email, @Address1, @Address2,
	 @City, @State, @Province, @Zip, @CountryID, @Phone, @MobilePhone, @Ip, @ipCountry,
			'','','','1/1/1900','1/1/1900',getutcdate(),'1/1/1900', '','1/1/1900', '')

	SELECT @rowCount = @@ROWCOUNT, @paymentMethodID = SCOPE_IDENTITY()
	
	-- ******************** END TRANSACTION WORK ************************
		
	IF @hasOuterTransaction = 0
	BEGIN
		COMMIT TRANSACTION
	END	
	
	RETURN @paymentMethodID
END TRY
BEGIN CATCH
	-- ******************** ERROR HANDLING ************************
	
	-- An error occurred, rollback the transaction
	IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
	BEGIN
		ROLLBACK TRANSACTION @rollbackPoint
	END
	
	-- Log SQL error
	EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
		
	-- Rethrow original error
	EXECUTE Util_RethrowSqlError

	RETURN 0
END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 09/18/2012 01:03:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[UserSubscriptions_UpdateStatus]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSubscriptions_UpdateStatus]	
(
	@SubscriptionID				int,
	@UserID						int,
	@Status						int,
	@ResultCode					int = -1 output
)
AS
BEGIN
	DECLARE @hasOuterTransaction	BIT,
			@rollbackPoint			CHAR(32),
			@sqlErrorLogID			INT, 
			@rowCount				INT

	BEGIN TRY

		SELECT 
			@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
			@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
			@resultCode				= -1
			
		IF @SubscriptionID <= 0 or @UserID <= 0 or @Status < 0 or @Status > 2
			RETURN @ResultCode
		
		-- IF THERE EXISTS ANOTHER TRANSACTION WHICH IS ACTIVE FOR THIS USER, THEN HE CANNOT HAVE TWO ACTIVE SUBSCRIPTIONS AT THE SAME TIME	
		IF @Status = 1
		BEGIN 
			IF EXISTS (SELECT UserID FROM UserSubscriptions us WITH (NOLOCK) WHERE UserID = @UserID AND SubscriptionID <> @SubscriptionID AND us.Status = 1)
				RETURN @ResultCode
		END
		
		IF @hasOuterTransaction = 1 
		BEGIN
			SAVE TRANSACTION @rollbackPoint
		END
		ELSE
		BEGIN
			BEGIN TRANSACTION @rollbackPoint
		END
		
		-- ******************** START TRANSACTION WORK ************************
		
		UPDATE UserSubscriptions SET 
			Status = @Status
		WHERE SubscriptionID = @SubscriptionID and UserID = @UserID
		
		IF @@ROWCOUNT > 0
			SET @ResultCode = 0
	
		-- ******************** END TRANSACTION WORK ************************
		
		IF @hasOuterTransaction = 0
		BEGIN
			COMMIT TRANSACTION
		END
		
		RETURN @ResultCode
	END TRY
	BEGIN CATCH
		-- ******************** ERROR HANDLING ************************
		
		-- An error occurred, rollback the transaction
		IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
		BEGIN
			ROLLBACK TRANSACTION @rollbackPoint
		END
		
		-- Log SQL error
		EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
			
		-- Rethrow original error
		EXECUTE Util_RethrowSqlError
	
		SET @ResultCode = -1
		RETURN -1
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[UserSubscriptions_Add]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSubscriptions_Add]	
(			
	@UserID							int,
	@SubscriptionTypeID				int,
	@DateStart						smalldatetime,
	@DateEnd						smalldatetime,
	@Status							int,
	@SubscriptionID					int = 0 output
)
AS
BEGIN
	DECLARE @hasOuterTransaction	BIT,
			@rollbackPoint			CHAR(32),
			@sqlErrorLogID			INT, 
			@rowCount				INT
		
	BEGIN TRY

		SELECT 
			@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
			@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
			@SubscriptionID			= 0
		
		
		IF @SubscriptionTypeID = 0 OR @UserID = 0 OR @DateStart >= @DateEnd OR @DateEnd < GETUTCDATE()
			RETURN
		
		IF NOT EXISTS (SELECT SubscriptionTypeID FROM UserSubscriptionTypes WITH (NOLOCK) WHERE SubscriptionTypeID = @SubscriptionTypeID)
			RETURN
		
		IF NOT EXISTS (SELECT UserID FROM Users u WITH (NOLOCK) WHERE UserID = @UserID)
			RETURN
		
		IF EXISTS (SELECT SubscriptionID FROM UserSubscriptions WITH (NOLOCK) WHERE UserID = @UserID and Status = 1)
			RETURN
			
		--DECLARE @CurrentSubscriptionExpiryDate SMALLDATETIME = '1/1/1900'
		
		--SELECT @CurrentSubscriptionExpiryDate = MAX(DateEnd) FROM UserSubscriptionStatus WHERE UserID = @UserID
		
		--SET @CurrentSubscriptionExpiryDate = ISNULL(@CurrentSubscriptionExpiryDate, '1/1/1900')
		
		--IF @CurrentSubscriptionExpiryDate <> '1/1/1900' AND @DateStart <> DATEADD(DAY, 1, @CurrentSubscriptionExpiryDate)
		--	RETURN
			
		IF @hasOuterTransaction = 1 
		BEGIN
			SAVE TRANSACTION @rollbackPoint
		END
		ELSE
		BEGIN
			BEGIN TRANSACTION @rollbackPoint
		END
		
		-- ******************** START TRANSACTION WORK ************************
		INSERT INTO UserSubscriptions(UserID, SubscriptionTypeID, [Status], DateStart, DateEnd, DateCreated, DateModified, DateCancelled)		
		VALUES(@UserID, @SubscriptionTypeID, @Status, @DateStart, @DateEnd, GETUTCDATE(), GETUTCDATE(), '1/1/1900')
		
		SET @SubscriptionID = SCOPE_IDENTITY()
		
		-- ******************** END TRANSACTION WORK ************************
		
		IF @hasOuterTransaction = 0
		BEGIN
			COMMIT TRANSACTION
		END
		
		RETURN @SubscriptionID
	END TRY
	BEGIN CATCH
		-- ******************** ERROR HANDLING ************************
		
		-- An error occurred, rollback the transaction
		IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
		BEGIN
			ROLLBACK TRANSACTION @rollbackPoint
		END
		
		-- Log SQL error
		EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
			
		-- Rethrow original error
		EXECUTE Util_RethrowSqlError
	
		SET @SubscriptionID = 0
		
		RETURN @SubscriptionID
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[UserSubscriptionTypes_UpdateStatus]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSubscriptionTypes_UpdateStatus]	
(	
	@SubscriptionTypeID				int,
	@Status							int,
	@ResultCode						int = -1 output    
)
AS
BEGIN
	DECLARE @hasOuterTransaction	BIT,
			@rollbackPoint			CHAR(32),
			@sqlErrorLogID			INT, 
			@rowCount				INT
		
	BEGIN TRY

		SELECT 
			@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
			@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
			@ResultCode		    	= -1
		
		IF NOT EXISTS (SELECT SubscriptionTypeID FROM UserSubscriptionTypes WITH (NOLOCK) WHERE SubscriptionTypeID = @SubscriptionTypeID)
			RETURN @ResultCode

		IF @hasOuterTransaction = 1 
		BEGIN
			SAVE TRANSACTION @rollbackPoint
		END
		ELSE
		BEGIN
			BEGIN TRANSACTION @rollbackPoint
		END
		
		-- ******************** START TRANSACTION WORK ************************
		UPDATE us 
		SET us.Status = @Status, us.DateModified = GETUTCDATE()
		FROM UserSubscriptionTypes us
		WHERE us.SubscriptionTypeID = @SubscriptionTypeID
		
		
		IF @@ROWCOUNT > 0
			SET @ResultCode = 0
		
		-- ******************** END TRANSACTION WORK ************************
		
		IF @hasOuterTransaction = 0
		BEGIN
			COMMIT TRANSACTION
		END
		
		RETURN @ResultCode
	END TRY
	BEGIN CATCH
		-- ******************** ERROR HANDLING ************************
		
		-- An error occurred, rollback the transaction
		IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
		BEGIN
			ROLLBACK TRANSACTION @rollbackPoint
		END
		
		-- Log SQL error
		EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
			
		-- Rethrow original error
		EXECUTE Util_RethrowSqlError
	
		SET @ResultCode = -1
		
		RETURN @ResultCode
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[Users_Add]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_Add]	
(
	@aspnetUserID		uniqueidentifier,
	@username			varchar(100),
	@accessType			int,
	@status				int,
	@firstName			varchar(100),
	@lastName			varchar(100),
	@address1			nvarchar(512),
	@address2			nvarchar(512),
	@city				nvarchar(200),
	@state				nvarchar(100),
	@zip				nvarchar(100),
	@phone				nvarchar(100),
	@userID				int = 0 output    
)
AS
BEGIN
	DECLARE @hasOuterTransaction	BIT,
			@rollbackPoint			CHAR(32),
			@sqlErrorLogID			INT, 
			@rowCount				INT
		
	BEGIN TRY

		SELECT 
			@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
			@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
			@userID					= 0
		
		IF EXISTS (SELECT UserID FROM Users u WITH (NOLOCK) WHERE AspnetUserID = @aspnetUserID)
			RETURN

		IF @hasOuterTransaction = 1 
		BEGIN
			SAVE TRANSACTION @rollbackPoint
		END
		ELSE
		BEGIN
			BEGIN TRANSACTION @rollbackPoint
		END
		
		-- ******************** START TRANSACTION WORK ************************
		INSERT INTO Users(AspnetUserID, Username, AccessType, [Status], DateCreated, DateModified)
		VALUES(@aspnetUserID, @username, @accessType, @status, GETUTCDATE(), GETUTCDATE())
		
		SET @userID = SCOPE_IDENTITY()
		
		INSERT INTO UserDetails(UserID, FirstName, LastName, Address1, Address2, City, [State], Zip, Phone, DateModified)
		VALUES(@userID, @firstName, @lastName, @address1, @address2, @city, @state, @zip, @phone, GETUTCDATE())
		
		-- ******************** END TRANSACTION WORK ************************
		
		IF @hasOuterTransaction = 0
		BEGIN
			COMMIT TRANSACTION
		END
		
		RETURN @userID
	END TRY
	BEGIN CATCH
		-- ******************** ERROR HANDLING ************************
		
		-- An error occurred, rollback the transaction
		IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
		BEGIN
			ROLLBACK TRANSACTION @rollbackPoint
		END
		
		-- Log SQL error
		EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
			
		-- Rethrow original error
		EXECUTE Util_RethrowSqlError
	
		SET @userID = 0
		
		RETURN @userID
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[UserSubscriptionTypes_Add]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSubscriptionTypes_Add]	
(			
	@Amount							money,
	@DurationTypeID					int,
	@DurationTime					decimal(10,2),
	@TotalCycles					int,
	@Name							varchar(256),		
	@Description					nvarchar(512),
	@Status							int,
	@Rank							int,
	@SubscriptionTypeID				int = 0 output    
)
AS
BEGIN
	DECLARE @hasOuterTransaction	BIT,
			@rollbackPoint			CHAR(32),
			@sqlErrorLogID			INT, 
			@rowCount				INT
		
	BEGIN TRY

		SELECT 
			@hasOuterTransaction	= CASE WHEN @@TRANCOUNT > 0 THEN 1 ELSE 0 END,
			@rollbackPoint			= REPLACE(CONVERT(CHAR(36), NEWID()), '-', ''),
			@SubscriptionTypeID		 = 0
		
		IF @Amount < 0 OR @DurationTypeID <= 0 OR @DurationTime <= 0 or @TotalCycles < 0 or @Name = '' or @Description = '' or @Status < 0 or @Rank < 0
			RETURN
		
		IF EXISTS (SELECT SubscriptionTypeID FROM UserSubscriptionTypes WITH (NOLOCK) WHERE DurationTypeID = @DurationTypeID and DurationTime = @DurationTime)
			RETURN

		IF @hasOuterTransaction = 1 
		BEGIN
			SAVE TRANSACTION @rollbackPoint
		END
		ELSE
		BEGIN
			BEGIN TRANSACTION @rollbackPoint
		END
		
		-- ******************** START TRANSACTION WORK ************************
		INSERT INTO UserSubscriptionTypes(Amount, DurationTypeID, DurationTime, Name, Description, Status, [Rank], DateCreated, DateModified)
		VALUES(@Amount, @DurationTypeID, @DurationTime, @Name, @Description, @Status, @Rank, GETUTCDATE(), GETUTCDATE())
		
		SET @SubscriptionTypeID = SCOPE_IDENTITY()
		
		-- ******************** END TRANSACTION WORK ************************
		
		IF @hasOuterTransaction = 0
		BEGIN
			COMMIT TRANSACTION
		END
		
		RETURN @SubscriptionTypeID
	END TRY
	BEGIN CATCH
		-- ******************** ERROR HANDLING ************************
		
		-- An error occurred, rollback the transaction
		IF XACT_STATE() <> 0 -- 1=committable, -1=uncommittable, 0=no transaction
		BEGIN
			ROLLBACK TRANSACTION @rollbackPoint
		END
		
		-- Log SQL error
		EXECUTE SqlErrorLog_Add @sqlErrorLogID = @sqlErrorLogID OUTPUT
			
		-- Rethrow original error
		EXECUTE Util_RethrowSqlError
	
		SET @SubscriptionTypeID = 0
		
		RETURN @SubscriptionTypeID
	END CATCH
	
END
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 09/18/2012 01:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 09/18/2012 01:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 09/18/2012 01:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 09/18/2012 01:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 09/18/2012 01:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 09/18/2012 01:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 09/18/2012 01:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 09/18/2012 01:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
GO
/****** Object:  StoredProcedure [dbo].[Users_GetByAspnetUserID]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_GetByAspnetUserID]	
	@aspnetUserID		uniqueidentifier
AS

SELECT
	u.UserID,
	u.AspnetUserID,
	u.Username,
	am.Email,
	u.AccessType,
	u.Status,
	ud.FirstName,
	ud.LastName,
	ud.Address1,
	ud.Address2,
	ud.City,
	ud.State, 
	ud.Zip,
	ud.Phone, 	
	u.DateCreated,
	ud.DateModified
FROM aspnet_Membership am WITH (NOLOCK)
INNER JOIN Users u WITH(NOLOCK) ON am.UserId = u.AspnetUserID 
INNER JOIN UserDetails ud WITH (NOLOCK) ON ud.UserID = u.UserID
WHERE am.UserId = @aspnetUserID
GO
/****** Object:  StoredProcedure [dbo].[Users_Get]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Users_Get]	
	@userID			int = 0,
	@username		varchar(100) = '',
	@email			nvarchar(256) = ''
AS


SELECT
	u.UserID,
	u.AspnetUserID,
	u.Username,
	am.Email,
	am.Password,
	u.AccessType,
	u.Status,
	ud.FirstName,
	ud.LastName,
	ud.Address1,
	ud.Address2,
	ud.City,
	ud.State, 
	ud.Zip,
	ud.Phone, 	
	u.DateCreated,
	ud.DateModified
FROM aspnet_Membership am WITH (NOLOCK)
INNER JOIN Users u WITH(NOLOCK) ON am.UserId = u.AspnetUserID 
INNER JOIN UserDetails ud WITH (NOLOCK) ON ud.UserID = u.UserID
WHERE (@userID = 0 or u.UserID = @userID) and
(@username = '' or u.Username = @username) and
(@email = '' or am.Email = @email) and
(@userID > 0 or @username != '' or @email != '')
GO
/****** Object:  StoredProcedure [dbo].[UserLog_Get]    Script Date: 09/18/2012 01:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserLog_Get]
	@dateFrom			datetime,
	@dateTo				datetime,
	@aspnetUserID		uniqueidentifier = NULL,
	@userID				int = 0
AS


DECLARE @includeAspnetUserIDs TABLE (aspnetUserID_db UNIQUEIDENTIFIER)

-- Performing filtering in steps to ensure that index seeks are used
IF @userID <> 0
BEGIN
	INSERT INTO @includeAspnetUserIDs
	SELECT AspnetUserID FROM Users u WITH (NOLOCK) WHERE u.UserID = @userID
END 

IF NOT @aspnetUserID IS NULL
BEGIN
	INSERT INTO @includeAspnetUserIDs VALUES (@aspnetUserID)
END

SELECT
	UserLogID = ul.userLogID,
	[Date] = ul.date,
	AspnetUserID = ul.aspnetUserID,
	UserID = ul.userID,	
	[Action] = ul.action,
	IP = ul.ip,
	UserAgent = ul.userAgent,
	SurferID = ul.surferID,
	Username = (SELECT userName FROM Users u WITH (NOLOCK) WHERE u.AspnetUserID = ul.aspnetUserID),
	Email = (SELECT LoweredEmail FROM aspnet_Membership am WHERE am.UserId = ul.aspnetUserID)
FROM UserLog ul WITH (NOLOCK) 
WHERE ul.date BETWEEN @dateFrom AND @dateTo
AND ul.aspnetUserID IN (SELECT aspnetUserID_db FROM @includeAspnetUserIDs)
ORDER BY ul.date DESC
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 09/18/2012 01:03:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__07C12930]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__22751F6C]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__5AB9788F]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__662B2B3B]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__43D61337]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__0D7A0286]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__0E6E26BF]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__0F624AF8]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  Default [DF_PaymentMethods_externalType]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[PaymentMethods] ADD  CONSTRAINT [DF_PaymentMethods_externalType]  DEFAULT ('') FOR [ExternalType]
GO
/****** Object:  Default [DF_Payments_externalType_db]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[Payments] ADD  CONSTRAINT [DF_Payments_externalType_db]  DEFAULT ('') FOR [ExternalType]
GO
/****** Object:  Default [DF_SqlErrorLog_date_db]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[SqlErrorLog] ADD  CONSTRAINT [DF_SqlErrorLog_date_db]  DEFAULT (getutcdate()) FOR [date_db]
GO
/****** Object:  Default [DF_UserSubscriptionTypes_TotalCycles]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[UserSubscriptionTypes] ADD  CONSTRAINT [DF_UserSubscriptionTypes_TotalCycles]  DEFAULT ((0)) FOR [TotalCycles]
GO
/****** Object:  Default [DF_UserSubscriptionTypes_Rank]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[UserSubscriptionTypes] ADD  CONSTRAINT [DF_UserSubscriptionTypes_Rank]  DEFAULT ((0)) FOR [Rank]
GO
/****** Object:  Default [DF_UserSubscriptionTypes_DateCreated]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[UserSubscriptionTypes] ADD  CONSTRAINT [DF_UserSubscriptionTypes_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_UserSubscriptionTypes_DateModified]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[UserSubscriptionTypes] ADD  CONSTRAINT [DF_UserSubscriptionTypes_DateModified]  DEFAULT ('1/1/1900') FOR [DateModified]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__208CD6FA]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__2180FB33]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__59C55456]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__6166761E]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__671F4F74]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__681373AD]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__37703C52]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__42E1EEFE]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__0C85DE4D]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__498EEC8D]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__489AC854]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK_ProviderAmenityTypes_AmenityTypes]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[ProviderAmenityTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProviderAmenityTypes_AmenityTypes] FOREIGN KEY([AmenityTypeID])
REFERENCES [dbo].[AmenityTypes] ([AmenityTypeID])
GO
ALTER TABLE [dbo].[ProviderAmenityTypes] CHECK CONSTRAINT [FK_ProviderAmenityTypes_AmenityTypes]
GO
/****** Object:  ForeignKey [FK_ProviderAmenityTypes_ProviderTypes]    Script Date: 09/18/2012 01:03:10 ******/
ALTER TABLE [dbo].[ProviderAmenityTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProviderAmenityTypes_ProviderTypes] FOREIGN KEY([ProviderTypeID])
REFERENCES [dbo].[ProviderTypes] ([ProviderTypeID])
GO
ALTER TABLE [dbo].[ProviderAmenityTypes] CHECK CONSTRAINT [FK_ProviderAmenityTypes_ProviderTypes]
GO
