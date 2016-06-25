CREATE TABLE [dbo].[Users] (
    [UserID]    INT           IDENTITY (400, 1) NOT NULL,
    [FirstName] VARCHAR (50)  NOT NULL,
    [LastName]  VARCHAR (50)  NOT NULL,
    [UserName]  VARCHAR (50)  NOT NULL,
    [EmailID]   VARCHAR (50)  NOT NULL,
    [Password]  NVARCHAR (50) NOT NULL,
    [Salt]      VARCHAR (50)  NOT NULL,
    [TeamID]    INT           NOT NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserID] ASC)
);

