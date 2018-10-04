#Reset master branch:
cd C:\dev\ws\chocofest
git checkout master
git reset cbd2fac60d20780c71fb8e0638fd069c3916c389 --hard
git push --force

#Squash dev commits to optimize
git checkout dev

$numCommits = (git rev-list --count dev) - 1

# Reset the current branch to the commit just before the last 12:
git reset --hard HEAD~$numCommits

# HEAD@{1} is where the branch was just before the previous command.
# This command sets the state of the index to be as it would just
# after a merge from that commit:
git merge --squash "HEAD@{1}"

# Commit those squashed changes.  The commit message will be helpfully
# prepopulated with the commit messages of all the squashed commits:
git commit -m "Squashed all commits"
git push --force

#restore VM snapshot
& "C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe" -T ws revertToSnapshot "C:\Users\Mark Johnson\OneDrive\Documents2\Virtual Machines\s16-prod\s16-prod.vmx" "Inedo Agent Installed"
& "C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe" -T ws start "C:\Users\Mark Johnson\OneDrive\Documents2\Virtual Machines\s16-prod\s16-prod.vmx" 
