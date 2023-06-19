languages=$(echo "javascript typescript bash" | tr " " "\n")
core_utils=$(echo "tmux grep find xargs sed awk fzf man" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "query: " query

if echo "$languages" | grep -qs $selected; then
	tmux neww bash -c "echo \"curl cht.ch/$selected/$query/\" & curl cht.sh/$selected/$query | less"
else
	tmux neww bash -c "echo \"curl cht.sh/$selected~$query/\" & curl cht.sh/$selected~$query | less"
fi
