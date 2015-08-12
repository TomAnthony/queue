## Intro

Queue is a simple command that allows you to defer executing a command in one session until a specified command in another session completes.

For example, you may want to run a `make` command in one session and then have two other sessions run commands when make is complete.

In this example the `run_rests.sh` and `show_logs.sh` in panes 2 & 3 will run after the make command completes in pane 1 (at which point the `q -t` command will run -- the `-t` command sends the 'trigger'):

```
.-----------------------------------.-----------------------------------.
| $ make; q -t                  (1) | $ q; ./run_tests.sh           (2) |
|                                   |                                   |
|                                   |                                   |
|                                   |                                   |
|                                   |                                   |
|                                   |                                   |
|                                   |-----------------------------------|
|                                   | $ q; ./show_logs.sh           (3) |
|                                   |                                   |
|                                   |                                   |
|                                   |                                   |
|                                   |                                   |
|                                   |                                   |
'-----------------------------------'-----------------------------------'
```

## Named Queues

You may also give queues a name, if you want to have more than one queue active at a time:

```bash
$ make; q -t foo
```

Elsewhere:

```bash
$ q foo; echo "Finished!"
```

## Install

You can install this on OS X via brew:

	brew install TomAnthony/brews/queue

On Linux you can just copy the `q` file into your PATH.

I may get round to better installation on other systems at somepoint. Feel free to submit a pull request! :)

## Motivation

I wrote this to work with [iTermocil](https://github.com/TomAnthony/itermocil/) and [teamocil](https://github.com/remiprev/teamocil), where you may want some commands to wait for others as your session is configured.

## FAQ

Q) What about the `wait` command?

A) I'm aware of `wait` but it requires the PID of the command you want to wait for and so didn't fit my use case (above). It was also more fiddly to use anyway.

## To do

- Perhaps add an option that a single `q -t` can trigger multiple queues