# Jenkins JNLP slave Docker image

## Running

To run a Docker container

    docker run jenkinsci/jnlp-slave -e JENKINS_URL=127.0.0.1:8080 \
        -e JENKINS_CLOUD_NAME=docker-cloud \
        -e JENKINS_JNLP_TOKEN=admin:580032c180f2ecc66af6a0faf3a37db7

environment variables:

* `JENKINS_URL`: (`HOST:PORT`) url for the Jenkins server
* `JENKINS_CLOUD_NAME`: 默认为docker-cloud, 设置于jenkins_home/config.xml中, 可与镜像id一起生成jenkins节点名称
* `JENKINS_JNLP_TOKEN`: (`username:api_token`) 执行创建jenkins slave节点的用户和他的api_token值组成的字符串
