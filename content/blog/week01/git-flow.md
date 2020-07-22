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
   git checkout -b MYFEATURE develop # develop = <set develop branch>
   ```

3. `git flow feature finish MYFEATURE` - Finish up a feature

   ``` bash
   git checkout develop
   git merge --no-ff MYFEATURE
   git branch -d MYFEATURE
   ```

4. `git flow feature publish MYFEATURE` - Publish a feature

   ``` bash
   git push
   ```

5. `git flow feature pull origin MYFEATURE` - Getting a published feature
6. `git flow feature track MYFEATURE` - Track feature on origin
7. `git flow release start RELEASE [BASE]` - Start a release