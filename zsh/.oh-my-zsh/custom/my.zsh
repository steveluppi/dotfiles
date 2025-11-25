# Variables for certain key files/folders
zshrc=$ZSH_CUSTOM/my.zsh
vimrc=~/.vimrc
tmuxconf=~/.tmux.conf

export PATH="/usr/local/opt/libpq/bin":$PATH

export EDITOR='vim'
export LESS='-FR'

# working aliases
alias dumpling="bundle exec bin/dumpling"
alias dbpass="sed -n \"s/db_password: '\(.*\)'/\1/p\" ~/github/rubicon/config/secrets.yml"
alias rpr="bundle exec parallel_rspec"
alias bi="bundle install"
alias be="bundle exec"
alias dd="bundle exec bin/dumpling download"

# aws cli
alias ssh_to_qa_app="aws ssm start-session --target i-04e764eb5b997afad"
alias ssh_to="aws ssm start-session --target"
alias ssh_tunnel_qa_db="aws ssm start-session --target i-0f230dc41ae87ea4a --document-name AWS-StartPortForwardingSessionToRemoteHost --parameters portNumber="5432",localPortNumber="5432",host=rds.nophi-backend-qa.rubiconmd.com"

# docker extensions
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dpsa='docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias local_pgadmin='docker run --rm --name local_pgadmin -d -p 8081:80 --network rubicon_default -v /Users/steveluppi/dev/pgadmin/storage/:/var/lib/pgadmin/storage -e PGADMIN_DEFAULT_PASSWORD=password -e PGADMIN_DEFAULT_EMAIL=yo@mail.com dpage/pgadmin4'

# overridden plugins
alias sgrep='grep -R -n -H -l --exclude-dir={.git,node_modules,.svn,CVS,./db/dumps,tmp} '
alias sgrepa='grep -R -n -H --exclude-dir={.git,node_modules,.svn,CVS,./db/dumps,tmp} '

# Git CLI Helpers
alias mypr='cd ~/github/rubicon && gh pr list -a "steveluppi" && cd -'
alias myreview='cd ~/github/rubicon && gh pr list -S "user-review-requested:@me" && cd -'
alias rmpr='git status --short | grep "md$" | cut -d " " -f 2 | xargs rm'

# This is the helper
alias c='cal -3'
alias re='source ~/.zshrc'
alias wd='dirs -v'
alias calm='say begin && sleep 60 && say well done'
alias weather='curl wttr.in/Naperville\?2AFn'
alias weatherc='curl wttr.in/Naperville\?2AFnm'
alias AG='alias | grep'
alias cov='COVERAGE=true'
alias gcup="git branch -vv | grep ': gone' | awk '{print \$1}'"
alias launch_decode='pbpaste | base64 -d | xmllint --format - | bat'
alias -g poof='| xargs git branch -d'
alias -g POOF='| xargs git branch -D'
alias stage_changes="git status --short | grep '^[^\?]' | awk '{ print \$2 }' | xargs git stage"
alias gssavim="git status --short | awk '{ print \$2 }' | xargs -o vim -p"
alias gssanvim="git status --short | awk '{ print \$2 }' | xargs -o nvim -p"
alias gssvim="git status --short | grep '^[^\?]' | awk '{ print \$2 }' | xargs -o vim -p"
alias gssnvim="git status --short | grep '^[^\?]' | awk '{ print \$2 }' | xargs -o nvim -p"
alias my_git_notes="git log HEAD~2.. --pretty=%s --first-parent"

alias rdoc='rspec --format documentation'
alias rof='rspec --only-failures'
alias docrelspec="git status --short | grep spec/ | grep -v factories | cut -d' ' -f 3 | xargs bundle exec rspec --format documentation"
alias relsepc="git status --short | grep spec/ | grep -v factories | cut -d' ' -f 3 | xargs bundle exec rspec"

alias ide='tmux attach -t code'

alias idx='bat ~/.vimwiki/index.vimwiki'
alias index='node ~/dev/index_picker/index.js'

#jrnl
alias j='jrnl'
alias je='jrnl -n 1 --edit'
alias jmgr='jrnl --template ~/.jrnl/14.03.a_Eng_Mgr_mtg.md'
alias jooo='jrnl --template ~/.jrnl/one_on_one.md'
alias jp='jrnl --template ~/.jrnl/14.01.b_pandora_team_mtg.md'
alias jsdo='jrnl --template ~/.jrnl/14.05.a_sdo.md'
alias jte='jrnl -from today --edit'
alias jt='jrnl -from today --short'
alias jtl='jrnl -from today'
alias jwip='jrnl @wip --edit'
alias jy='jrnl -from yesterday -to yesterday --short'
alias jyl='jrnl -from yesterday -to yesterday'
alias qj='jrnl --config-override editor ""'

# Taskwarrior
alias anno='task annotate'
alias cn='clear && task next'
#alias msu='clear && jrnl -from yesterday -to yesterday --short && task timesheet && task calendar && task ls'
alias msu='clear && task timesheet && task calendar && task ls'
alias n='task'
alias na='task add'
alias nat='task annotate'
alias nc='clear && task calendar && task next'
alias nd='task done'
alias next='task modify +next'
alias nls='clear && task ls'
alias nm='task modify'
alias nod='task +ACTIVE or +DUE or +OVERDUE'
alias ns='task start'
alias nw='task modify wait:Monday'
alias today='task add +next due:eod'
alias tom='task modify wait:tomorrow'

function pr_review(){
	task add +me +pr +next Review QA PR - $1
	task add +me +pr Review Master PR - $1
}

function focus(){
        until [ $(date "+%M") -eq $1 ]; do
                sleep 15;
        done;
        say Focus Time
}

function breathe(){
        say "Begin"
        for i in {1..$1};
        do
                sleep 60;
                echo $i;
        done;
        say "Well done!"
}
function pomodoro(){
	for c in {1..$1};
	do
		say "Begin"
		for i in {1..20}
		do
			sleep 60;
			echo Pomodoro - $i
		done;
		say "Break time"
		for i in {1..5}
		do
			sleep 60;
			echo Break - $i
		done;
	done;
	say "Complete"
}

function mgr(){
	for name in jim jason alfonso dylan jorge
	do
		task add +$name +mgr $@
	done
}



function start_pgadmin(){
        docker run -d --name pgadmin --net=rubicon_default -v /Users/steveluppi/dev/pgadmin/storage:/var/lib/pgadmin/storage -e PGADMIN_DEFAULT_EMAIL=yo@mail.com -e PGADMIN_DEFAULT_PASSWORD=password -p 8080:80 --link rubicon-postgres-1:db dpage/pgadmin4
}

function start_ngrok(){
        docker run --rm --net=host -p 4040:4040 -it -e NGROK_AUTHTOKEN=2GRzNYEV0fGVjau5fnoIhmi7Enm_2jAurEUmLsUEFcou9rNaJ ngrok/ngrok http host.docker.internal:3000
}

function start_ngrok_on_port(){
        docker run --rm --net=host -it -e NGROK_AUTHTOKEN=2GRzNYEV0fGVjau5fnoIhmi7Enm_2jAurEUmLsUEFcou9rNaJ ngrok/ngrok http host.docker.internal:$1
}
function start_mermaid(){
	docker run -d --name mermaid -p 8000:8080 ghcr.io/mermaid-js/mermaid-live-editor
}

function pr_time(){
	# Get the branch
	local branch=$(git rev-parse --abbrev-ref HEAD)
	echo "Making PRs for branch [$branch]"

	# Get the ticket number
	local ticket=$(echo $branch | cut -f2 -d'/' | cut -f1 -d '_')
	echo "Jira ticket for branch [$ticket]"
	
	echo "What should the title be?"
	read title

	# Filename for the generic template
	local base_template=sjl_$ticket.md

	# Get a local copy of the template
	cp ~/PULL_REQUEST_TEMPLATE.md $base_template

	# Edit the template to add content
	vim $base_template

	gh pr create -a "@me" -B qa -d -l 'Needs Review' -t "qa | $ticket - $title" -F $base_template
	gh pr create -a "@me" -m 'Next' -d -l 'Waiting for QA' -t "main | $ticket - $title" -F $base_template

	local main=$(gh pr list -a "@me" | grep $branch | grep main | cut -f1)
	local qa=$(gh pr list -a "@me" | grep `git rev-parse --abbrev-ref HEAD` | grep qa | cut -f1)
	echo "Main PR: $main"
	echo "QA PR: $qa"

	# Create master & qa versions of the template
	sed "s/IN-XXXX/$ticket/g" "$base_template" | sed "s/{{PR}}/\[main pr\]\(https:\/\/github.com\/rubiconmd\/rubicon\/pull\/$main\)/" > "q_$base_template"
	sed "s/IN-XXXX/$ticket/g" "$base_template" | sed "s/{{PR}}/\[qa pr\]\(https:\/\/github.com\/rubiconmd\/rubicon\/pull\/$qa\)/" > "m_$base_template"

	vim -p "m_$base_template" "q_$base_template"

	gh pr edit $main -F "m_$base_template"
	gh pr edit $qa -F "q_$base_template"
}
function extra_qa_pr(){
	# Get the branch
	local branch=$(git rev-parse --abbrev-ref HEAD)
	echo "Making extra QA PR for branch [$branch]"

	# Get the ticket number
	local ticket=$(echo $branch | cut -f2 -d'/' | cut -f1 -d '_')
	echo "Jira ticket for branch [$ticket]"
	
	local title=$(gh pr view --jq '.title' --json 'title' | sed "s/main\| IN-\\[0-9\\]* - //")
	echo "Title is [$title]"

	#local main=$(gh pr list -a "@me" | grep $branch | grep main | cut -f1)
	#echo "Main PR: $main"

	# Filename for the generic template
	#local base_template=sjl_$ticket.md

	#vim "q_$base_template"
	#gh pr create -a "@me" -B qa -d -l 'Needs Review' -t "qa | $ticket - $title" -F "q_$base_template"
}
function extra_main_pr(){
	# Get the branch
	local branch=$(git rev-parse --abbrev-ref HEAD)
	echo "Making extra Main PR for branch [$branch]"

	# Get the ticket number
	local ticket=$(echo $branch | cut -f2 -d'/' | cut -f1 -d '_')
	echo "Jira ticket for branch [$ticket]"
	
	local title=$(gh pr view --jq '.title' --json 'title' | sed "s/main - \| in-\[0-9\]* - //")
	echo "Title is [$title]"

	#local main=$(gh pr list -a "@me" | grep $branch | grep main | cut -f1)
	#echo "Main PR: $main"

	# Filename for the generic template
	#local base_template=sjl_$ticket.md

	#vim "m_$base_template"
	#gh pr create -a "@me" -d -l 'Waiting for QA' -t "main | $ticket - $title" -F "q_$base_template"
}
function assign_qa_pr(){
	# Get the branch
	local branch=$(git rev-parse --abbrev-ref HEAD)
	echo "Working with branch [$branch]"

	# Get the ticket number
	local ticket=$(echo $branch | cut -f2 -d'/' | cut -f1 -d '_')
	echo "Jira ticket for branch [$ticket]"
	
	local qa=$(gh pr list -a "@me" | grep `git rev-parse --abbrev-ref HEAD` | grep qa | cut -f1)

	gh pr edit $qa --add-reviewer "jsalsiccia" --add-reviewer "dylanerichards"
}
function assign_main(){
	# Get the branch
	local branch=$(git rev-parse --abbrev-ref HEAD)
	echo "Working with branch [$branch]"

	# Get the ticket number
	local ticket=$(echo $branch | cut -f2 -d'/' | cut -f1 -d '_')
	echo "Jira ticket for branch [$ticket]"
	
	local main=$(gh pr list -a "@me" | grep `git rev-parse --abbrev-ref HEAD` | grep main | cut -f1)

	gh pr edit $main --add-reviewer "jsalsiccia" --add-reviewer "dylanerichards"
}
function edit_pr(){
	# Get the branch
	local branch=$(git rev-parse --abbrev-ref HEAD)
	echo "Working with branch [$branch]"

	# Get the ticket number
	local ticket=$(echo $branch | cut -f2 -d'/' | cut -f1 -d '_')
	echo "Jira ticket for branch [$ticket]"
	
	# Filename for the generic template
	local base_template=sjl_$ticket.md

	vim -p "m_$base_template" "q_$base_template"

	local main=$(gh pr list -a "@me" | grep $branch | grep main | cut -f1)
	local qa=$(gh pr list -a "@me" | grep `git rev-parse --abbrev-ref HEAD` | grep qa | cut -f1)

	gh pr edit $main -F "m_$base_template"
	gh pr edit $qa -F "q_$base_template"
}
function deploy_prep(){
	ssh-add -K ~/.ssh/rubicon-staging.pem
	ssh-add -K ~/.ssh/github_rmd
}
function aws_ls(){
	aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PrivateIpAddress,PublicIpAddress,Tags[?Key==`Name`].Value[]]' --output json | tr -d '\n[] "' | perl -pe 's/i-/\ni-/g' | tr ',' '\t' | sed -e s/null/None/g | grep '^i-' | column -t
}
function audio(){
  echo 'input'
  SwitchAudioSource -c -t input
  echo 'output'
  SwitchAudioSource -c -t output
  echo 'system'
  SwitchAudioSource -c -t system
}

# Make sure to use nvm
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
# add-zsh-hook chpwd load-nvmrc

path+=('/Users/steveluppi/bin')
