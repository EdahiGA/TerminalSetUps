# >>> EXPORTS:
export     TEMP=/tmp/${USER}                         # Auto-define my own temporal environment
export HISTSIZE=5000                                 # Scroll-back allowed in history command

# >>> Functions:
cdl()  { cd "$1" && ll ; }                           # (Req: alias ll)  cd to the specified directory and list its content.
mkcd() { mkdir -p "$1" && cdl "$1" ; }               # (Req: alias cdl) Generates and enters a directory (-p allows to work on pre-existing dirs)
scn()  { screen -S ${USER}_qlogin_`gsd` ; }          # (Req: alias gsd) Run a screen with auto-generated unique ID
Qlog() { qlogin -q interact.q -pe parallel "$1" ; }  # Starts interactive session with the specified procs 
Rescn(){                                             # Re-join specified screen (1=oldest screen)
  re=`screen -ls|cut -f2|sed -n $(($1+1))'p'`;
  [[ $re =~ qlog ]] && screen -R $re || echo N/A ;
}

# >>> Sources:
alias     csource="cat ~/.bash_profile"              # Shortcut to see your profile
alias    dosource="source ~/.bash_profile "          # ''       '' run your profile     
alias     esource="nano ~/.bash_profile; dosource  " # ''       '' edit & run your profile

# >>> Shortcuts -- MAC only (not needed inside HPC)
alias         ga1="ssh   hpcana01.ghdna.io -X -Y "   # Shortcuts to access analysis nodes
alias         ga2="ssh   hpcana02.ghdna.io -X -Y "   # 
alias         ga3="ssh   hpcana03.ghdna.io -X -Y "   # 
alias         ga4="ssh   hpcana04.ghdna.io -X -Y "   # 
alias         gl1="ssh hpclogin01.ghdna.io -X -Y "   # Shortcuts to access login nodes
alias         gl2="ssh hpclogin02.ghdna.io -X -Y "   # 

# >>> Shortcuts
alias         gsd="date '+%Y.%m.%d.%S.%N' "          # Shortcut to get a seed, uses current date in miliseconds (May only work in cluster, not MAC)
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
alias         llt="ls -tlahr "                       # ditto sorted by time.
alias       mlsge="module load sge "                 # Shortcut to load the SGE module
alias         qqq="exit"                             # Skyrim shortcut?

# >>> Temporal Folders
[ -d $TEMP ] || mkdir -p $TEMP                       # Generate my temporal folder if non-existant

# >>> R packages default installation folder
[[ -n $R_LIBS ]] &&   export R_LIBS=~/R/library:$R_LIBS   ||  export R_LIBS=~/R/library

# This following command only work with bash as the Login Shell
# # In terminal run: chsh -s /bin/bash
# # Or to revert it back to zsh run: chsh -s /bin/zsh
if [[ $- == *i* ]]; then
 PS1="\\[`tput setaf 2`\\]\\[`tput setab 0`\\]\\[`tput bold`\\]\\[`tput smul`\\]#\# \d \D{%R} \h \W]\$\\[`tput sgr0`\\] "
 PS2=" "
 PS4="+$LINENO+ "
fi
