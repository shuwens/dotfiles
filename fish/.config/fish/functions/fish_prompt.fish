function fish_prompt
  set_color brblack
  echo -n "["(date "+%H:%M")"] "
  #set_color yellow
  #echo -n (whoami)
  #set_color normal
  set_color blue
  echo -n (hostname)
  if [ $PWD != $HOME ]
    set_color brblack
    echo -n ':'
	# set_color green
    #echo -n (basename $PWD)
    set_color yellow
    echo -n (prompt_pwd | sed "s_$HOME""_~_")""
end
set_color green
printf '%s ' (__fish_git_prompt)
set_color red
#echo -n '$ '
echo -n '| '
set_color normal
end
