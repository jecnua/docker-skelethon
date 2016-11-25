#!/bin/bash
# NAME_REPO will be deduced by the git repo name.
# You can override this behaviour by setting the variable to something.

if [ -z ${NAME_REPO+x} ];
then
  echo "NAME_REPO is unset";
  NAME_REPO=$(basename `git rev-parse --show-toplevel`)
  echo "NAME_REPO is now set to '$NAME_REPO'";
else
  echo "NAME_REPO is set to '$NAME_REPO'";
fi

ALL=`aws ecr describe-repositories`
TEST=`echo $ALL | grep $NAME_REPO | wc -l`
echo "Checking $NAME_REPO"
if [[ $TEST -eq 0 ]]
then
  echo 'Repository NOT found on aws'
  aws ecr create-repository --repository-name $NAME_REPO
else
  echo 'Repository found on aws'
fi

URL=`aws ecr describe-repositories | grep $NAME_REPO | grep repositoryUri | cut -d ':' -f 2 | cut -d '"' -f 2`
echo "Repository url: $URL"

cat << EOF > env.sh
#!/bin/bash
export DOCKER_IMAGE=$NAME_REPO
export URL_REPO=$URL
EOF
