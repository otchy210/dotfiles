function conv-movie(){
    ffmpeg -i "$1" -pix_fmt yuv420p "$2"
}

function conv-movie-mp4(){
    conv-movie "$1" "${1}_updated.mp4"
}

function conv-movie-deinterlace(){
    ffmpeg -i "$1" -vf bwdif=0:-1:1 -c:v libx264 "$2"
}

function conv-movie-deinterlace-vhs(){
    ffmpeg -i "$1" -vf w3fdif -pix_fmt yuv420p "$2"
}

function conv-movie-small-gif(){
    #ffmpeg -i $1 -vf scale=640:-1 -r 15 $2
    ffmpeg -i "$1" -filter_complex "[0:v] fps=15,scale=640:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" "$2"
}

function concat-movies(){
    ffmpeg -safe 0 -f concat -i $1 -c copy $2
}

export PATH=$DOT_ROOT/mac-common/ffmpeg-bin:$PATH
