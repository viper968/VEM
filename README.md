# VEM
V.E.M, Vurtial Environment Manager is a utility script for people who use python on linux, the normal system wide pip method was deamed unsafe to use due to python libraries requiring specific versions of other components, when a newer version of a component/library was downloaded and installed by pip it had a fairly large chance to break any other existing python program that required the older or newer version of the component/library that was just replaced.

There are other utilities that give more functions on what can be done when creating a python vurtial environment (PVM) like conda but those require a fair amount of setup due to those extra features, but this script uses the built-in flags to create a PVM so there is no setup except setting up python for the first time.

# How to use:
simply download the script, set it to be executable, and run it in a terminal, when entering the name for your environment it will create a folder in the directory the script is being run from with the name you provided.
After creating the PVM you wil be greated by a list of options, input the corresponding number and press enter, option 10 will produce a file in the same directory as the script is running which will contain the following:
```bash
#!/home/foo/folder/PVM_name/bin/python

# Example Python script
```
the first line can be copied and pasted to the first line of any python script to automaticly run it through the selected PVM without needing to either run the activate command within the PVM files, nor remember the path to the python executable within the PVM, this is also refered to as what ive heard it called, a crunch-bang, this is the same thing done to the VEM script so you dont have to run it by putting in ``bash VEM.sh`` into the terminal.
The rest of the options are fairly straight forward from there.

If there are any problems or issues with the script please write an issue or else i wont know if something broke or if something is missing!
