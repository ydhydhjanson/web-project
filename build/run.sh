#!/bin/sh
package_name=web-project
package_suffix=war
package_path="${WORKSPACE}/target/${package_name}.${package_suffix}"
target_path="${JENKINS_HOME}/build"
#echo "package_path:${package_path}"
cp ${package_path} ${target_path}
./docker-compose.sh
