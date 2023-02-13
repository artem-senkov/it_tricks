#Enter a path to your import CSV file
$ADUsers = Import-csv C:\Scripts\NewUsers.csv

foreach ($User in $ADUsers)
{

       $Username    = $User.username
       $Password    = $User.password
       $Firstname   = $User.firstname
       $Lastname    = $User.lastname
  
   Write "Create user: $Username $Password $Firstname $Lastname"  

              
        #Account will be created in the OU listed in the $OU variable in the CSV file;
 
		New-LocalUser -Name $Username -FullName "$Firstname $Lastname" -Password (convertto-securestring $Password -AsPlainText -Force) -PasswordNeverExpires
        
		Add-LocalGroupMember -Group "Users" -Member "$username"   
		Add-LocalGroupMember -Group "Remote desktop users" -Member "$username"
       }
Write "Script run finished"