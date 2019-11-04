# PSANA Jupyter Kernel

This repository contains files needed to create a conda environment that can be used as a Jupyter Lab kernel at NERSC. It provides three files:

1. `build_from_scratch.sh` file that clone psana2 and install it to operate in NERSC. 
2. A Conda yaml file called `env_create.yaml` to create a Conda environment for PSANA. 
3. A `kernel.json` example file to use the Conda environment as a Jupyter Lab kernel. 


## Building the Conda environment

```
git clone https://github.com/llanaproject/jupyter_kernel
cd jupyter_kernel
export DIST=$PWD
chmod +x build_from_scratch.sh
./build_from_scratch.sh
```

## Installing the Conda environment as a Jupyter Lab kernel

After building the environment, the kernel has to be activated in our NERSC
account:

```
source $DIST/env.sh
conda activate $DIST/psana2_py37
python -m ipykernel install --user --name psana2_py37 --display-name psana2_py37
```

This will create a directory on `$HOME/.local/share/jupyter/kernels/psana2_py37` with a `kernel.json` file. Change its content to 

```
{
 "argv": [
   "/path/to/start_kernel.sh",
  "-f",
  "{connection_file}"
 ],
 "display_name": "Psana_python37",
 "language": "python"
}
```

Or simply copy the file provided in this repository, and chage it accordingly to your needs: 

```
cp $DIST/kernel.json $HOME/.local/share/jupyter/kernels/psana2_py37
```

At this point, you might be able to go to https://jupyter.nersc.gov and
`Psana_python37` should be shown as a kernel in your Jupyter Lab.
