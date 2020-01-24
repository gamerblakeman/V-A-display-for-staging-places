##Usb Check and mount (/media/usb/) and coppy and mkae files smaller#
sudo sh /Display/usb.sh
#Start Main #
cd /film
clear
while true; do
for file in *
do
        #test if it is a jpg or png#
        vido="mp4"
        testseqw="JPG"
        testseq="jpg"
        testseqq="png"
        #to have more than 100 files change this and 'sudo rmdir /film/100' then 'sudo mkdir /film/noumber in endfile veriable'#
        endfile="100"
        if [[ $file =~ $testseq ]];
        then
                pic="$pic $file"
                #fbi -a -t 15 -1 --noverbose $file#
                #clear#
        else
                if [[ $file =~ $testseqq ]];
                then
                        pic="$pic $file"
                        #fbi -a -t 15 -1 --noverbose $file#
                        #clear#
                #push though ffplay if not#
                else
                        if [[ $file == $endfile ]];
                        then
                                fbi -t 15 -1 --noverbose --autodown $pic > /dev/null 2>&1
                                clear
                                pic=""
                        else
                                if [[ $file =~ $testseqw ]];
                                then
                                        pic="$pic $file"
                                elif [[ $file =~ $vido ]];
                                then
                                        fbi -t 15 -1 --noverbose --autodown $pic > /dev/null 2>&1
                                        omxplayer $file > /dev/null 2>&1
                                        pic=""
                                fi
                        fi
                fi
        fi
done
done