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

function conv-movie-smooth-gif(){
    #ffmpeg -i $1 -vf scale=640:-1 -r 15 $2
    ffmpeg -i "$1" -filter_complex "[0:v] fps=30,scale=640:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" "$2"
}

function concat-movies(){
    ffmpeg -safe 0 -f concat -i $1 -c copy $2
}

function cut-movie(){
    if [ "$#" -eq 0 ]; then
        echo "Usage: cut-movie mm:ss input.mp4"
        return 1
    fi
    ffmpeg -ss $1 -i "$2" -c copy "${2}_cut.mp4"
}

function cut-movie-last(){
    if [ "$#" -eq 0 ]; then
        echo "Usage: cut-movie-last mm:ss input.mp4"
        return 1
    fi
    ffmpeg -i ${2} -t ${1} -c copy "${2}_cut.mp4"
}

export PATH=$DOT_ROOT/mac-common/ffmpeg-bin:$PATH
