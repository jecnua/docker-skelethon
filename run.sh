#!/bin/bash

#TODO: Change the repo name
NAME_REPO='xxx/xxx'

##

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
