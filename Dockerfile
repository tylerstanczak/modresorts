# Generated by IBM TransformationAdvisor
# Wed May 05 19:05:52 UTC 2021
# Modified by Santosh Gurijala, Jarryd Novotni and Tyler Stanczak

FROM maven:3.3-jdk-8 as builder
WORKDIR /git
COPY . /git
RUN mvn clean package

FROM ibmcom/websphere-traditional:8.5.5.17-ubi

# put app and scripts and properties in /work/config
# put external libraries (e.g db drivers) in /work/config/lib
COPY --from=builder --chown=was:root /git/data/examples/*.war /work/config/
COPY --chown=was:root ./src/config /work/config
COPY --chown=was:root ./lib /work/config/lib
RUN /work/configure.sh
