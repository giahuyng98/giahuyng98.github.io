---
title: Git Flow
date: "2020-07-22T15:20:00.000Z"
description: "[VTF] Week 01"
---

# Git Flow vs Git

[Git flow](https://danielkummer.github.io/git-flow-cheatsheet/index.html) 

1. `git flow init`
   add some configuration at .git/config

   ``` file
   / .git/config
   ...
   [gitflow "branch"]
      master = <set master branch>
      develop = <set develop branch>
   [gitflow "prefix"]
   ...
   ```

2. `git flow feature start MYFEATURE` - Start a new feature

   ``` bash
   git checkout -b feature/MYFEATURE develop
   ```

3. `git flow feature finish MYFEATURE` - Finish up a feature

   ``` bash
   git checkout develop
   git merge --no-ff feature/MYFEATURE
   git branch -d feature/MYFEATURE
   ```

4. `git flow feature publish MYFEATURE` - Publish a feature

   ``` bash
   git checkout feature/MYFEATURE
   git push
   ```

5. `git flow feature pull origin MYFEATURE` - Getting a published feature

    ``` bash
   git checkout feature/MYFEATURE
   git pull
    ```

6. `git flow release start RELEASE [BASE]` - Start a release
    
    ``` bash
    git checkout -b release/RELEASE develop
    ```

7. `git flow release publish RELEASE` - Publish a release
    
    ``` bash
    git checkout -b release/RELEASE
    git push -u origin release/RELEASE
    ```

8. `git flow release finish RELEASE ` - Finish up a release

     ``` bash
     # Merges the release branch back into 'master'
     git checkout master
     git merge --no-ff release/RELEASE
     # Tags the release with its name
     git tag RELEASE
     # Back-merges the release into 'develop'
     git checkout develop
     git merge --no-ff release/RELEASE
     git branch -d release/RELEASE
     git push origin --tags
     ```
9. `git flow hotfix start VERSION [BASENAME] ` - Hotfix start

    ``` bash
    git checkout -b hotfix/VERSION
    ```

10. `git flow hotfix finish VERSION` - Finish a hotfix
    
    ``` bash
    git checkout master
    git merge --no-ff hotfix/VERSION
    git checkout develop
    git merge --no-ff hotfix/VERSION
    git branch -d hotfix/VERSION
    ```
