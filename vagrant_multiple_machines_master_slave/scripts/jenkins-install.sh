#!/bin/bash -e

# Package requirements: jenkins
# Test for a reboot,  if this is a reboot just skip this script.
#
if test "$RS_REBOOT" = "true" -o "$RS_ALREADY_RUN" = "true" ; then
  logger -t RightScale "Jenkins Install,  skipped on a reboot."
  exit 0
fi

#Test for existing repository
if [  "$RS_DISTRO" ==  "ubuntu" ]; then
jenkins_repo=`ls /etc/apt/sources.list.d/ -1 2>/dev/null | grep "jenkins$" | head -1`
#test for file existance
if test "$jenkins_repo" = "" ; then
  echo "Adding Jenkins repository: ${jenkins_repo}"
  wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
  sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
  apt-get update
  apt-get install -y jenkins
fi
fi

if [ $? -eq 0 ]; then
  echo "Added Jenkins repository..."
else
  echo "Adding Jenkins repository failed. Aborting installation!"
    logger -t RightScale 'Adding Jenkins repository failed. Aborting installation!'
  exit 1
fi

if [  "$RS_DISTRO" ==  "centos" ]; then
jenkins_repo=`ls /etc/yum.repos.d/ -1 2>/dev/null | grep "jenkins$" | head -1`
#test for file existance
if test "$jenkins_repo" = "" ; then
  echo "Adding Jenkins repository: ${jenkins_repo}"
  wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
  rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
  yum install -y jenkins
fi
fi

if [ $? -eq 0 ]; then
  echo "Added Jenkins repository..."
else
  echo "Adding Jenkins repository failed. Aborting installation!"
    logger -t RightScale 'Adding Jenkins repository failed. Aborting installation!'
  exit 1
fi

service jenkins start
