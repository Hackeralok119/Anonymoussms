#!/bin/bash
NC='\033[0m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'

function banner(){
echo -e ${RED}"##########################################################"                                                    
echo -e ${CP}"     _____     _             ____  __  __ ____           #"    
echo -e ${CP}"    |  ___|_ _| | _____     / ___||  \/  / ___|          #"
echo -e ${CP}"    | |_ / _  | |/ / _ \____\___ \| |\/| \___ \          #"
echo -e ${CP}"    |  _| (_| |   <  __/_____|__) | |  | |___) |         #"
echo -e ${CP}"    |_|  \__,_|_|\_\___|    |____/|_|  |_|____/          #"
echo -e ${BLUE}"                                                         #"
echo -e ${BLUE}"      A Small Tool To Send Messages Anonymously          #"
echo -e ${RED}"   WARNING: Use this Tool Only For Educational Purpose   #"
echo -e ${RED}"             I Will Not Be Responsible For Your Shit     #"
echo -e ${YELLOW}"            Coded By: Machine404                         #"
echo -e ${GREEN}"             https://facebook.com/unknownclay            #"
echo -e ${RED}"##########################################################"
   
}
resize -s 38 70 > /dev/null
function dependencies(){
echo -e ${PINK}
cat /etc/issue.net


echo "Checking dependencies configuration " 
sleep 1
if [[ "$(ping -c 1 8.8.8.8 | grep '100% packet loss' )" != "" ]]; then
  echo ${RED}"No Internet Connection"
  exit 1
  else
  echo -e ${GREEN} "\n[ ✔ ] Internet.............${GREEN}[ working ]"
fi
sleep 1
which curl > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] curl.............${GREEN}[ found ]"
else
echo -e $red "[ X ] curl  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing curl "
sudo apt-get install curl
echo -e ${BLUE} "[ ✔ ] Done installing ...."
fi
sleep 1
which git > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] git.............${GREEN}[ found ]"
else
echo -e $red "[ X ] git  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing git "
pkg update && pkg upgrade  > /dev/null 2>&1
pkg install git > /dev/null 2>&1
echo -e ${BLUE} "[ ✔ ] Done installing ...."
which git > /dev/null 2>&1
sleep 1
fi
sleep 1
}

function printmsg(){
echo  -e ${RED}" Exiting FAKE-SMS SENDER... "
sleep 1
echo -e ${ORANGE}" See You Next Time............."
exit
}

function instruction(){

echo -e ${YELLOW}"\n1. Your Country Code Must Be without "+"\n"
sleep 0.5
echo -e ${BLUE}"2. Country Code Example: 92\n"
sleep 0.5
echo -e ${ORANGE}"3. Your Phone Number Must be Start Without 0\n"
sleep 0.5
echo -e ${CNC}"4. Full Usage: 923443210111\n"
sleep 0.5
echo -e ${RED}" ..........NOTE: Only One Text Message Is Allowed Per Day...........\n"
sleep 0.5
echo -e -n ${BLUE}"\nBack to SENDSMS OPTION: [y/n]: "
read back_press
if [ $back_press = "y"  ]; then
         SENDSMS
elif [ $back_press = "n" ]; then
              exit
     fi


}

function SENDSMS() {
    clear
    banner
    echo ""
   echo -e ${ORANGE}"Enter Phone Number with County Code like (923441212012)\n"
   echo -e -n ${CP}"Enter Phone Number With Country Code: "
   
   read num
   
   echo "  "
   echo -e -n ${BLUE}"Enter Your Message: "
   
   read msg


   SMSVERIFY=$(curl -# -X POST https://textbelt.com/text --data-urlencode phone="$num" --data-urlencode message="$msg" -d key=textbelt)
   
   if grep -q true <<<"$SMSVERIFY"
   
   then
      
      echo "  "
      echo -e ${CNC}" .....SUCCESS "
      echo "  "
      echo -e ${CNC}" ---------------------------------------------- "
      echo "$SMSVERIFY"
      echo -e ${CNC}" ---------------------------------------------- "
      echo "  "
      printmsg
   else
      
      echo "  "
      echo -e ${RED}" FAIL "
      echo "  "
      echo -e ${CNC}" ---------------------------------------------- "
      echo "$SMSVERIFY"
      echo -e ${CNC}" ---------------------------------------------- "
      echo " "
      printmsg
   fi
}
function STATUSCHECK(){
echo -e -n ${ORANGE}"\nEnter Text ID (e.g 123456): "
read ID
STATUSCONFIRM=$(curl -# https://textbelt.com/status/"$ID")
echo -e ${PINK}" Final Response (JSON): "
   echo " "
   echo -e ${PINK}" ---------------------------------------------- $NC"
   echo "$STATUSCONFIRM"
   echo -e ${PINK}"------------------------------------------------- $NC"
}
trap ctrl_c INT
ctrl_c() {
clear
echo -e ${RED}"[*] (Ctrl + C ) Detected, Trying To Exit... "
echo -e ${RED}"[*] Stopping Services... "
sleep 1
echo ""
echo -e ${YELLOW}"[*] Thanks For Using Fake-SMS  :)"
exit
}


menu(){

clear
dependencies
clear
banner


echo -e " \n${NC}[${CG}"1"${NC}]${CNC} SEE USAGE "
echo -e "${NC}[${CG}"2"${NC}]${CNC} Send Fake SMS"
echo -e "${NC}[${CG}"3"${NC}]${CNC} CHECK SMS STATUS "
echo -e "${NC}[${CG}"4"${NC}]${CNC} EXIT "
echo -n -e ${RED}"\n[+] Select: "
read play
   if [ $play -eq 1 ]; then
          instruction
   elif [ $play -eq 2 ]; then
          SENDSMS
   elif [ $play -eq 3 ]; then
          STATUSCHECK
   elif [ $play -eq 4 ]; then
          exit
         
      fi
}
menu
#coded by Machine404 Don't copy this code without giving me credit.
