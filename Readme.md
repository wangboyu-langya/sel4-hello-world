# Reorganization of seL4 docs

**Table of Contents**

- Dependencies
- Camkes
- Conclusions

## Dependencies

It's rather strange that the dependencies of seL4 are not shown somewhere conspicuous. Instead, it is hidden in one of the tutorials.

seL4 relies on a lot of depencies. If you want to set up your own environment, you have to manually install all the dependencies. However, I have written a docker file to set up all these, you can download directly at this repo.

From now on, I assume you are in this docker environment.

## Camkes

It is not my position to introduce Camkes. It is a platform built to compile the seL4 microkernel as well as applications. Although there is an [official tutorial](https://docs.sel4.systems/Tutorials/) introducing Camkes, it is actually not as helpful as the [Camkes manual](https://github.com/seL4/camkes-tool/blob/master/docs/index.md#usage).

I have to make a few complements to this manual. You should read the manual accompanied by this.

### Terninology

You should first skim through the concrete exampele at the end of **Terminology** and look for their definitions.


### Usage

First, you have to download the [camkes project](https://github.com/seL4/camkes-manifest) with repo, which is never explicitly mentioned. The docker has already downloaded this for you.

```
mkdir camkes-project
cd camkes-project
repo init -u https://github.com/seL4/camkes-manifest.git
repo sync
```

#### Running a Simple Example

Inside the *camkes-peojects* directory, you have to create a build directory following the directions:

```
mkdir build-kzm
cd build-kzm
../init-build.sh -DPLATFORM=kzm -DCROSS_COMPILER_PREFIX=arm-none-eabi- -DCAMKES_APP=simple -DSIMULATE=1
ninja
```

The docker has already done this, you can simulate directly.

#### Creating An Application

The *camkes-peojects* directory looks like this:

```
├── build-kzm
│   ├── autoconf
│   ├── CMakeFiles
│   ├── elfloader-tool
│   ├── images
│   ├── kernel
│   ├── lib
│   ├── libsel4
│   └── projects
├── kernel
│   ├── configs
│   ├── include
│   ├── libsel4
│   ├── manual
│   ├── src
│   └── tools
├── projects
│   ├── cakeml_libs
│   ├── camkes
│   ├── camkes-tool
│   ├── capdl
│   ├── global-components
│   ├── musllibc
│   ├── picotcp
│   ├── projects_libs
│   ├── seL4_libs
│   ├── seL4_projects_libs
│   ├── sel4runtime
│   └── util_libs
└── tools
    ├── pruner
    ├── riscv-pk
    ├── rumprun
    └── seL4
```

It must confuses you where the *app* directory locates.

To add self-defined applications, you need to change your directory to the following:

```
cd projects/camkes
```

You should then follow the manual to compile and run.

You would probably see some errors. If so, please delete *build-kzm* and regenerate it.

## Conclusion

You are good to go then! More interfaces of seL4 are exposed to you as you go through the manual.

Thers is also an [official tutorial](https://docs.sel4.systems/Tutorials/) which overlaps with the manual, you should try that one too.

The whole project is managed through cmake, you should read through [System configuration and building
](https://docs.sel4.systems/Developing/Building/) to deepenen your understanding of the project structure too.
