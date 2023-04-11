
#go to home
function h() {
	cd ~/$1
}

#create directory and cd to it
function dir() {
	mkdir -p $1 && cd $1
	echo "\n\nOpen with VSCode?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes) code .; break;;
			No) break;;
		esac
	done
}

function godir() {
	local pkgName="golang-app"
	if [[ -z $1 ]]; then
		echo "please input directory name"
		return
	fi
	if [[ ! -z $2 ]]; then
		pkgName=$2
	fi
	mkdir -p $1 && cd $1 && go mod init $pkgName
	echo "🚀 Create go module $pkgName in $(pwd)"
	echo "\n\nOpen with VSCode?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes) code .; break;;
			No) break;;
		esac
	done
}

#create .prettierrc file as current path
function cpt() {
	cp $HOME/.dotfiles/.prettierrc $(pwd)/.prettierrc
	echo ".prettierrc created 🚀"
}

#run dev command by current node package manager tool
function dev() {
	if [[ -f $(pwd)"/yarn.lock" ]]; then
		yarn dev
	elif [[ -f $(pwd)"/pnpm-lock.yaml" ]]; then
		pnpm dev
	else
		npm run dev
	fi
}

#run build command by current node package manager tool
function build() {
	if [[ -f $(pwd)"/yarn.lock" ]]; then
		yarn build
	elif [[ -f $(pwd)"/pnpm-lock.yaml" ]]; then
		pnpm build
	else
		npm run build
	fi
}
#colormap function Thanks: https://github.com/xcad2k/dotfiles
function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

#apt update & upgrade
function apt() {
	if [[ $1 == "updatez" ]]; then
		sudo apt update -y && sudo apt upgrade -y
	else
		sudo apt $1
	fi
}
