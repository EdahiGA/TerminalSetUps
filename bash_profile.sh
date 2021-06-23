# >>>>>> EXPORTS:
# >>>    Environment
export HISTSIZE=5000

# # >>> Functions:
cdl()  { cd "$1" && ll ; }                           # Function to cd to the specified directory and list its content.
mkcd() { mkdir -p "$1" && cdl "$1" ; }               # Function to generate and access a directory (-p allows to work on already existing dirs)

# Sources:
alias     csource="cat ~/.bash_profile"              # Shortcut to see your profile
alias    dosource="source ~/.bash_profile "          # ''       '' run your profile     
alias     esource="nano ~/.bash_profile; dosource  " # ''       '' edit & run your profile

# Shorcuts
alias         gl1="ssh hpcana01.ghdna.io -X -Y "     # Shorcuts to access hpc
alias         gl3="ssh hpcana03.ghdna.io -X -Y "     # 
alias         gl4="ssh hpcana04.ghdna.io -X -Y "     # 
alias         qqq="exit"                             # Skyrim shortcut?

alias         cd1="cd .."                            # Shortcuts for easier folder navigation
alias         cd2="cd ../.."                         # 
alias         cd3="cd ../../.."                      # 
alias         cd4="cd ../../../.. "                  # 
alias        cd1l="cd .. && ll"                      # ditto plus folder content shown
alias        cd2l="cd ../.. && ll"                   #
alias        cd3l="cd ../../.. && ll"                #
alias        cd4l="cd ../../../.. && ll "            #

alias         cln="clear ; clear ; "                 # Clean screen
alias         clc="cln cat "                         # Clean screen & show document
alias         cll="cln ll "                          # Clean screen and show folder content

alias         c2t="tr ',' '\t' "                     # Handy comma to tab
alias         c2n="tr ',' '\n' "                     # Handy comma to NewLine

alias   DeepTouch="touch * & touch */* & touch */*/* & touch */*/*/* & touch */*/*/*/* & touch */*/*/*/*/* & touch */*/*/*/*/*/* & touch */*/*/*/*/*/*/* & "
alias        hist="history | cut -c 8- "             # Display history w/o the trail for easy copy-pasting used code
alias        jump="tput clear && tput cup 100 0 ; "  # Don't erase terminal history but give a clean empty screen (when overwhelmed)
alias          kk="ls -lah "                         # Yeah, I usually mistype ll, this is for fat fingers like mine.
alias          ll="ls -lah "                         # Omnipresent
alias         llt="ls -tlahr "                       # ditto with time.


# This following command only work with bash as the Login Shell
# # In terminal run: chsh -s /bin/bash
# # Or to revert it back to zsh run: chsh -s /bin/zsh
if [[ $- == *i* ]]; then
 PS1="\\[`tput setaf 2`\\]\\[`tput setab 0`\\]\\[`tput bold`\\]\\[`tput smul`\\]#\# \d \D{%R} \h \W]\$\\[`tput sgr0`\\] "
 PS2=" "
 PS4="+$LINENO+ "
fi