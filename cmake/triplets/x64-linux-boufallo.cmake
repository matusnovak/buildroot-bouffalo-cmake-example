set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE static)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_CMAKE_SYSTEM_NAME Linux)

# Unfortunately setting -DSOMETHING=foo during CMake configuration will not
# be forwarded through CMake to this file. I don't know why.
# So, as a workaround, we have to hard code it here :(
# Even though we provide this chainload toolchain file
# via command line we also have to define it here.
set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "/opt/riscv64-buildroot-linux-gnu_sdk-buildroot/share/buildroot/toolchainfile.cmake")
