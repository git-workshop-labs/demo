# GIT to the Next Level Demo Project

This project is used during the "GIT to the next level" wintercloud training.

## Commit conventions

For the presentation we use the following git commit message labesl:

* [story] Wrtiting of the story, chracters or anything related to the content of the story
* [setup] setup of the gitpod and the project in general
* [auto] automation, ci/cd e.t.c.
* [style] formatting, styling, e.t.c.
* [doc] documentation, like this document
* [legal] Licensing information and other stuff related to legal

## Switching demos

### Setup

Demos werden durch tags markiert. Die Konvention für den namen der tags ist:

```
demo/<demo-name>/<branch-name>
```

Das bedeutet, dass für die Demo `<demo-name>` der Branch `<branch-name>`
auf diesen Commit gesetzt werden soll.

### Demo wechslen

Mit dem Script `./scripts/switch_to_demo.sh` kann auf eine Demo gewechselt werden. Dann wird für jeden Tag, der oben genanntent Form mit der entsprehenden
Demo wird der Branch auf diesen Tag gesetzt. Ausserdem werden allo lokalen Änderungen gelöscht und auch alle branches.