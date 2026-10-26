use [iCMServer]
GO

ALTER TABLE ifr_iframe ADD ifr_target nvarchar (50) NULL
GO

UPDATE ifr_iframe SET ifr_target = '_self'
GO