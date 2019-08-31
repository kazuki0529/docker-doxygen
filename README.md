# Doxygen  Docker

## 概要

個人的なDoxygen用のDockerです。

普段使っている環境がHTTPS通信で証明書失敗するので、証明書無視 or HTTP通信するようにしています。

イメージサイズが大きいのでalpineで作り直したいが、LaTexの環境を作れる自信がない。

## 使い方

1. ``build.sh``を用意する

    ```bash
    #!/bin/bash

    doxygen && \
    cd ./dist/latex && \
    make && \
    dvipdfmx refman
    ```

1. ``docker run``する
