@rem 建立當天日期資料夾
set Date_folder=%date:~0,4%%date:~5,2%%date:~8,2%
md %Date_folder%

@rem 查詢門禁資料庫資料
sqlcmd -i E:\mpscripts\maintain\check_card_people_mapping.sql -o E:\mpscripts\maintain\%Date_folder%\check_card_people_mapping.log
sqlcmd -i E:\mpscripts\maintain\check_cardpassword.sql -o E:\mpscripts\maintain\%Date_folder%\check_cardpassword.log
sqlcmd -i E:\mpscripts\maintain\check_duplicate_cardlog.sql -o E:\mpscripts\maintain\%Date_folder%\check_duplicate_cardlog.log
sqlcmd -i E:\mpscripts\maintain\check_future_cardlog.sql -o E:\mpscripts\maintain\%Date_folder%\check_future_cardlog.log
sqlcmd -i E:\mpscripts\maintain\check_orgunit.sql -o E:\mpscripts\maintain\%Date_folder%\check_orgunit.log
sqlcmd -i E:\mpscripts\maintain\check_people_orgunit_mapping.sql -o E:\mpscripts\maintain\%Date_folder%\check_people_orgunit_mapping.log
sqlcmd -i E:\mpscripts\maintain\check_unprocess_commandcard.sql -o E:\mpscripts\maintain\%Date_folder%\check_unprocess_commandcard.log

@rem 檢視備份檔案列表
dir /b /on Z:\sql_db\doorkeeper > E:\mpscripts\maintain\%Date_folder%\backuplist_doorkeeper.txt
dir /b /on Z:\sql_db\src > E:\mpscripts\maintain\%Date_folder%\backuplist_src.txt
dir /b /on Z:\sql_db\transferDB > E:\mpscripts\maintain\%Date_folder%\backuplist_transferDB.txt
dir /b /on Z:\sql_db\transferDB2 > E:\mpscripts\maintain\%Date_folder%\backuplist_transferDB2.txt

dir /on Z:\web\doorkeeper_web_backup > E:\mpscripts\maintain\%Date_folder%\backuplist_doorkeeper_web.txt
dir /on Z:\service\doorkeeper_service_backup > E:\mpscripts\maintain\%Date_folder%\backuplist_doorkeeper_service.txt

