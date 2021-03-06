
SELECT	name
		,physical_name AS CurrentLocation
		,size / 128 AS size_MB
		,growth / 128 AS growth_MB
		,'ALTER DATABASE [tempdb] MODIFY FILE (NAME = N''' + name + ''', SIZE = 1024, FILEGROWTH = 1024 );' AS AlterSize
		,'ALTER DATABASE [tempdb] MODIFY FILE (NAME = N''' + name + ''', FILEGROWTH = 1024 );' AS AlterFilegrowth
		,'ALTER DATABASE [tempdb] ADD FILE ( NAME = N''' + name + ''', FILENAME = N''' + physical_name + ''' , SIZE = 1024 , FILEGROWTH = 1024 );' AS AddFile
		,'ALTER DATABASE [tempdb] REMOVE FILE [' + name + '];' AS RemoveFile
FROM sys.master_files
WHERE database_id = DB_ID(N'tempdb');
