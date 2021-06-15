# Start ssh-agent
eval $(ssh-agent -s)

# Add SSH private key to agent
ssh-add - <<< "$INPUT_SSH_PRIVATE_KEY"

# Create $HOME/.ssh folder for known_hosts file
mkdir $HOME/.ssh && echo "$HOME/.ssh folder created"

# Add SSH host key to known_hosts file
echo "$INPUT_DOCKER_HOST $INPUT_SSH_HOST_KEY" >> $HOME/.ssh/known_hosts

# Create Docker context using SSH
docker context create github-action --docker "host=ssh://$INPUT_DOCKER_USER@$INPUT_DOCKER_HOST"

# Execute docker command using created context
docker --context github-action $INPUT_DOCKER_COMMAND

# 🧹 Remove created Docker context
docker context rm github-action

# 🧹 Remove $HOME/.ssh folder
rm -rf $HOME/.ssh && echo "$HOME/.ssh folder removed"

# 🧹 Remove SSH private key from ssh-agent
ssh-add -D

# 🧹 Stop ssh-agent
eval $(ssh-agent -k)
