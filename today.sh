#!bin/sh

FILE="log/$(date +%Y-%m-%d).md"
echo "# $(date +%Y-%m-%d)\n" >> $FILE
cat "routines.md" >> $FILE
echo "\n" >> $FILE
cat "todo.md" | head -5 >> $FILE

## TODO
# - [ ] Send anything from yesterday's ## Tomorrow section into the new day
# - [ ] Select an arbitrary of head tasks from the CLI
