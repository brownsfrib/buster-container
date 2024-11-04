# Easy setup of a buster container on fishtank machines
Steps to install:
1. Go into whatever directory you're working in that you'd like to containerize and pull the repo with
   ```console
   git clone https://github.com/brownsfrib/buster-container.git
   ```
2. Copy the start_env.sh, container.sh, .bashrc, .bash_aliases, and .bash_functions files from the clone **buster-container** directory into your project directory.
   ```console
   cd buster-container; cp -t ../ start_env.sh container.sh .bashrc .bash_aliases .bash_functions; cd ../
   ```

3. Open start_env.sh and change the variable *imgName* to whatever you want your environment to be called.
4. Source the start_env.sh script
   ```console
   . start_env.sh
   ```
5. Edit your .bashrc however you want!
  - If you want to see the changes to your bashrc, you can type *resetEnv*. This is a bash command set in the .bash_functions file.

I'm becoming a big fan of containers because with both python and C/C++ (ROOT included) you can pull environment variables.
This is really helpful if you're writing a lot of code and want to stay organized. \
Other than that, this is just a nice way to make sure your code is deployable/sandboxed (sorta) from the rest of the cluster :)
