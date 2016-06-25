CREATE TABLE [dbo].[Games] (
    [GameID]      INT           IDENTITY (100, 1) NOT NULL,
    [GameName]    VARCHAR (50)  NOT NULL,
    [Description] VARCHAR (MAX) NOT NULL,
    [Spectators]  BIGINT        NOT NULL,
    [WinningTeam] VARCHAR (50)  NOT NULL,
    [WinningTeamScore]  INT           NOT NULL,
    [LosingTeam] VARCHAR (50)  NOT NULL,
    [LosingTeamScore]  INT           NOT NULL,
    [GameDate] DATETIME      NOT NULL,
    CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED ([GameID] ASC)
);

