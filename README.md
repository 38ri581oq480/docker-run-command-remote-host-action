## About

GitHub Action to run docker command on the remote Docker host by creating Docker context using SSH connection

## Example usage 👀

### Get list of images on remote Docker host

```yaml
- name: List images on remote Docker host
  uses: 38ri581oq480/docker-run-command-remote-host-action@v0.0.1
  with:
    ssh_host_key: ${{ secrets.DOCKER_HOST_SSH_HOST_KEY }}
    ssh_private_key: ${{ secrets.DOCKER_HOST_SSH_PRIVATE_KEY }}
    docker_host: my-docker-host.com
    docker_command: image ls
```

### Deploy to remote Docker Swarm

```yaml
- name: Deploy to Docker swarm
  uses: 38ri581oq480/docker-run-command-remote-host-action@v0.0.1
  with:
    ssh_host_key: ${{ secrets.DOCKER_HOST_SSH_HOST_KEY }}
    ssh_private_key: ${{ secrets.DOCKER_HOST_SSH_PRIVATE_KEY }}
    docker_host: my-swarm-manager-node.com
    docker_command: stack deploy -c docker-compose.yml my-stack-name
```
