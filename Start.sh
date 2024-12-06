##Usb Check and mount (/media/usb/) and coppy and mkae files smaller#
cd /Display/ # go to directory with scripts
sudo sh /Display/usb.sh # run USB Detection script
cd /film #Move to /film directory to start prosessing
clear #clear sceen
countP=0 #resets count
countV=0 #resets count
one=2 #min files
vido="mp4"
testseqw="JPG"
testseq="jpg"
testseqq="png"
for file in *
do
        if [[ $file =~ $testseq ]]; #jpg anwser
        then
                countP=$(($countP+1))
                pic="$pic $file" #adds file name to end of pic veriable

        elif [[ $file =~ $testseqw ]]; #JPG anwser
        then
                countP=$(($countP+1))
                pic="$pic $file" #adds file name to end of pic veriable

        elif [[ $file =~ $testseqq ]]; #png Anwser
        then
                countP=$(($countP+1))
                pic="$pic $file" #adds file name to end of pic veriable

        elif [[ $file =~ $vido ]]; #if its an MP4
        then
                countV=$(($countV+1))
                vid="$file" #adds file name to end of pic veriable
        fi
        count=$(($count+1)) #get number of files
done

pic=""
if [ $count -eq $((2)) ]; #check if there is only 2 files (100 for end of files and photo / video)
then
        
        if [ $countV -eq $((1)) ]; #check if there is only 1 Photo or video
        then
                #run VLC in loop
                vlc --loop $file > /dev/null 2>&1 # Runs VLC
        elif [ $countV -eq $((0)) ]; #check if there is only 1 Photo or video
        then
                fbi --noverbose --autozoom $pic > /dev/null 2>&1
                #run FBI indefently
        fi
elif [ $countV -eq $((0)) ]; #check if there is only 1 Photo or video
then
        fbi -t 15 --noverbose --autozoom $pic > /dev/null 2>&1
        #run FBI indefently
else


while true; do
for file in *
do
        #test if it is a jpg or png#

        #to have more than 100 files change this and 'sudo rmdir /film/100' then 'sudo mkdir /film/noumber in endfile veriable'#
        endfile="100"
        if [[ $file =~ $testseq ]]; #jpg anwser
        then
                pic="$pic $file" #adds file name to end of pic veriable


        elif [[ $file =~ $testseqw ]]; #JPG anwser
        then
                pic="$pic $file" #adds file name to end of pic veriable

        elif [[ $file =~ $testseqq ]]; #png Anwser
        then
                pic="$pic $file" #adds file name to end of pic veriable

        elif [[ $file == $endfile ]]; # if its the end file then
        then
                fbi -t 15 -1 --noverbose --autozoom $pic > /dev/null 2>&1 # run FBI for the pics slected above
                clear # clears screen
                pic="" #resets pic veriable for next run
                
        elif [[ $file =~ $vido ]]; #if its an MP4
        then
                fbi -t 15 -1 --noverbose --autozoom $pic > /dev/null 2>&1 # runs all photos allready in loop
                vlc $file --play-and-exit > /dev/null 2>&1 # Runs VLC
                pic="" # resets the pic veriable
        fi
done
done
fi
