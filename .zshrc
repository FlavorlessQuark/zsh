# Created by newuser for 5.8

#------ Prompt customization ----#
autoload -U colors && colors
autoload -Uz vcs_info

precmd(){ vcs_info }


PROMPT="%F{red}~ C%F{yellow}o%F{green}l%F{cyan}or%F{blue}fu%F{magenta}l ~%F{reset_color} %1 \>"

#------ Git Aliases 0------------#

function settoken(){
	TOKEN="None"

	echo "Enter your personal token: "
	read -r TOKEN
	if [[ $(grep -q PERSONAL_ACCESS_TOKEN= ~/.zshenv) ]]
	then
		sed -in "s/^export PERSONAL_ACCESS_TOKEN=.*/export PERSONAL_ACCESS_TOKEN=$TOKEN/" ~/.zshenv
	else
		echo "export PERSONAL_ACCESS_TOKEN=$TOKEN" >> ~/.zshenv
	fi
}

function gitcreate() {
	TOKEN=$(env | grep PERSONAL_ACCESS_TOKEN= | cut -d \= -f 2)

	if [[ $(grep PERSONAL_ACCESS_TOKEN ~/.zshenv) ]]
	then
		if [ "$1" = "self" ]
		then
			endpoint="user/repos"
		else
			if [ "$1" = "sig" ]
			then    ORG="LumenNoctis"
			elif [ "$1" = "cp" ]
			then    ORG="Compute-Progress"
			elif [ "$1" = "42" ]
			then    ORG="42Curriculum"
			elif [ "$1" = "wasm" ]
			then	ORG="Wasync/"
			fi
			endpoint="orgs/${ORG}/repos"
		fi
		eval "curl -H \"Authorization: token ${TOKEN}\" https://api.github.com/${endpoint} -d '{\"name\":\"${2}\",\"private\":false}'"
	else
		echo "No token found. Please use settoken to set your personal access token"
	fi

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
	elif [ "$1" = "cp" ]
	then    URL="${URL}Compute-Progress/"
	elif [ "$1" = "42" ]
	then    URL="${URL}42Curriculum/"
	elif [ "$1" = "wasm" ]
	then	URL="${URL}Wasync/"
	elif [ "$1" = "recbox" ]
	then	URL="${URL}RecBox-Games/"
    fi

    URL="${URL}"$2""
    if [ "$3" != "" ]
    then    URL="${URL} "$3""
    fi

    eval  ${URL}
}

function test() {
	if [[ $(grep PERSONAL_ACCESS_TOKEN ~/.zsh_profile) ]]
	then echo "NOT HERE"
	else
		echo $THISVAR IS OWOW
	fi

}

function run_pm() {
	pad_serv
	cd  /home/jjosephi/projects/recbox/potion_masters/
	node client/node/index.js &
	code client && code console
	cd console
}

function controller() {
	# Start server, run node in bg, code server, client, cd to console
	webcp
	cd  /home/jjosephi/projects/recbox/controller_boilerplate
	code .
}

alias add='git add .'
alias commit='git commit -m'
alias pull='git pull'
alias push='git push'
alias gkill='/home/jjosephi/scripts/grep_kill'
alias pad_serv='/home/jjosephi/projects/recbox/WSCPServ/target/debug/server &'
alias webcp='node /home/jjosephi/projects/recbox/WebCP/index.js &'
alias localhost='firefox localhost:3000'

export MOZ_ENABLE_WAYLAND=1
source "/home/jjosephi/emsdk/emsdk_env.sh"

# Created by `pipx` on 2023-03-29 17:57:42
alias docker_prompt='sudo docker run --rm -it --entrypoint /bin/bash  debian:11'
alias ino_compile='arduino-cli compile --fqbn arduino:avr:uno '
alias ino_upload='arduino-cli upload -p /dev/ttyUSB0 --fqbn arduino:avr:uno  '
