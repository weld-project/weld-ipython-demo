# Weld Demo

To setup, follow the setup instructions for Weld. Namely:

* Install LLVM 3.8
* Install Rust and Cargo

Detailed instructions on how to install LLVM and Rust are
[here](https://github.com/weld-project/weld/README.md).

Download and build Weld and the Python packages:

```
./setup.sh
```

Then, start the notebook.

```
export WELD_HOME=`pwd`/weld
jupyter notebook
```
