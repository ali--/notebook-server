# Copyright 2016 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#from notebook.services.config import ConfigManager
#from jupyter_core.paths import jupyter_config_dir
c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False
c.NotebookApp.trust_xheaders = True
c.MultiKernelManager.default_kernel_name = 'python2'

# Update args used to start pyspark.SparkContext
assets_dir = "/home/jovyan/assets"
args = ("--class org.apache.spark.sql.hive.thriftserver.sparklinedata.HiveThriftServer2"
       ,"--jars " + os.path.join(assets_dir,"snap-assembly-1.0.0-SNAPSHOT.jar")
       ,"--verbose" 
       ,"pyspark-shell"
       )
args = " ".join(args)
