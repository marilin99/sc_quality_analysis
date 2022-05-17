# These notebooks were ran from https://jupyter.hpc.ut.ee/

### Running terminal commands from a HPC Jupyter kernel

In order for `!` to work in our custom kernel, you have to modify a kernel file of your environment.

First of all, log into rocket.hpc.ut.ee. In you home directory find your environment kernel file kernel.json, which is usually located in `~/.local/share/jupyter/kernels/<your env name>/kernel.json.`
Secondly, get the environment bin path with the following command:
`cat ~/.local/share/jupyter/kernels/<your env name/kernel.json | grep -o '/[^"]' | sed 's,/[^/]$,,'`
The output from the previous command needs to be copied into your clipboard.

3. Finally, open `kernel.json`.

Copy the following snippet into `kernel.json` file:

    "env": {
      "PATH": "<your env bin path>:/gpfs/software/soft/rocket/linux-centos7-x86_64/gcc-9.2.0/openssl-1.1.1g-pikmcqfnphdwr5n32225b7rf4fpksnr2/bin:/sbin:/bin:/usr/sbin:/usr/bin"
    }
NB! Add a comma at the end of the previous line and ensure } is present! json has structure.

4. Replace `<your env bin path>` with your clipboard content.

5. Save the file. restart Jupyter if you have it running.

At the end, your kernel.json should look something like:

    {
     "argv": [
      "/gpfs/space/home/user/.conda/envs/user_env/bin/python",
      "-m",
      "ipykernel_launcher",
      "-f",
      "{connection_file}"
     ],
     "display_name": "user_env",
     "language": "python",
     "metadata": {
      "debugger": true
     },
     "env": {
      "PATH": "/gpfs/space/home/user/.conda/envs/user_env/bin:/gpfs/space/software/jupyterhub/python/jupyter/bin:/gpfs/software/soft/rocket/linux-centos7-x86_64/gcc-9.2.0/openssl-1.1.1g-pikmcqfnphdwr5n32225b7rf4fpksnr2/bin:/sbin:/bin:/usr/sbin:/usr/bin"
     }
    }