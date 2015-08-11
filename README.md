## Intro

Queue is a simple pair of scripts that allows you to delay executing a command in one session until a specific command in another session completes.

For example, you may want to run a `make` command in one session and then have two other sessions run commands when make is complete.

Shell one:

    make; qtrigger

Shell two:

	qwait; ./run_tests.sh

Shell three:

	qwait; ./show_logs.sh

Thie `./deploy.sh` and `show_logs.sh` commands will run once the `make` command (and thus the `qtrigger` command) has completed.

## Named Queues

You may also give queues a name, if you want to have more than one queue active at a time:

	make; qtrigger q1

Elsewhere:

	qwait q1; echo "Finished!"

## Install

You can install this on OS X via brew:

	brew install TomAnthony/brews/queue

On Linux you can just copy the `qset`, `qtrigger`, and `qwait` files into your PATH.

I may get round to better installation on other systems at somepoint. Feel free to submit a pull request! :)