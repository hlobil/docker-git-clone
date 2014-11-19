#!/usr/bin/env bash

if [[ -z "${GIT_REPO}" ]]; then
	echo "Error, GIT_REPO is required." >&2
fi

: ${GIT_BRANCH:='master'}

echo Cloning Project [${GIT_BRANCH}] ${GIT_REPO}
git clone --quiet --single-branch --branch ${GIT_BRANCH} ${GIT_REPO} /var/workspace


: ${GIT_REV:=$(git rev-parse HEAD)}
export GIT_REV

echo Setting revision ${GIT_REV}
git checkout --quiet --force ${GIT_REV}

# if [ -n "${GIT_REV}" ]
# then
# 	echo Setting revision ${GIT_REV}
# 	git checkout --quiet --force ${GIT_REV}
# else
# 	echo Revision $(git rev-parse origin/master^{commit})
# 	git checkout --quiet --force $(git rev-parse origin/master^{commit})
# fi


# env


# if [ -z "${3}" ]; then
#     echo "VAR is unset or set to the empty string"
# fi
# if [ -z "${3+set}" ]; then
#     echo "VAR is unset"
# fi
# if [ -z "${3-unset}" ]; then
#     echo "VAR is set to the empty string"
# fi
# if [ -n "${3}" ]; then
#     echo "VAR is set to a non-empty string"
# fi
# if [ -n "${3+set}" ]; then
#     echo "VAR is set, possibly to the empty string"
# fi
# if [ -n "${3-unset}" ]; then
#     echo "VAR is either unset or set to a non-empty string"
# fi

#                         +-------+-------+-----------+
#                 VAR is: | unset | empty | non-empty |
# +-----------------------+-------+-------+-----------+
# | [ -z "${VAR}" ]       | true  | true  | false     |
# | [ -z "${VAR+set}" ]   | true  | false | false     |
# | [ -z "${VAR-unset}" ] | false | true  | false     |
# | [ -n "${VAR}" ]       | false | false | true      |
# | [ -n "${VAR+set}" ]   | false | true  | true      |
# | [ -n "${VAR-unset}" ] | true  | false | true      |
# +-----------------------+-------+-------+-----------+
