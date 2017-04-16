FROM jupyter/all-spark-notebook

# install sparkmagic
RUN /opt/conda/bin/pip install sparkmagic
RUN jupyter nbextension enable --py widgetsnbextension 
RUN jupyter serverextension enable --py sparkmagic

# install jupyter-spark (is this useful?)
RUN /opt/conda/bin/pip install jupyter-spark
RUN /opt/conda/bin/pip install lxml
RUN jupyter nbextension install --py --user jupyter_spark
RUN jupyter nbextension enable --py jupyter_spark
RUN jupyter serverextension enable --py jupyter_spark

# install extension configurator
RUN /opt/conda/bin/pip install jupyter_nbextensions_configurator
RUN jupyter nbextensions_configurator enable --user

# install bunch of random extensions
RUN /opt/conda/bin/pip install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user

# install jupyter-scala (uses Ammonite tools)
RUN curl -L -o /opt/conda/bin/coursier https://git.io/vgvpD && chmod +x /opt/conda/bin/coursier
RUN curl https://raw.githubusercontent.com/alexarchambault/jupyter-scala/master/jupyter-scala | sh
RUN rm /opt/conda/bin/coursier

ENV PATH /home/jovyan/.local/bin:${PATH}
COPY jupyter_notebook_config.py /home/jovyan/.jupyter/
COPY ipython_config.py /home/jovyan/.ipython/profile_default/

COPY docker-entrypoint.sh /tmp/docker-entrypoint.sh
#RUN chmod a+rx /tmp/docker-entrypoint.sh 
ENTRYPOINT ["/tmp/docker-entrypoint.sh"]
CMD [""]
