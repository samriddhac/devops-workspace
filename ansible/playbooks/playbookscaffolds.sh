#!/usr/bin/env bash
#Display usage informatiosn
usage() { echo "Usage: $0 [-p <Playbook Path> ] [-t <Playbook Title> ]" 1>&2; exit 1; }
[ $# -eq 0 ] && usage

while getopts ":p:t:" OPTION; do
	case ${OPTION} in
		p)
			PROJECT_PATH=${OPTARG}
			;;
		t)
			PLAYBOOK_TITLE=${OPTARG}
			;;
		h | *)
			usage
			exit 0
			;;
	esac
done
