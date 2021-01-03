# shell script for MySQL installed as `brew install mysql@5.6`

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

alias start-mysql='brew services start mysql@5.6'
alias stop-mysql='brew services stop mysql@5.6'
