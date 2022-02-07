# Generated by IBM TransformationAdvisor
# Wed May 05 19:05:52 UTC 2021

FROM ibmcom/websphere-traditional:8.5.5.17-ubi

# put app and scripts and properties in /work/config
# put external libraries (e.g db drivers) in /work/config/lib
COPY --chown=was:root modresorts.war /work/config/modresorts.war
COPY --chown=was:root ./src/config /work/config
COPY --chown=was:root ./lib /work/config/lib
RUN /work/configure.sh
