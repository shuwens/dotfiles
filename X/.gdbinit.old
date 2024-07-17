set history save

# python
# import sys, os
# libstdcxx_path = os.path.expanduser("~/sys/dotfiles/gdb/python")
# if os.path.isdir(libstdcxx_path):
#   sys.path.insert(0, libstdcxx_path)
#   from libstdcxx.v6.printers import register_libstdcxx_printers
#   register_libstdcxx_printers (None)
# else:
#   print("libstdcxx pretty-printers not found")
# del libstdcxx_path
# end

python
class Resize(gdb.Command):
  def __init__(self):
    super(Resize, self).__init__("resize", gdb.COMMAND_SUPPORT)

  def invoke(self, arg, from_tty):
    import subprocess
    p = subprocess.Popen(["stty", "size"], stdout=subprocess.PIPE,
                         universal_newlines=True)
    size = p.stdout.read().split()
    if not p.wait():
      gdb.execute("set height " + size[0])
      gdb.execute("set width " + size[1])
Resize()
end

define hook-stop
  resize
end

source ~/git/dotfiles/gdb/hex.py
source ~/git/dotfiles/gdb/qreg.py

add-auto-load-safe-path /home/jethro/r/sv6/.gdbinit

# Color prompt. Text in \[...\] is not counted toward the prompt length.
set extended-prompt \[\e[0;1;31m\](gdb) \[\e[0m\]

source ~/git/dotfiles/gdbinit.py

## pleton gdb setup

# We have scroll bars in the year 2015!  
set pagination off

# Attach to both parent and child on fork  
set detach-on-fork off

# Stop/resume all processes  
set schedule-multiple on

# Usually don't care about these signals  
handle SIGUSR1 noprint nostop
handle SIGUSR2 noprint nostop

# Ugly hack so we don't break on process exit  
python gdb.events.exited.connect(lambda x: [gdb.execute('inferior 1'), gdb.post_event(lambda: gdb.execute('continue'))])
