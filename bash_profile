# >>> Exports:
export     TEMP=/tmp/${USER}                         # Auto-define my own temporal environment
export HISTSIZE=5000                                 # Scroll-back allowed in history command
export ARTIFACTORY_USERNAME="ghbi_service"
export ARTIFACTORY_PASSWORD="Password123"


# >>> PATH:
#   > Default  Path as of 2021-Jun-21
PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/lpp/mmfs/bin
#   > Personal Path as of 2021-Jun-25
PerPath=/home/eavalos/01.Scripts/Bash:/home/eavalos/01.Scripts/Perl:/home/eavalos/miniconda/bin:/home/eavalos/01.Scripts/01.Download/sratoolkit.2.11.0-ubuntu64/bin
#   > Export Joint Path:
export PATH=$PerPath:$PATH


# # >>> Functions:
cdl()  { cd "$1" && ll ; }                           # (Req: alias ll)  cd to the specified directory and list its content.
mkcd() { mkdir -p "$1" && cdl "$1" ; }               # (Req: alias cdl) Generates and enters a directory (-p allows to work on pre-existing dirs)
Qlog() { qlogin -q interact.q -pe parallel "$1" ; }  # Starts interactive session with the specified procs 
scn()  { screen -S ${USER}_`gsd` -t "$1" ;        }  # (Req: alias gsd) Run a screen with given name (unique ID auto-generated)
Rescn(){                                             # Re-join specified screen (1=oldest screen)
  re=`screen -ls|cut -f2|sed -n $(($1+1))'p'`;
  [[ $re =~ "$USER" ]] && screen -R $re ;
}

# >>> Sources:
alias     csource="cat ~/.bash_profile "
alias    dosource="source ~/.bash_profile "
alias     esource="nano ~/.bash_profile ; dosource "

# >>> Shorcuts
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
alias        Jnot="jupyter notebook --no-browser --ip 0.0.0.0 --port 1921 --NotebookApp.token='' "
alias        jump="tput clear && tput cup 100 0 ; "  # Don't erase terminal history but give a clean empty screen (when overwhelmed)
alias          kk="ls -lah "                         # Yeah, I usually mistype ll, this is for fat fingers like mine.
alias          ll="ls -lah "                         # Omnipresent
alias         llt="ls -tlahr "                       # ditto sorted by time.
alias         qqq="exit"                             # Skyrim shortcut?

# >>> Shorcuts - Modules:
alias       mlsge="module load sge "                 # Load the SGE module
alias    mldocker="module load docker "              # Load Docker
alias dockerlogin="docker login -u ghbi_service -p Password123         docker.artifactory01.ghdna.io"
alias   dlscratch="docker login -u ghbi_service -p Password123 docker-scratch.artifactory01.ghdna.io"

# >>> Personal Folders:
export      ePerl=~/01.Scripts/Perl
export      eBash=~/01.Scripts/Bash
export    ePython=~/01.Scripts/Python
export         eR=~/01.Scripts/R
export       cpro=/ghds/tissue/rna_datasets

# >>> Temporal Folders
[ -d $TEMP ] || mkdir -p $TEMP                       # Generate my temporal folder if non-existant

# >>> R packages default installation folder
[[ -n $R_LIBS ]] &&   export R_LIBS=~/R/library:$R_LIBS   ||  export R_LIBS=~/R/library

# >>> make ~/.bashrc equal:
cp ~/.bash_profile ~/.bashrc

# >>> Prompt View:
if [[ $- == *i* ]]; then
 PS1="\\[`tput setaf 2`\\]\\[`tput setab 0`\\]\\[`tput bold`\\]\\[`tput smul`\\]#\# \d \D{%R} \h \W]\$\\[`tput sgr0`\\] "
 PS2=" "
 PS4="+$LINENO+ "
fi

mlsge
