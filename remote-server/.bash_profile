export PATH
export PATH=/usr/local/bin:$PATH
export TERM=xterm

# If not running interactively, don't do anything
case $- in
*i*) source ~/.bashrc.jon;;
*) source ~/.bashrc.def;;
esac
