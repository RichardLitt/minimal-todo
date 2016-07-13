#!bin/sh
# Set BASEDIR in your .bash_profile

TODAY=$BASEDIR"log/$(date +%Y-%m-%d).md"

touch $TODAY
echo "# $(date +%Y-%m-%d)\n" >> $TODAY
cat $BASEDIR"daily_routines.md" >> $TODAY
echo "\n## To Do\n" >> $TODAY
[ -f $BASEDIR"log/$(date -v-1d +%Y-%m-%d).md" ] &&  sed '1,/## Tomorrow/d' $BASEDIR"log/$(date -v-1d +%Y-%m-%d).md"| tail -n+2 >> $TODAY || echo "Note: Yesterday not copied."
awk '/# To Do/ {f=1} /----------/ {f=0} f' $BASEDIR"todo.md" | tail -n+3 >> $TODAY
echo "\n## Tomorrow\n" >> $TODAY
echo "TODOs written"
echo "Opening file..."
open -a "Sublime Text" $BASEDIR"log/$(date +%Y-%m-%d).md"
