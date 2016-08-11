# -*- encoding: utf-8 -*-
import os

container_id = os.environ['HOSTNAME']
jenkins_url = os.environ['JENKINS_URL']
cloud_name = os.environ['JENKINS_CLOUD_NAME']
slave_name = cloud_name + '-' + container_id

jar_path = "/usr/share/jenkins/slave.jar"
jnlp_url = "http://{}/computer/{}/slave-agent.jnlp".format(jenkins_url, slave_name)
jnlp_token = os.environ['JENKINS_JNLP_TOKEN']

connect_command = "java -jar {} -jnlpUrl {} -jnlpCredentials {}".format(jar_path, jnlp_url, jnlp_token)

os.system(connect_command)
