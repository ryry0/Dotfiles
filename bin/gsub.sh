#!/usr/bin/env bash

arg="$1"

case $arg in
        add)
                git remote add $2 $3
                git fetch $2
                git read-tree --prefix=$2 -u $2/master
                git commit -m "Added $2 subtree in $2"
                git branch backport-$2 $2/master
        ;;

        update)
                git fetch $2
                git merge -s subtree --squash $2/master
                git commit
        ;;

        commit)
                CURR_BRANCH=$(git rev-parse --abbrev-ref HEAD)
                git checkout backport-$2
                git cherry-pick -x $3
                git checkout $CURR_BRANCH
        ;;

        push)
                CURR_BRANCH=$(git rev-parse --abbrev-ref HEAD)
                git checkout backport-$2
                git push $2 HEAD:master
                git checkout $CURR_BRANCH
        ;;

        help)
                echo "add <subtree name> <url>"
                echo "update <subtree name>"
                echo "commit <subtree name> <branch head/commit>"
                echo "push <subtree name>"
        ;;
esac
