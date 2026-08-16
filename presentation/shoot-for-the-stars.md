---
title: Shoot For The Stars
sub_title: "AWS Student Builder Group at Amity University Bengaluru: Cloud Foundations to Career Futures"
author: Rafał Król — Head of AWS Technologies @ Trek2Summit
theme:
  name: catppuccin-mocha
options:
  end_slide_shorthand: false
  implicit_slide_ends: false
  strict_front_matter_parsing: true
---

Welcome
=======

- Topic: Shoot For The Stars
- Series: Cloud Foundations to Career Futures
- Group: AWS Student Builder Group — Amity University Bengaluru
- Amazon Web Services (AWS): The Public Cloud ([what is AWS](https://aws.amazon.com/what-is-aws/))
- Online session · Sunday 16 August 2026 · 15:30 India Standard Time (IST)

![welcome:width:100%](../images/welcome.jpeg)

<!-- end_slide -->

Agenda
======

1. whoami
2. Foundations you can practise free
3. AWS core building blocks
4. Tools and infrastructure as code
5. Spend nothing by accident
6. Career moves
7. Homework

This session assumes no prior AWS account, no prior AWS service usage, and no prior command-line experience.

<!-- end_slide -->

whoami
======================================

I've been working with AWS for over a decade, I passed 14 AWS certification exams, I am an AWS Community Builder, I run an AWS Department for an AWS Partner company - what was my first full-time role?

<!-- pause -->
<!-- column_layout: [2, 2] -->
<!-- column: 0 -->
![airbus:width:100%](../images/spa_airbus_a320.jpeg)
<!-- column: 1 -->
![flight attendant:width:100%](../images/flight_attendant.jpeg)

<!-- end_slide -->

Every app has four parts
========================

Every app you build mixes these four parts.

- Storage: keeps files and data safe after your program stops running.
- Compute: runs your code, the processor time that does the actual work.
- Network: moves requests between users, your code, and stored data.
- Artificial intelligence (AI): adds prediction and language skills to apps.

<!--
Suggested image: four labelled boxes: storage, compute, network, AI
![image:width:60%](../images/PLACEHOLDER-four-parts.png)
-->

<!-- end_slide -->

Linux: find your way around a filesystem
========================================

Linux is the operating system most cloud servers run. You type commands into a shell, the text program that runs them ([coreutils manual](https://www.gnu.org/software/coreutils/manual/coreutils.html)).

- `cd`, `ls -la`: move between folders, list everything with sizes and dates.
- `cat`, `head`, `wc -l`: print a file, print its top, count its lines.

```bash
cd <PROJECT_DIR> # e.g. `cd ~/main/priv/aws-student-builder-group-aub-20260816-shoot-for-the-stars`
ls -la
cat README.md
head -n 20 presentation/shoot-for-the-stars.md
wc -l README.md
wc -l images/*
less presentation/shoot-for-the-stars.md
```

**⭐ Official learning material: [Introduction to Linux](https://training.linuxfoundation.org/training/introduction-to-linux/) ⭐**

<!-- end_slide -->

Containers: build once, run anywhere
====================================

A container packs your code and everything it needs into one unit that runs the same on any machine. Docker builds and runs them ([Docker docs](https://docs.docker.com/reference/cli/docker/)).

- `docker build`: turns a `Dockerfile` recipe into a reusable image.
- `docker run`: starts a container from that image on your own machine.

```bash
docker build -t <IMAGE_TAG> .
docker run --rm -p 8080:80 <IMAGE_TAG>
docker ps
```

**⭐ Official learning material: [Docker 101](https://www.docker.com/101-tutorial/) ⭐**

<!-- end_slide -->

git and GitHub: save and share your work
========================================

git records every version of your files so you can go back. GitHub hosts those records online so other people read and copy them ([git docs](https://git-scm.com/doc), [GitHub docs](https://docs.github.com/en/get-started)).

- `git clone`: copies a hosted project onto your own machine.
- `git commit`: saves your staged changes as one labelled version.
- `git push`: sends your saved versions back to GitHub.

```bash
git clone https://github.com/<GITHUB_USER>/<REPO_NAME>.git
cd <REPO_NAME>
git add .
git commit -m "Add my first change"
git push origin main
```

**⭐ Official learning material: [GitHub learn](https://learn.github.com/) ⭐**
