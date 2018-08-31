"""Test module to execute a benchmark through ssh on a remote device.
This assumes all relevant directories and files are present on the remote
device (typically shared by NFS)."""
from litsupport import testplan
import logging


def _mutateCommandline(context, commandline, suffix=""):
    shfilename = context.tmpBase + suffix + ".sh"
    shfile = open(shfilename, "w")
    shfile.write(commandline + "\n")
    logging.info("Created shfile '%s'", shfilename)
    shfile.close()

    config = context.config
    remote_commandline = config.remote_client
    remote_commandline += " %s" % config.remote_host
    remote_commandline += " /bin/sh %s" % shfilename
    return remote_commandline


def _mutateScript(context, script, suffix=""):
    def mutate(context, command):
        return _mutateCommandline(context, command, suffix)
    return testplan.mutateScript(context, script, mutate)


def mutatePlan(context, plan):
    plan.preparescript = _mutateScript(context, plan.preparescript, "-prepare")
    plan.runscript = _mutateScript(context, plan.runscript)
