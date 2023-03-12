# Run all as default
all: clean build test

# Clean cmake build
clean:
	rm -rf build-vscode

# Build cmake
build:
	/usr/bin/cmake --no-warn-unused-cli -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=Debug -DCMAKE_C_COMPILER:FILEPATH=/usr/bin/gcc -DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++ -S. -B./build-vscode -G "Unix Makefiles"

# Build and run tests
test:
	/usr/bin/cmake --build /home/rodrigo/repos/sandbox/gcc/build-vscode --config Debug --target all -j 14 --
	/usr/bin/ctest -j14 --test-dir ./build-vscode -C Debug -T test --output-on-failure
