## Intro

This is a simple set of scripts that allow you to create a 'command queues'. You can run a command and on completion of that command you can send a 'trigger' to tell other commands in other terminal sessions to run.

    make; qtrigger myqueue

In another shell:

	qwait myqueue; ./deploy.sh

Thie `./deploy.sh` command will run once the make command (and thus the `qtrigger` command) from the other shell have completed. If the make completed before you ran the commmands in the second window then they would just run right away (i.e. the qwait would return immediately), and subsequent waits on the same queue would wait for a new trigger.

You can have multiple commands waiting for the same trigger across multiple shells.

## Install

You can install this on OS X via brew:

	brew install TomAnthony/brews/queue

I may get round to better installation on other systems at somepoint. Feel free to submit a pull request.