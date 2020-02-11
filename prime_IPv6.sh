#!/usr/bin/env bash

#:: Kabberry team
#:: Copyright // 2019-01-01
#:: Version: v3.0
#:: Tested on Ubuntu 18.04 & Ubuntu 16.04
cat << "PSC"





  _____   _____  _____   ___    ____     _____ ______ _______ _    _ _____  
 |  __ \ / ____|/ ____| |__ \  |___ \   / ____|  ____|__   __| |  | |  __ \ 
 | |__) | (___ | |         ) |   __) | | (___ | |__     | |  | |  | | |__) |
 |  ___/ \___ \| |        / /   |__ <   \___ \|  __|    | |  | |  | |  ___/ 
 | |     ____) | |____   / /_ _ ___) |  ____) | |____   | |  | |__| | |     
 |_|    |_____/ \_____| |____(_)____/  |_____/|______|  |_|   \____/|_|     
                                                                            
                                                                            
                                                                              
 
 
PSC

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo $(date)
echo ""
echo "Good day. This is automated cold masternode setup for Kabberry project. Auto installer was tested on specific environment. Don't try to install masternode with undocumented operating system!"
echo ""
echo "Installation content:"
echo "kabberry core v3.0"
echo
echo "Setup can be launched"
echo "Do you agree?"
echo -e "${GREEN}(y)es${NC}/${RED}(n)o"${NC}?
read agree
            if [ "$agree" != "y" ]; then
               echo "Setup canceled" && exit 1
            fi
OS_version=$(cat /etc/lsb-release | grep -c bionic)
OS_version2=$(cat /etc/lsb-release | grep -c xenial)
            if [ "$OS_version" -ne "1" ]; then
                    echo ""
			echo -e "${RED}Looks like your OS version is not Ubuntu 18.04 Bionic //${GREEN} Maybe Ubuntu 16.04 Xenial? - Checking...${NC}"

                        if [ "$OS_version2" -eq "1" ]; then
                                echo ""
                        else
                                echo ""
                                echo -e "${RED}Looks like your OS version is not Ubuntu 16.04 Xenial or Ubuntu 18.04 Bionic${NC}" && exit 1
                        fi
            fi
sudo apt-get update -y
if [ $? -ne "0" ]; then echo -e "${RED}Cannot update ubuntu repos${NC}" && exit 1; fi
sudo apt-get install software-properties-common -y 1> /dev/null
if [ $? -ne "0" ]; then echo -e "${RED}Unable to install software-properties-common${NC}" && exit 1; fi
sudo add-apt-repository universe -y 1> /dev/null
if [ $? -ne "0" ]; then echo -e "${RED}Unable to add repository universe${NC}" && exit 1; fi
sudo apt-get install dnsutils jq curl -y 1> /dev/null
if [ $? -ne "0" ]; then echo -e "${RED}Unable to install dnsutils jq curl${NC}" && exit 1; fi
echo ""
wanipv6=$(curl -s 6.ipquail.com/ip)
if [ -z "${wanipv6}" ]; then
    echo -e "${RED}Sorry, we don't know your external IPv6 addr${NC}" && echo ""
    echo -e "${GREEN}Input your IPv6 addr manually:${NC}" && read wanipv6
fi
echo "Your external IPv6 is $wanipv6 y/n?"
read wan
            if [ "$wan" != "y" ]; then
               echo -e "${RED}Sorry, we don't know your external IPv6 addr${NC}" && exit 1
            fi
# Check install or update for Bionic //
[ -f /etc/apt/sources.list.d/bitcoin-ubuntu-bitcoin-bionic.list ]
            if [ "$?" -eq "0" ]; then
                    echo ""
                    echo -e "Looks like you are trying to setup second time? You need fresh ${GREEN}(i)nstall${NC} or ${RED}(u)pdate${NC} your MN?"
					echo -e "${GREEN}i${NC}/${RED}u"${NC}?
					read setorupd
					if [ "$setorupd" = "u" ]; then
					sudo systemctl stop kabberrycore &&
					echo -e "${GREEN}1/5 Kabberry service is stopped${NC}" &&
					cd /usr/bin &&
					sudo rm -fr kabberry-cli kabberryd &&
					cd ~ &&
					rm -fr kabberry-cli kabberryd kabberry-tx kabberry_linux.zip &&
					echo -e "${GREEN}2/5 Old Kabberry wallet is deleted${NC}" &&
					wget https://github.com/KABBERRY/Kabberry-Coin/releases/download/v3.0/kabberry_linux.zip &&
					echo -e "${GREEN}3/5 Kabberry wallet is downloaded${NC}" &&
					unzip -o kabberry*.zip &&
					sudo cp -fr kabberry-cli kabberryd /usr/bin/ &&
					rm -fr kabberry-cli kabberryd kabberry-tx kabberry-qt kabberry_linux.zip &&
					cd /usr/bin &&
					chmod -R 755 kabberry-cli kabberryd &&
					cd ~ &&
					echo -e "${GREEN}4/5 Kabberry wallet is updated${NC}" &&
					sudo systemctl start kabberrycore &&
					echo -e "${GREEN}5/5 Kabberry service is started${NC}" &&
					echo -e "${GREEN}Update is full completed.${NC}" && exit 1; fi
					if [ "$setorupd" = "i" ]; then
					sudo systemctl stop kabberrycore &&
					echo "" &&
					echo -e "${GREEN}Setup Kabberry masternode started${NC}" &&
					sleep 5
					else
					echo "" &&
					echo -e "${RED}Sorry, we cannot continue${NC}" && exit 1;   fi
			fi
			
			
# Check install or update for Xenial //
[ -f /etc/apt/sources.list.d/bitcoin-ubuntu-bitcoin-xenial.list ]
            if [ "$?" -eq "0" ]; then
                    echo ""
                    echo -e "Looks like you are trying to setup second time? You need fresh ${GREEN}(i)nstall${NC} or ${RED}(u)pdate${NC} your MN?"
					echo -e "${GREEN}i${NC}/${RED}u"${NC}?
					read setorupd
					if [ "$setorupd" = "u" ]; then
					sudo systemctl stop kabberrycore &&
					echo -e "${GREEN}1/5 Kabberry service is stopped${NC}" &&
					cd /usr/bin &&
					sudo rm -fr kabberry-cli kabberryd &&
					cd ~ &&
					rm -fr kabberry-cli kabberryd kabberry-tx kabberry_linux.zip &&
					echo -e "${GREEN}2/5 Old Kabberry wallet is deleted${NC}" &&
					wget https://github.com/KABBERRY/Kabberry-Coin/releases/download/v3.0/kabberry_ubuntu_16.zip &&
					echo -e "${GREEN}3/5 Kabberry wallet is downloaded${NC}" &&
					unzip -o kabberry*.zip &&
					sudo cp -fr kabberry-cli kabberryd /usr/bin/ &&
					rm -fr kabberry-cli kabberryd kabberry-tx kabberry-qt kabberry_ubuntu_16.zip &&
					cd /usr/bin &&
					chmod -R 755 kabberry-cli kabberryd &&
					cd ~ &&
					echo -e "${GREEN}4/5 Kabberry wallet is updated${NC}" &&
					sudo systemctl start kabberrycore &&
					echo -e "${GREEN}5/5 Kabberry service is started${NC}" &&
					echo -e "${GREEN}Update is full completed.${NC}" && exit 1; fi
					if [ "$setorupd" = "i" ]; then
					sudo systemctl stop kabberrycore &&
					echo "" &&
					echo -e "${GREEN}Setup Kabberry masternode started${NC}" &&
					sleep 5
					else
					echo "" &&
					echo -e "${RED}Sorry, we cannot continue${NC}" && exit 1;   fi
            
			fi
if [ "$OS_version" -eq "1" ]; then
# Install dep. for Bionic //
        sudo add-apt-repository ppa:bitcoin/bitcoin -y
	if [ $? -ne "0" ]; then echo "Unable to add bitcoin dependencies" && exit 1; fi
        sudo apt-get update -y
	if [ $? -ne "0" ]; then echo "Cannot update ubuntu repos" && exit 1; fi
        sudo apt-get install -y libdb4.8-dev libdb4.8++-dev
	if [ $? -ne "0" ]; then echo "Unable to install libdb dependencies" && exit 1; fi
        sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils software-properties-common libminiupnpc-dev libcrypto++-dev libboost-all-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libboost-filesystem-dev libboost-thread-dev libssl-dev libssl-dev software-properties-common unzip libzmq3-dev ufw wget git python-openssl -y
		if [ $? -ne "0" ]; then echo "Unable to install major dependencies" && exit 1; fi
		sudo wget https://github.com/KABBERRY/MN-Script-IPv4/raw/master/libs.zip
		unzip -o libs.zip
		sudo cp -fr libboost_filesystem.so.1.58.0 libboost_chrono.so.1.58.0 libboost_program_options.so.1.58.0 libboost_system.so.1.58.0 libboost_thread.so.1.58.0 libminiupnpc.so.10 libevent_core-2.0.so.5 libevent_pthreads-2.0.so.5 libevent-2.0.so.5 /usr/lib/
		rm -fr libboost_filesystem.so.1.58.0 libboost_chrono.so.1.58.0 libboost_program_options.so.1.58.0 libboost_system.so.1.58.0 libboost_thread.so.1.58.0 libminiupnpc.so.10 libevent_core-2.0.so.5 libevent_pthreads-2.0.so.5 libevent-2.0.so.5 libs.zip
        if [ $? -ne "0" ]; then echo "Unable to install libboost dependencies" && exit 1; fi
        else
# Install dep. for Xenial //		
        sudo add-apt-repository ppa:bitcoin/bitcoin -y
        if [ $? -ne "0" ]; then echo "Unable to add bitcoin dependencies" && exit 1; fi
        sudo apt-get update -y
        if [ $? -ne "0" ]; then echo "Cannot update ubuntu repos" && exit 1; fi
        sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
        if [ $? -ne "0" ]; then echo "Unable to install libdb dependencies" && exit 1; fi
        sudo apt-get install libboost-system1.58-dev libboost-system1.58.0 -y
        if [ $? -ne "0" ]; then echo "Unable to install libboost dependencies" && exit 1; fi
        sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-pthreads-2.0-5 libevent-dev bsdmainutils software-properties-common libminiupnpc-dev libcrypto++-dev libboost-all-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libboost-filesystem-dev libboost-thread-dev libssl-dev libssl-dev software-properties-common unzip libzmq3-dev ufw wget git python-openssl -y
        if [ $? -ne "0" ]; then echo "Unable to install major dependencies" && exit 1; fi
        fi
# Download Kabberry sources //
echo ""
echo -e "${GREEN}1/6 Downloading Kabberry sources...${NC}" 
echo ""
cd /usr/bin
sudo rm -fr kabberry-cli kabberryd
cd ~/.kabberry
rm -R -fr database .lock peers.dat blocks db.log masternode.conf kabberry.conf zerocoin budget.dat debug.log mncache.dat kabberryd.pid chainstate fee_estimates.dat mnpayments.dat sporks
cd ~
rm -fr kabberry*.zip
rm -R -fr kabberry_linux

            if [ "$OS_version" -eq "1" ]; then
                wget https://github.com/KABBERRY/Kabberry-Coin/releases/download/v3.0/kabberry_linux.zip
		if [ $? -ne "0" ]; then echo "Failed to download kabberryd binary" && exit 1; fi
            elif [ "$OS_version2" -eq "1" ]; then
                wget https://github.com/KABBERRY/Kabberry-Coin/releases/download/v3.0/kabberry_ubuntu_16.zip
		if [ $? -ne "0" ]; then echo "Failed to download kabberryd binary" && exit 1; fi
            fi
# Manage coin daemon and configuration //
unzip -o kabberry*.zip
echo ""
sudo cp -fr kabberry-cli kabberryd /usr/bin/
rm -fr kabberry-cli kabberryd kabberry-tx kabberry-qt kabberry_linux.zip kabberry_ubuntu_16.zip
cd /usr/bin
chmod -R 755 kabberry-cli kabberryd
cd ~
mkdir -p ~/.kabberry/
touch ~/.kabberry/kabberry.conf
cat << EOF > ~/.kabberry/kabberry.conf
rpcuser=kabberryuser
rpcpassword=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 ; echo '')
txindex=1
kabberrystake=1
rpcport=34126
listen=1
port=34124
rpcallowip=127.0.0.1
daemon=1
masternode=1
addnode=77.55.217.107
addnode=89.65.101.63
addnode=77.55.216.249

EOF

#Create kabberrycore.service
echo -e "${GREEN}2/6 Create kabberrycore.service for systemd${NC}"
echo ""
echo \
"[Unit]
Description=Kabberry Core Wallet daemon & service
After=network.target

[Service]
User=root
Type=forking
ExecStart=/usr/bin/kabberryd -daemon -pid=$(echo $HOME)/.kabberry/kabberryd.pid --datadir=$(echo $HOME)/.kabberry/
PIDFile=$(echo $HOME)/.kabberry/kabberryd.pid
ExecStop=/usr/bin/kabberry-cli stop
Restart=always
RestartSec=3600
TimeoutStopSec=60s
TimeoutStartSec=10s
StartLimitInterval=120s
StartLimitBurst=5

[Install]
WantedBy=default.target" | sudo tee /etc/systemd/system/kabberrycore.service

sudo chmod 664 /etc/systemd/system/kabberrycore.service

sudo systemctl enable kabberrycore

real_user=$(echo $USER) 

sudo chown -R $real_user:$real_user $(echo $HOME)/.kabberry/

# Check if user is root? If not create sudoers files to manage systemd services
echo ""
echo -e "${GREEN}3/6 Check if user is root? If not create sudoers files to manage systemd services${NC}"
if [ "$EUID" -ne 0 ]; then
sudo echo \
"%$real_user ALL= NOPASSWD: /bin/systemctl start kabberrycore
%$real_user ALL= NOPASSWD: /bin/systemctl stop kabberrycore
%$real_user ALL= NOPASSWD: /bin/systemctl restart kabberrycore" | sudo tee /tmp/$real_user
sudo mv /tmp/$(echo $real_user) /etc/sudoers.d/
fi

# Start kabberry daemon, wait for wallet creation //
sudo systemctl start kabberrycore &&
echo "" ; echo "Please wait for few minutes..."
sleep 120 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
echo ""
sudo systemctl stop kabberrycore &&
echo ""
echo -e "Shutting down daemon, reconfiguring kabberry.conf, we want to know your cold wallet ${GREEN}createmasternodekey${NC} (example: 887Bmc8UCAuvttkt3vhFgiWCd2P6NqFpyrQZSTYbrkLpNZ1LjCL), please input now:"
echo""
read createmasternodekey
privkey=$(echo $createmasternodekey)
checkpriv_key=$(echo $createmasternodekey | wc -c)
if [ "$checkpriv_key" -ne "52" ];
then
	echo ""
	echo "Looks like your $privkey is not correct, it should cointain 52 symbols, please paste it one more time"
	read createmasternodekey
privkey=$(echo $createmasternodekey)
checkpriv_key=$(echo $createmasternodekey | wc -c)

if [ "$checkpriv_key" -ne "52" ];
then
        echo "Something wrong with createmasternodekey, cannot continue" && exit 1
fi
fi
echo ""
echo "Give some time to shutdown the wallet..."
echo ""
sleep 60 &
PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
cat << EOF > ~/.kabberry/kabberry.conf
rpcuser=kabberryuser
rpcpassword=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 ; echo '')
txindex=1
kabberrystake=1
rpcport=34126
listen=1
port=34124
rpcallowip=127.0.0.1
daemon=1
masternode=1
masternodeaddr=[$wanipv6]
createmasternodekey=$privkey
addnode=77.55.217.107
addnode=89.65.101.63
addnode=77.55.216.249

EOF

# Firewall //
echo -e "${GREEN}4/6 Update firewall rules${NC}"
echo ""
echo "Update firewall rules"
sudo /usr/sbin/ufw limit ssh/tcp comment 'Rate limit for openssh server' 
sudo /usr/sbin/ufw allow 34124/tcp comment 'Kabberry Wallet daemon'
sudo /usr/sbin/ufw --force enable
echo ""

# Fast download Blockchain
cd ~
cd .kabberry
rm -R blocks chainstate
echo ""
echo -e "${GREEN}5/6 please wait, installation script downloads Kabberry blockchain ${NC}"
echo ""
wget https://github.com/KABBERRY/Kabberry-Coin/releases/download/v3.0/kabberry-blockchain.zip
unzip -o kabberry-blockchain.zip
rm -f  kabberry-blockchain.zip

# Final start
echo ""
echo -e "${GREEN}6/6 Masternode config done, Kabberry wallet installed - starting again${NC}"
echo ""
sudo systemctl start kabberrycore
echo -e "${RED}The blockchain is syncing from scratch. You have to wait few hours to sync all the blocks!${NC}"
echo ""
echo "Setup summary:"
echo "Masternode privkey: $privkey"
echo "Your external IPv6 addr: $wanipv6"
echo "Installation log: ~/kabberry_masternode_installation.log"
echo "Kabberry Core datadir: "$(echo $HOME/.kabberry/)""
echo ""
echo -e "Need additional help? Please visit Kabberry Discord channel: ${GREEN}https://discord.gg/D6KeMSA${NC}"
echo ""
kabberry-cli getinfo | grep blocks
