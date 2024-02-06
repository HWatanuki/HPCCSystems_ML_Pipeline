FROM gitpod/workspace-full

RUN sudo apt-get -y update

# Install the latest hpccsystems clienttools and required ML bundles.
WORKDIR /tmp

RUN wget https://cdn.hpccsystems.com/releases/CE-Candidate-9.4.30/bin/platform/hpccsystems-platform-community_9.4.30-1jammy_amd64_withsymbols.deb
RUN sudo apt-get install -y --fix-missing ./hpccsystems-platform-community_9.4.30-1jammy_amd64_withsymbols.deb
RUN rm -f hpccsystems-platform-community_9.4.30-1jammy_amd64_withsymbols.deb
COPY ./environment/*.xml /etc/HPCCSystems

RUN ecl bundle install https://github.com/hpcc-systems/ML_Core.git
RUN ecl bundle install https://github.com/hpcc-systems/LearningTrees.git
RUN ecl bundle install https://github.com/hpcc-systems/Visualizer.git
RUN ecl bundle install https://github.com/hpcc-systems/DataPatterns.git
