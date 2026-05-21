# WEEK 2 SUMMARY

## Users & Groups
- Created users: dev, tester, auditor
- Created group: webteam
- Added dev/tester to webteam
- Commands: adduser, groupadd, usermod -aG

## Permissions
File ownership: user:group
Permissions: rwx = 421

Examples:
640 = rw-r----- (owner read/write, group read, others nothing)
755 = rwxr-xr-x (owner full, group/others read+execute)
000 = --------- (nobody, not even owner)

Commands: chmod, chown, ls -l

## Sudoers
/etc/sudoers controls sudo access
ALWAYS edit with visudo (checks syntax)
Syntax: user host=(runas) command
NOPASSWD tag skips password

## Bash Scripting
- read for input
- case for menus
- exit 0 = success, exit 1 = failure
- bash -x for debugging

## Backups & Cron
tar -czf = create compressed archive
Cron schedules tasks
crontab -e to edit, crontab -l to list

## Lessons Learned
- Recovery mode saves you when sudo breaks
- Permissions checked in order: owner → group → others
- Exit codes matter for automation
- Always test with wrong inputs (error handling)
