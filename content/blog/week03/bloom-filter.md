---
title: Bloom Filter
date: "2020-07-28T00:00:00.000Z"
description: "Bloom Filter"
---

Kiểm tra 1 phần tử có nằm trong tập hơp?

Sử dụng k hash funcs
- Add: hash input => list value => setallbit[value] = 1
- Check: hash input => list value => getallbit[value] == 1 ?

m: size of bitset
n: number of elements
k: number of hash functions

k = (m / 2) * ln2

Ứng dụng:
- Giảm số lần đọc từ disk (key không nằm trong bloom filter)
  - Kiểm tra mật khẩu yếu
  - Kiểm tra các trang web độc hại
  - Kiểm tra username, email tồn tại, kiểm tra chính tả
  - Medium kiểm tra bài viết đã được đọc bởi user

- Hạn chế, cải tiến:
  - Bloom filter không xóa được key => counting bloom filter
  - Chú ý m,n,k


