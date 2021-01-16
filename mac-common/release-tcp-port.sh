function release-tcp-port(){
  PROCESS_IN_USE=`lsof -i tcp:$1 | grep -v "^COMMAND" | sed -E "s/.+ ([0-9]+) .+/\1/"`
  if [ -n "$PROCESS_IN_USE" ]; then
    kill $PROCESS_IN_USE
  fi
}
