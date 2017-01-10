#!/usr/bin/env bash
#Display usage informatiosn
usage() { echo "Usage: $0 [-p <Playbook Path> ] [-t <Playbook Title> ]" 2>&1; exit 1; }
[ $# -eq 0 ] && usage
#Side Note 
# File descriptor 0 --> stdin
# File descriptor 1 --> stdout
# File descriptor 2 --> stderr
# 2>&1 --> dump content of stderr to stdout.

#getopts --> Get the options

#End side note
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

if [ -z ${PROJECT_PATH} ]; then 
	echo "Please supply a project path "
	exit 1
fi
if [ -z ${PLAYBOOK_TITLE} ]; then
        echo "Please supply a playbook title "
        exit 1
fi

# Create the basic folder structure

mkdir -p ${PROJECT_PATH}/${PLAYBOOK_TITLE}/files
mkdir -p ${PROJECT_PATH}/${PLAYBOOK_TITLE}/group_vars
mkdir -p ${PROJECT_PATH}/${PLAYBOOK_TITLE}/group_vars/dev
mkdir -p ${PROJECT_PATH}/${PLAYBOOK_TITLE}/group_vars/qa
mkdir -p ${PROJECT_PATH}/${PLAYBOOK_TITLE}/host_vars/dev
mkdir -p ${PROJECT_PATH}/${PLAYBOOK_TITLE}/host_vars/qa
mkdir -p ${PROJECT_PATH}/${PLAYBOOK_TITLE}/inventories
mkdir -p ${PROJECT_PATH}/${PLAYBOOK_TITLE}/roles

#Create default common roles
ansible-galaxy init common -p ${PROJECT_PATH}/${PLAYBOOK_TITLE}/roles

touch ${PROJECT_PATH}/${PLAYBOOK_TITLE}/inventories/dev
touch ${PROJECT_PATH}/${PLAYBOOK_TITLE}/inventories/qa

touch ${PROJECT_PATH}/${PLAYBOOK_TITLE}/${PLAYBOOK_TITLE}.yml


