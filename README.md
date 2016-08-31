# Jenkins JNLP slave Docker image

## Running

To run a Docker container

    docker run -d --restart always
        -e JENKINS_URL=127.0.0.1:8080 \
        -e JENKINS_SLAVE_NAME=slave-1 \
        -e JENKINS_JNLP_TOKEN=admin:580032c180f2ecc66af6a0faf3a37db7 \
        jenkinsci/jnlp-slave

environment variables:

* `JENKINS_URL`: (`HOST:PORT`) url for the Jenkins server
* `JENKINS_SLAVE_NAME`: 默认为slave-{1,2,3}, 设置于jenkins_home/config.xml中.
* `JENKINS_JNLP_TOKEN`: (`username:api_token`) 执行创建jenkins slave节点的用户和他的api_token值组成的字符串
