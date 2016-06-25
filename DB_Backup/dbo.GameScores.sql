CREATE TABLE [dbo].[GameScores] (
    [ScoreID]     INT          IDENTITY (200, 1) NOT NULL,
    [GameName]    VARCHAR (50) NOT NULL,
    [Description] VARCHAR (50) NOT NULL,
    [TeamA]       VARCHAR (50) NOT NULL,
    [TeamAScore]  INT          NOT NULL,
    [TeamB]       VARCHAR (50) NOT NULL,
    [TeamBScore]  INT          NOT NULL,
    [Spectators]  NUMERIC (18) NOT NULL,
    CONSTRAINT [PK_GameScores] PRIMARY KEY CLUSTERED ([ScoreID] ASC)
);

