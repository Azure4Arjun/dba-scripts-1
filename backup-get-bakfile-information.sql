DECLARE @BakFile NVARCHAR(1000) = N'\\server\repository\bakfile.bak';

-- Returns list of the database and log files
RESTORE FILELISTONLY FROM DISK = @BakFile;

-- Retrieves header info for all backup sets on a backup device
RESTORE HEADERONLY FROM DISK = @BakFile;

-- Returns info about the backup media on a backup device
RESTORE LABELONLY FROM DISK = @BakFile;

-- Verifies the backup is complete and readable but does not restore it
--RESTORE VERIFYONLY FROM DISK = @BakFile WITH NOUNLOAD, STATS = 10;
