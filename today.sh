#!bin/sh

FILE="log/$(date +%Y-%m-%d).md"
echo "# $(date +%Y-%m-%d)\n" >> $FILE
cat "daily_routines.md" >> $FILE
echo "\n## To Do\n" >> $FILE
[ -f "log/$(date -v-1d +%Y-%m-%d).md" ] &&  sed '1,/## Tomorrow/d' "log/$(date -v-1d +%Y-%m-%d).md"| tail -n+2 >> $FILE || echo "Note: Yesterday not copied."
awk '/# To Do/ {f=1} /----------/ {f=0} f' todo.md | tail -n+3 >> $FILE
echo "Todos written, opening file..."
open -a "Sublime Text" $FILE
