cd /media/usb
if (ls  *.jpg); then
        for F in *.jpg
        do
            echo "$F"
            ffmpeg -i "$F" -q:v 10 "/film/$F"

        done
fi
if (ls *.JPG); then
        for F in *.JPG
        do
                ffmpeg -i "$F" -q:v 10 "/film/$F"
        done
fi
if (ls *.png); then

        for F in *.png
        do
                ffmpeg -i "$F" -q:v 10 "/film/$F"
        done
fi
if (ls *.mp4); then
        for F in *.mp4
        do
                cp "$F" /film/
        done
fi