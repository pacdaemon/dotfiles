# Dotfiles

## Pre-requisites scala development
* Coursier
* Scala tooling
* JDK

### Cursier installation

```
# On Apple Silicon (M1, M2, ...):
$ curl -fL https://github.com/VirtusLab/coursier-m1/releases/latest/download/cs-aarch64-apple-darwin.gz | gzip -d > cs
# Otherwise:
$ curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-apple-darwin.gz | gzip -d > cs
$ chmod +x cs
$ ./cs setup
```

### Scala toolong
`cs install amm bloop sbt sbtn scala scala-cli scalac scalafmt`

### JDK

Installing a JDK
`cs java --jvm adopt:11 --setup`

How to get the available jdk options?
`cs java --available`
