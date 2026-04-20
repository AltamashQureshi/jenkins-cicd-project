# Local CI/CD Pipeline with Jenkins
#
A beginner-friendly Java web app with a Jenkins CI/CD pipeline using Git, Maven, and Shell Scripting.

---

## Project Structure

```
jenkins-cicd-project/
├── app/
│   ├── pom.xml
│   └── src/
│       ├── main/
│       │   ├── java/
│       │   │   └── com/
│       │   │       └── demo/
│       │   │           └── HelloServlet.java        ← main app
│       │   └── webapp/
│       │       └── WEB-INF/
│       │           └── web.xml
│       └── test/
│           └── java/
│               └── com/
│                   └── demo/
│                       └── HelloServletTest.java    ← unit tests (MUST be in com/demo/)
├── jenkins/
│   └── Jenkinsfile
├── scripts/
│   └── deploy.sh
├── .gitignore
└── README.md
```

> **IMPORTANT:** The test file `HelloServletTest.java` MUST live inside `src/test/java/com/demo/`
> not directly inside `src/test/java/`. The package declaration `package com.demo;` in the file
> must match the folder path — otherwise Maven cannot find `HelloServlet` and Jenkins build fails.

---

## Prerequisites

| Tool     | Version | Download                   |
|----------|---------|----------------------------|
| Java JDK | 11+     | https://adoptium.net       |
| Maven    | 3.8+    | https://maven.apache.org   |
| Git      | any     | https://git-scm.com        |
| Jenkins  | LTS     | https://www.jenkins.io     |

---

## Test Locally First

```bash
cd app
mvn clean package -DskipTests   # build only
mvn test                         # run tests
```

Both should print `BUILD SUCCESS` before you push to Git.

---

## Push to GitHub

```bash
cd jenkins-cicd-project
git init
git add .
git commit -m "Initial commit: CI/CD project"
git remote add origin https://github.com/YOUR_USERNAME/jenkins-cicd-project.git
git branch -M main
git push -u origin main
```

---

## Jenkins Pipeline Stages

1. **Checkout** — pulls latest code from Git
2. **Build** — `mvn clean package -DskipTests` → creates WAR file
3. **Test** — `mvn test` → runs JUnit tests
4. **Deploy** — `bash scripts/deploy.sh` → copies WAR to `/opt/deploy/`
