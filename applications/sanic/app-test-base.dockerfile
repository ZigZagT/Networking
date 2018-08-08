# Template Dockerfile for All Sanic Based Testing Apps
# Remember to replace XXX with your app's name
ARG DOCKER_REGISTRY
ARG BUILD_TAG
FROM ${DOCKER_REGISTRY}/XXX:${BUILD_TAG}-test

# Add tests files
COPY requirements.txt requirements-test.txt ./
COPY tests tests

# Install dependencies, no cleanup
RUN pip install -r requirements-test.txt