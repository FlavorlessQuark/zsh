# Created by newuser for 5.8

TOKEN="None"

#------ Prompt customization ----#
autoload -U colors && colors
autoload -Uz vcs_info

precmd(){ vcs_info }


PROMPT="%F{red}~ C%F{yellow}o%F{green}l%F{cyan}or%F{blue}fu%F{magenta}l ~%F{reset_color} %1 \>"

#------ Git Aliases 0------------#

function gitcreate() {

	if [ $TOKEN = "None" ]
	then
		echo "Enter your personal token; "
		read -r TOKEN
	fi

	eval "curl -H \"Authorization: token ${TOKEN}\" https://api.github.com/user/repos -d '{\"name\":\"${1}\",\"private\":false}'"

}

function gitall() {
	git add .
	if [ "$1" != "" ]
	then
		git commit -m "$1"
	else
		git commit -m "Update"
	fi
	git pull
	git push
}

function gitfrom() {

	URL="git clone git@github.com:"

	if [ "$1"  = "self" ]
    then
		URL="${URL}FlavorlessQuark/"
	elif [ "$1" = "kevin" ]
	then	URL="${URL}MrColour/"
	elif [ "$1" = "next" ]
	then    URL="${URL}42-next/"
	elif [ "$1" = "dev" ]
	then    URL="${URL}dev-stdout/"
	elif [ "$1" = "sig" ]
	then    URL="${URL}LumenNoctis/"
	elif [ "$1" = "gd" ]
	then    URL="${URL}Compute-Progress/"
	elif [ "$1" = "42" ]
	then    URL="${URL}42Curriculum/"
	elif [ "$1" = "wasm" ]
	then	URL="${URL}Wasync/"
    fi

    URL="${URL}"$2""
    if [ "$3" != "" ]
    then    URL="${URL} "$3""
    fi

    eval  ${URL}
}

alias ga='git add .'
alias gcm='git commit -m'
alias gpl='git pull'
alias gpu='git push'

