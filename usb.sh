if ls /dev/sd*1 > james.txt; then
        echo "james"
        sudo mount /dev/sd*1 /media/usb
        rm /film/*
        sudo sh cp.sh
else
        echo "false"
fi
rm james.txt