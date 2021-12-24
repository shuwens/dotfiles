#!/bin/bash

# this is because python3.10 is in core
#
# https://www.reddit.com/r/archlinux/comments/rfj0av/global_problem_with_python_310/
# https://www.reddit.com/r/archlinux/comments/rf6c84/psa_python_310_is_in_core_rebuild_your_aur/

pacman -Qoq /usr/lib/python3.9 | yay -S - --rebuild
