# WEEK 2 COMPLETE NOTES

## Day 1-2: User & Groups

## Commands learned: 
- `sudo adduser username` - creates user with home directory.
- `sudo groupadd groupname` - creates group.
- `sudo usermod -aG group user` -add user to group (-a = append, don't replace)
- `groups username` - see which groups user belongs to.
- `id username` - detailed user info (UID, GID, groups)

### Users created: 
- dev
- tester
- auditor

### Groups created:
- Webteam (contains dev and tester)

### Key location: 
- `/srv/webapp` = shared directory for webteam

----

## Day 3: Permission & Ownership

### Permission model:
Every file has: 
1. Owner (one user)
2. Group (one group)
3. Permissions for: owner / group / others

### Numeric Permission:
r(read)=4
w(write)=2
x(execute)=1

examples:
- 755 = rwxr-xr-x (owner full, others read+execute)
- 644 = rw-r--r-- (owner read/write, others read)
- 600 = rw------- (owner read/write, other nothing)
- 000 = --------- (no one, not even owner without sudo)

### Commands: 
- `chmod 640 file` - set numeric permissions
- `chown user:group file` - change ownership
- `ls -l` - view permissions

### /sev/webapp contents:
ls -l /srv/webapp
total 8
-rw-r--r-- 1 root       root   21 May  8 02:00 important.conf
-rw-r--r-- 1 root       root    0 May  6 04:12 root-file.txt
-rw------- 1 nightwatch family 84 May  6 04:36 share.txt

----

## Day 3: Sudoers

### Location: `/etc/sudoers`
**Never edit directly** - always use `sudo visudo`(checks syntax before saving)

## Syntax:

user host=(runas)command
e.g,
`dev ALL=(ALL) NOPASSWD:/usr/bin/systemctl restart nginx`

Means: `dev` can restart nginx without password. 

### The scary lesson:
I broke sudoers by editing with nano instead of visudo. Got locked out. Recovered using:
1. Reboot → GRUB → Recovery mode
2. Root shell
3. `mount -o remount,rw /`
4. `cp /etc/sudoers.bak /etc/sudoers`
5. Reboot

**Lesson: backups saves you.**

----

## Day 4: Bash Scripting 

### Interactive script with case statement:

```bash
read -p "prompt" variable 
```

Waits for user input, stores in variable. 

### Case syntax: 
```bash
case $variable in 
 1)
  commands
  ;;
 *)
  default
  ;;
esac
```

### Exit codes:
- `exit 0` - success
- `exit 1` - failure
- `$?` - holds exit code of last command

### Debug mode: 
```bash
bash -x script.sh
```

Shows every line as it executes.

---

## Day 5: Backup & Cron

### tar flags:
- `-c` - creates archive
- `-z` - gzip compress
- `-f` - filename

Example:
```bash
tar -czf backup.tar.gz /path/to/folder
```

### basename:
Extracts filename from path.
basename/home/hassam/projects → projects

### Cron syntax: 

command
│ │ │ │ │
│ │ │ │ └─ day of week (0-7)
│ │ │ └─── month (1-12)
│ │ └───── day (1-31)
│ └─────── hour (0-23)
└───────── minute (0-59)

e.g,
- `0 14 * * *` - 2 PM daily.
- `*/15 * * *` - every 15 minutes
- `0 0 * * 0` - midnight Sunday

### Cron commands: 
- `crontab -e` - edit jobs
- `crontab -l` - list jobs
- `crontab -r` - remove ALL (careful)

### Troubleshooting cron: 
```bash
journalctl -u cron --since "1 hour ago"
grep CRON /var/log/syslog
```

---

## Self-Test Questions. 

**Q: File has permissions 640, owner root, group webteam. Can auditor (not in webteam) read it?**

A: NO. He's the "others." and others are 0, no permission. 

**Q: What happens if I run `sudo rm - rf /` as root?**

A: Complete system destruction. Everything will be deleted. sudo is GOD. NEVER DO THIS SHIT. 

**Q: Can file owner change permission without being in sudo group?**

A: Yes, File owner can always chmod their own files. but they cannot show to anyone else without sudo. 

**Q: Why use visudo instead of nano /etc/sudoers?**

A: visudo checks syntax before saving. Prevents breaking sudo access. 

---

## Week 2 Complete. 

- Multi-user system management
- Permission model (rwx, numeric)
- Sudoers configuration 
- Bash scripting (read, case, exit codes)
- Bash automation (tar)
- Tast scheduling (cron) 
- Log investigation (journalctl)
- System recovery (recovery mode) 

