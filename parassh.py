"""
  Basic ssh connect client using Paramiko (https://pypi.python.org/pypi/paramiko/)
  Connects to tunnel then asks user to run commands.
"""
import paramiko
import getpass

pw = getpass.getpass()

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect('127.0.0.1', port=22, username='admin', password=pw)

while True:
    cmd = raw_input("Command to run: ")
    if cmd == "":
        break
    ssh_stdin, ssh_stdout, ssh_stderr = ssh.exec_command(cmd)
    output = ssh_stdout.read()
    output = output[:len(output)-1] #remove newline
    print output
ssh.close()
