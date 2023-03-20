set -e -o

./build-support/copy-deps-versionfile.sh

cd pkg/manylinux2014 && docker build -t python-pulsar-whl-builder --build-arg PLATFORM=x86_64 --build-arg ARCH=x86_64 --build-arg PYTHON_VERSION=3.7 --build-arg PYTHON_SPEC=cp37-cp37m .

cd ../.. && docker run --rm -v .:/pulsar-client-python python-pulsar-whl-builder /pulsar-client-python/pkg/build-wheel-inside-docker.sh