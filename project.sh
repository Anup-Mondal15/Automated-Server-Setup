# !/bin/bash
#login info
login(){
read -p 'Username: ' user
read -sp 'Password: ' pass

if [ $user == "anup" ] && [ $pass == "anup3424" ]; then
	{ m_display () {
     clear
     echo -e "\t\t\t\e[92mAUTOMATED SERVER SETUP\e[0m"
     echo -e "\t\t\t\e[94m----------------------\e[0m"
     echo
     echo
     echo
     echo "1.SAMBA server setup"
     echo "2.NFS server setup"
     echo "3.DHCP server setup"
     echo "4.APACHE2 server setup"
     echo "5.FTP server setup"
     echo "6.exit"
     echo
     echo "Enter Your choice: "
     read n
     
     case $n in
          1)
          s_display ;;
          
          2)
          n_display ;;
          
          3)
          display ;;
           
          4)
          disp ;;
          
          5)
          f_display ;;

          6)
          clear
          exit ;;
          
          *)
          clear
          echo -e "\e[5m\e[91mYou entered incorrect number!\e[0m\e[0m"
          sleep 3
          m_display ;;
       esac
     
}

###SAMBA server setup
###-----------------

s_display () {
     clear
     echo -e "\t\t\t\e[92mAutomated SAMBA server setup\e[0m"
     echo -e "\t\t\t\e[94m----------------------------\e[0m"
     echo
     echo
     echo "1.Install and configure SAMBA"
     echo "2.Start SAMBA server"
     echo "3.See the SAMBA server info"
     echo "4.Check server status"
     echo "5.Back"
     echo "6.Exit"
     echo
     echo "Enter Your choice: "
     read n
     
     case $n in
          1)
          s_install ;;
          
          2)
          s_samba ;;
           
          3)
          inf ;;
          
          4)
          s_status ;;

          5)
          m_display ;;
          
          6)
          clear
          exit ;;
          
          *)
          clear
          echo -e "\e[5m\e[91mYou entered incorrect number!\e[0m\e[0m"
          sleep 3
          s_display ;;
       esac
     
}
s_install () {
    clear
    sudo apt-get update
    sudo apt install samba -y
    echo -e "\e[92m50% completed\e[0m"
    sleep 3
    sudo mkdir -p /srv/samba/share
    echo -e "\e[92m80% completed\e[0m"
    sleep 2
    sudo chmod 777 /srv/samba/share
    echo -e "\e[92m100% completed\e[0m"
    sleep 3
    sudo cp -r ./files/smb.conf /etc/samba/
    echo -e "\e[92minstall completed successfull\e[0m"
    sleep 3
    s_display
}
s_samba () {
    clear
    echo -e "\e[32mwait for starting SAMBA.....\e[0m"
    sleep 3
    sudo systemctl start smbd
    sudo systemctl start nmbd
    sudo systemctl enable smbd nmbd
    echo -e "\e[32mSAMBA server started successfully..\e[0m"
    sleep 3
    s_display
}
inf () {
   clear

   echo -e "\t\t\t\e[95mSAMBA server info"
   echo -e "\t\t\t\e[95m-----------------"
   echo
   echo
   echo -ne "\e[96mYour SAMBA server ip: "
   hostname -I
   echo -e "\e[34mSAMBA shared folder default path = /srv/samba/share"
   echo -e "\e[92mValid root user=anup\e[0m"
   echo -e "\e[92mValid root pass=anup321\e[0m"
   echo
   echo
   echo -e "\e[101mN.B:Valid root user has read and write all permission\e[0m"
   i=30
   echo
   echo
   while [ $i -gt 0 ]
   do
   echo -ne "Display remainning for $i seconds"\\r
   i=`expr $i - 1`
   sleep 1
   done
   s_display
}
s_status () {
    clear
    echo -e "\e[32mchecking status.....\e[0m"
    sleep 3
    sudo systemctl status smbd
    echo -e "\e[32mSAMBA server checking successfully..\e[0m"
    sleep 3
    s_display
}

###NFS server setup
###-----------------

n_display () {
     clear
     echo -e "\t\t\t\e[34mNFS server setup\e[0m"
     echo -e "\t\t\t\e[34m----------------\e[0m"
     echo
     echo
     echo "1.Install and configure NFS"
     echo "2.Start NFS server"
     echo "3.See the info of NFS server"
     echo "4.Check server status"
     echo "5.Back"
     echo "6.Exit"
     echo
     echo "Enter Your choice: "
     read n
     
     case $n in
          1)
          n_install ;;
          
          2)
          n_nfs ;;
           
          3)
          n_inf ;;
          
          4)
          n_status ;;

          5)
          m_display ;;
          
          6)
          clear
          exit ;;
          
          *)
          clear
          echo -e "\e[5m\e[91mYou entered incorrect number!\e[0m\e[0m"
          sleep 3
          n_display ;;
       esac
     
}
n_install () {
    clear
    sudo apt-get update
    sudo apt install nfs-kernel-server
    echo -e "\e[92m50% completed\e[0m"
    sleep 3
    sudo mkdir -p /mnt/nfsfolder
    echo -e "\e[92m80% completed\e[0m"
    sleep 2
    sudo chmod 777 /mnt/nfsfolder
    echo -e "\e[92m100% completed\e[0m"
    sleep 3
    sudo cp -r ./etc/exports/
    echo -e "\e[92minstall completed successfull\e[0m"
    sleep 3
    n_display
}
n_nfs () {
    clear
    echo -e "\e[32mwait for starting NFS.....\e[0m"
    sleep 5
    sudo systemctl enable nfs-kernel-server
    #sudo systemctl restart nfs-kernel-server
    echo -e "\e[32mNFS server started successfully..\e[0m"
    sleep 5
    n_display
}
n_inf () {
   clear

   echo -e "\t\t\t\e[95mSAMBA server info"
   echo -e "\t\t\t\e[95m-----------------"
   echo
   echo
   echo -ne "\e[96mYour client ip: "
   hostname -I
   echo -e "\e[34mSAMBA shared folder default path = /srv/samba/share"
   echo -e "\e[92mValid root user=atik\e[0m"
   echo -e "\e[92mValid root pass=atik2356\e[0m"
   echo
   echo
   echo -e "\e[101mN.B:Valid root user has read and write all permission\e[0m"
   i=30
   echo
   echo
   while [ $i -gt 0 ]
   do
   echo -ne "Display remainning for $i seconds"\\r
   i=`expr $i - 1`
   sleep 1
   done
   n_display
}
n_status () {
    clear
    echo -e "\e[32mchecking status.....\e[0m"
    sleep 3
    sudo systemctl status nfs-kernel-server
    echo -e "\e[32mSAMBA server checking successfully..\e[0m"
    sleep 3
    n_display
}


#DHCP server setup
#-----------------

display () {
     clear
     echo -e "\t\t\t\e[34mAutomated DHCP server setup\e[0m"
     echo -e "\t\t\t\e[34m---------------------------\e[0m"
     echo
     echo

     echo "1.Install and configure dhcp"
     echo "2.Start dhcp server"
     echo "3.To see assigned IP"
     echo "4.Back"
     echo "5.Exit"
     echo
     echo "Enter Your choice: "
     read n
     
     case $n in
          1)
          instal ;;
          
          2)
          s_dhcp ;;
           
          3)
          see_ip ;;

          4)
          m_display ;;

          5)
          clear
          exit ;;
          
          *)
          clear
          echo -e "\e[5m\e[91mYou entered incorrect number!\e[0m\e[0m"
          sleep 3
          display ;;
       esac
     
}
instal () {
    clear
    sudo apt-get update
    sudo apt-get install isc-dhcp-server
    echo -e "\e[32m50% completed\e[0m"
    sleep 3
    sudo cp -r ./files/isc-dhcp-server /etc/default/
    echo -e "\e[32m80% completed\e[0m"
    sleep 2
    sudo cp -r ./files/dhcpd.conf /etc/dhcp/
    echo -e "\e[32m100% completed\e[0m"
    sleep 3
    echo -e "\e[32minstall completed successfull\e[0m"
    sleep 3
    display
}
s_dhcp () {
   clear
   echo -e "\e[32mwait for starting dhcp.....\e[0m"
   sleep 3
   sudo service isc-dhcp-server start
   echo -e "\e[32mdhcp server started successfully..\e[0m"
   sleep 3
   display
}
see_ip () {
  clear
  sudo tail /var/log/syslog
  i=60
  echo
  echo
  while [ $i -gt 0 ]
  do
  echo -ne "Display remainning for $i seconds"\\r
  i=`expr $i - 1`
  sleep 1
  done
  display
}


#APACHE2 server setup
#--------------------


disp () {
   clear
   echo -e "\t\t\t\e[34mAutomated APACHE2 server setup\e[0m"
   echo -e "\t\t\t\e[34m------------------------------\e[0m"
   echo
   echo

   echo "1.Install apache2 server"
   echo "2.Start apache2 web-server"
   echo "3.Open apache2 in your browser"
   echo "4.Back"
   echo "5.Exit"
   echo
   echo "Enter your choice: "
   read n
   case $n in
     1)
    ins ;;

    2)
    ip ;;

    3)
    br ;;

    4)
   m_display ;;

    5)
   clear
   exit ;;

    *)
    clear
    echo -e "\e[5m\e[91mYou entered incorrect number!\e[0m\e[0m"
    sleep 3
    disp ;;
    esac
}
ins () {
   clear
   sudo apt-get update
   sudo apt install apache2
   echo -e "\e[32minstall completed successfull\e[0m"
   sleep 3
   disp
}
ip (){
  clear
  sudo /etc/init.d/apache2 restart
  echo
  echo
  echo -e "\e[32mAPACHE2 server started successfully..\e[0m"
  sleep 4
  disp
}
br (){
  clear
  echo -e "\e[32mWait for starting apache2 in your browser..\e[0m"
  sleep 3
  xdg-open http://127.0.0.1
  clear
  sleep 4
  echo -e "\e[32mSUCCESSFULL..\e[0m"
  sleep 4
  disp
}


#FTP server setup
#-----------------

f_display () {
     clear
     echo -e "\t\t\t\e[94mAutomated FTP server setup\e[0m"
     echo -e "\t\t\t\e[94m----------------------------\e[0m"
     echo
     echo
     echo "1.Install and configure FTP"
     echo "2.Start FTP server"
     echo "3.See FTP server Info"
     echo "4.Back"
     echo "5.Exit"
     echo
     echo "Enter Your choice: "
     read n
     
     case $n in
          1)
          f_install
          ;;
          
          2)
          f_ftp
          ;;
           
          3)
          f_inf
          ;;

          4)
          m_display
          ;;
          
          5)
          clear
          exit
          ;;
          
          *)
          clear
          echo -e "\e[5m\e[91mYou entered incorrect number!\e[0m\e[0m"
          sleep 3
          f_display ;;
       esac
     
}
f_install () {
    clear
    sudo apt-get update
    sudo apt install vsftpd
    echo -e "\e[32m50% completed\e[0m"
    sleep 3
    sudo mkdir -p /home/ftpuser/share
    echo -e "\e[32m80% completed\e[0m"
    sleep 2
    sudo chmod 777 /home/ftpuser/share
    echo -e "\e[32m100% completed\e[0m"
    sleep 3
    echo -e "\e[32minstall completed successfull\e[0m"
    sleep 3
    f_display
}
f_ftp () {
    clear
    echo -e "\e[32mwait for starting FTP.....\e[0m"
    sleep 3
    sudo systemctl restart vsftpd
    echo -e "\e[32mFTP server started successfully..\e[0m"
    sleep 3
    f_display
}
m_display
}
#s_status () {
  #  clear
   # echo -e "\e[32mchecking status.....\e[0m"
    #sleep 3
    #sudo systemctl status smbd
    #echo -e "\e[32mSAMBA server checking successfully..\e[0m"
    #sleep 3
    #f_display



	
	#echo -e "\nWelcome! You are Sucessfull login\n"
else
	echo -e "\nUnsuccessful login\n"
fi
}
login
