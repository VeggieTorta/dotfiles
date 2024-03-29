

# Update: 02.28.21
# Purpose: Increasing my lazyness with wifi




pause 3
clear

echo """ Make your choice

    Clients on current network
    My ip address
    Mounted drives
    Update and Upgrade System
    Weather
    Geo location
    Wifi card name
    Connect to Wifi
    Gateway / router address
    Edit SourceList
    Wifi networks available
    Current network interface
    Systems temps
    DNS information
    Flush IP Address """

read $users_selection

case "$users_selection" in
"1)")
    Clients_on_current_network
    ;;

"2)")
    My_ip_address
    ;;

"4)")
    Mounted_drives
    ;;

"6)")
    Update_Upgrade_System
    ;;

"7)")
    Weather
    ;;

"8)")
    Geo_location
    ;;

"9)")
    Wifi_card_name
    ;;

"10)")
    Connect_to_Wifi
    ;;

"11)")
    Gateway_router_address
    ;;

"12)")
    Edit_Source_list
    ;;

"13)")
    Wifi_networks_available
    ;;

"14)")
    Current_network_interface
    ;;

"15)")
    Systems_temps
    ;;

"16)")
    #DNS_information
    #grep nameserver /etc/resolv.conf
    ;;

"17)")
    Flush_ip_address
    ;;

esac


DNS_information()
    {
    clear
    echo DNS server in linux is stored in /etc/resolv.conf
    grep nameserver /etc/resolv.conf
    menu_wifi
    }

Systems_temps()
    {
        #raspe/opt/vc/bin/vcgencmd measure_tempberry pi,
            # /opt/vc/bin/vcgencmd measure_temp

        #debian
            #sudo apt install lm-sensors
            sensors
            menu_wifi
    }

Current_network_interface()
    {
        nmcli d
        menu_wifi
    }

Wifi_networks_available()
    {
        nmcli d wifi
        nmcli -f "CHAN,BARS,SIGNAL,SSID" d wifi | sort -n
        menu_wifi
    }


Edit_Source_list()
    {
        sudo vim /etc/apt/sources.list
        menu_wifi
    }

Gateway_router_address()
    {
        ip route | grep default

        # alternative, $ sudo apt install net-tools
                    #  $ netstat -r -n
        menu_wifi
    }

Connect_to_Wifi()
    {
        # debian need apt-get install network-manager
            nmtui
        # if raspberrypi
            #raspi-config
        menu_wifi
    }

Wifi_card_name()
    {
        ls /sys/class/net
        menu_wifi
    }

Geo_location()
    {
        curl ipinfo.io/8.8.8.8
        wifi_menu

    }

Weather()
    {
        curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Hayward}"
        wifi_menu
    }

Update_Upgrade_System()
    {
        sudo apt-get update -y && sudo apt-get dist-upgrade -y && apt autoremove -y
        wifi_menu
    }


Mounted_drives()
    {
        sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL
        wifi_menu
    }

Clients_on_current_network()
    {
        if [ -x "$(command -v arp-scan)" ]
        then
            sudo arp-scan --localnet
            wifi_menu
        else
            # echo Woudl you like to install arp-scan
            # sudo apt install arp-scan -y

            # arp-scan --localnet
            echo arp-scan not found
            echo here is a less detailed option.
            ip neigh
            wifi_menu
        fi
    }

My_ip_address()
    {
    echo "Local IP address:"
    hostname -I
    echo ""

    echo "Public IP address:"
    if [ -x "$(command -v curl)" ]
    then
        curl https://ipinfo.io/ip
        echo ""
    elif [ -x "$(command -v wget)" ]
    then
        wget -qO- https://ipecho.net/plain ; echo \n
        echo ""
        ask_user
    else
        echo "curl or wget are needed, for a Public IP address, install (y/n)?"
        select yn in "Yes" "No"
        case $yn in
            Yy ) sudo apt install wget && curl -y ;;
            Nn ) ask_user;;
        esac
    fi
    }

Flush_ip_address()
    {
    # Multiple IP address showing for a system
    sudo ip addr flush dev eth0
    sudo ip addr flush dev wlan0
    wifi_menu

    }







