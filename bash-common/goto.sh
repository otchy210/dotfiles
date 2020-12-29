if [ -e ~/.gotocache ]; then
  rm -rf ~/.gotocache
fi
mkdir ~/.gotocache
if [ -e ~/.gotoconf ]; then
  params=""
  for line in `cat ~/.gotoconf | grep -v ^#`; do
    key=`echo ${line} | cut -d '=' -f 1`
    dir=`echo ${line} | cut -d '=' -f 2`
    params="${params} ${key}"
    echo ${dir} > ~/.gotocache/${key}
  done
  complete -W "${params}" goto
else
  complete -W "" goto
fi

goto(){
  if [ -e ~/.gotocache/${1} ]; then
    dir=`cat ~/.gotocache/${1}`
    cd ${dir}
  else
    cd ~
  fi
}
