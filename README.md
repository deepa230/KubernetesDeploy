# KubernetesDeploy
Yaml files to deploy phpmyadm application to kubernetes

There are two deployments
one for phpmyadmin application and other one for mysql database

phpmyadmin application is exposed to the outside world by a service of type Nodeport

MySQL database is exposed internally to phpmyadmin application by a  service of type clusterip

There is secrets to sensitive information like password and config maps to store configuration data like hostnames and port value.
