## Intro

This is a simple set of scripts that allow you to create a 'command queues'. You can create a queue and then run a command and on completion of that command you can tell other commands in other terminal sessions to run.

    qcreate my_queue
    make; qtrigger my-queue

In another shell:

	qwait my_queue; ./deploy.sh

Thie `./deploy.sh` command will run once the make command (and thus the `qtrigger` command) from the other shell have completed.

You can have multiple commands waiting for the same trigger across multiple shells.

## Install

You can install this on OS X via brew:

	brew install TomAnthony/brews/queue

I may get round to better installation on other systems at somepoint. Feel free to submit a pull request.