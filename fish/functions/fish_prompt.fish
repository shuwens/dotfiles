function fish_prompt
  set_color white
  echo -n "["(date "+%H:%M")"] "
  set_color yellow
  echo -n (whoami)
  set_color normal
  echo -n '@'
  set_color blue
  echo -n (hostname)" "
  set_color green
  echo -n (pwd | sed "s_$HOME""_~_")""
  set_color brown
  printf '%s ' (__fish_git_prompt)
  set_color red
  if [ (whoami) = "root" ]
    echo -n '# '
  else
    echo -n '$ '
  end
  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end
  set_color normal
end
