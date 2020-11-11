# Created by newuser for 5.8
#------ Git Aliases 0------------#
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

	URL="git clone https://github.com/"

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
	then    URL="${URL}Games-and-dragons/"
	elif [ "$1" = "42" ]
	then    URL="${URL}42Curriculum/"
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
