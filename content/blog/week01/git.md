---
title: first time learn git
date: "2020-07-22T15:20:00.000Z"
description: "[VTF] Week 01"
---

# Note Git

_Date: 09/07/2020_  
_Updated: 14/07/2020_  
_Author: huyng2_

## 1. Why

  It's useful

- Quản lý các phiên bản file, merge code
- Hỗ trợ nhiều người làm việc với nhau

## 2. What, How

Git là 1 version control system (quản lý phiên bản file + thư mục)

- Remote: Phiên bản được lưu trên server: github, gitlab,...  
- Local: Phiên bản được clone, pull về máy local
- Một remote repository có thể có nhiều local khác nhau, trên một hoặc nhiều máy, với nhiều người dùng.
- Một local repository có thể có nhiều remote khác nhau, mỗi remote có tên, tên có thể trùng nhau.
- Cài đặt git trên ubuntu: ```sudo apt install git-all```
- Các file config:
  - ```/etc/gitconfig```: file config dùng cho tất cả user
  - ```~/.gitconfig```: file config cho user hiện tại
  - ```.git/config```: file config của repository
- Thực hiện lấy file trên remote về máy local:  

    ``` bash
    git clone <URL>
    # hoặc
    mkdir <directory>
    cd <directory>
    git init
    git pull <URL>

    ```

- Thực hiện up lên remote:

    ``` bash
    git push [remote name] [branch name]
    # gắn thêm remote
    git remote add <remote name> <url>
    ```

- Quy trình cơ bản:
  - Bước 1: Chỉnh sửa các file: Thay đổi nội dung, thêm, xóa.
  - Bước 2: Chọn những file đã thay đổi (có liên quan đến nhau) thêm vào chỉ mục (Index)

      ``` bash
        git add <files>
      ```

  - Bước 3: Commit (Lưu lại lịch sử) những thay đổi này, mỗi commit sẽ có 1 **hash code** tương ứng.

      ``` bash
        git commit -m "commited message"
      ```

  - Bước 4: public thay đổi lên remote, (tạo pull/merge request)

- Branch (Nhánh): Nhánh là một phiên bản file được tách ra từ một nhánh khác, mục đính phát triển tính năng mới, sửa lỗi, tạo phiên bản khác... Nhánh có thể  merge với các nhánh khác.
  
  ``` bash
  # Xem các nhánh hiện tại, và nhánh đang đang làm việc:
  git branch
  # Tách ra một nhánh mới từ nhánh đang đứng:
  git checkout -b <branch-name>
  # Chuyển sang branch khác, commit, file:
  git checkout <name>
  # Merge code từ branch khác vào branch đang làm việc
  git merge <branch-name>
  # Xóa branch
  git branch -d <branch-name>
  ```
  
- Merge conflict: Git không thể tự động giải quyết các xung đột giữa 2 commit, xảy ra khi merge branch, rebase, cherry-pick.
  
  ``` bash
  # Vd nội dung file merge conflict
  <<<<<<< HEAD
  nội dung 1
  =======
  nội dung 2
  >>>>>>> branch_or_commit

  # Ta chỉnh sửa file này (có thể dùng tool), git add, git commit đề resolve conflict
  # Một số lệnh kiểm tra sử lý khi xảy ra merge conflict
  git status
  git log --merge
  git diff
  git checkout
  git reset --mixed
  git merge --abort
  ```

- Tag: Gắn nhãn cho commit
  - Lightweight tag: Tag đặt tên 
  - Anotation tag: Tag kèm theo thông tin
  
  ``` bash
  git tag <tag-name> <commit-code>
  git tag -a
  ```

- Detacted HEAD: Là việc checkout vào một commit (not branch), khi thay đổi nội dung file trong chế độ detacted HEAD nội dung thay đổi sẽ không thuộc vào bất cứ branch nào.
