#! /usr/bin/env python
import     time
import     csv
import     sys
import     os
from       argparse import ArgumentParser
from       datetime import datetime, timedelta

try:
    import boto3
except ImportError:
    print (__file__ + ": python boto3 not supported.")
    sys.exit(1)

# init globals
version='1.0'
msgErrPrefix='>>> Error: '
msgInfoPrefix='>>> Info: '
debugPrefix='>>> Debug: '
logPrefix='>>> Log: '

def pInfo(msg):
    tmsg=time.asctime()
    print(msgInfoPrefix+tmsg+": "+msg)

def pError(msg):
    tmsg=time.asctime()
    print(msgErrPrefix+tmsg+": "+msg)

def pDebug(msg):
    if debug:
        tmsg=time.asctime()
        print(debugPrefix+tmsg+": "+msg)
def Summary(hdr):
    print(hdr)
    print( '\tVersion: ' + version)
    print( '\tAWS credentials profile: ' + profile)
    print( '\tAWS instance id: ' + instanceid)
    print( '\tAWS control action: ' + action)
    print( '\tDebug: ' + str(debug))
    print( '\tTest: ' + str(test))
    tmsg=time.asctime()
    print( '\tTime: ' + tmsg)
# defaults
defProfile = 'dev'
defInstanceid = 'i-08ba30f11e3fb7677'
defAction = 'start'

# parse input
parser = ArgumentParser( description = "script to a batch compute environment" )
parser.add_argument( "-a", "--action", default = defAction,
                     help = "Start or stop instance. Default: " + defAction )
parser.add_argument( "-i", "--instanceid", default = defInstanceid,
                     help = "Image id to start or stop. Default: " + defInstanceid )
parser.add_argument( "-p", "--profile", default = defProfile,
                     help = "AWS credentials profile for AWS accces. Default: " + defProfile )
parser.add_argument( "-T", "--test", action="store_true", default = False,
                     help = "Test without executing [default: False]" )
parser.add_argument( "-D", "--Debug", action="store_true", default = False,
                     help = "Turn on debug output [default: False]" )
parser.add_argument( "--version", action="store_true", default = False,
                     help = "Print version of " + __file__ )
args = parser.parse_args()
# set result of arg parse_args
action = args.action
instanceid = args.instanceid
debug = args.Debug
test = args.test
profile = args.profile

# summary
Summary("Summary of " + __file__)
try:
    session = boto3.Session(profile_name=profile)
    ec2_client = session.client('ec2')
except Exception as e:
    pError('boto3 session or client exception ' + str(e))
    sys.exit(2)
if test:
    pInfo("Testing ... created ec2 client to " + action + " instance id " + instanceid)
else:
    # action to start
    if action.lower() == 'start':
        # start it up
        try:
            rstart = ec2_client.start_instances(InstanceIds=[instanceid],DryRun=False)
        except Exception as e:
            pError("Error attempting to start instance: \n\t" + str(e))
            sys.exit(2)
        rstat = ec2_client.describe_instance_status(InstanceIds=[instanceid])
        key = 'InstanceStatuses'
        if len(rstat[key]) == 0:
            time.sleep(5)
            rstat = ec2_client.describe_instance_status(InstanceIds=[instanceid])
            if len(rstat[key]) == 0:
                pError('Seems to be taking too long to get describe_instance_status started')
                sys.exit(2)
            status = rstat[key][0]['InstanceState']['Name']
            pInfo("Instance is now " + status +  \
                  "\n\t You might have to wait a couple of minutes before logging in.")
    elif action.lower() == 'stop':
        # stop it
        try:
            rstop = ec2_client.stop_instances(InstanceIds=[instanceid],DryRun=False)
        except Exception as e:
            pError("Error attempting to stop instance: \n\t" + str(e))
            sys.exit(2)
        rstat = ec2_client.describe_instance_status(InstanceIds=[instanceid])
        key = 'InstanceStatuses'
        if len(rstat[key]) != 0:
            time.sleep(5)
            rstat = ec2_client.describe_instance_status(InstanceIds=[instanceid])
            if len(rstat[key]) != 0:
                pError('Seems to be taking too long to stop instance')
                sys.exit(2)
        pInfo("Instance is now stopping or stopped")
    pInfo("Instance control has completed.")
