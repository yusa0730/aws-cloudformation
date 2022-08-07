#!/bin/bash
# 値が入っていない時に途中で止まるようにする
set -e

# Remove a potentially pre-existing server.pid for Rails.
# ポートの被りをなくす。起動していたサーバーを完全に消去する処理 A server is already running.が出ないようにする
rm -f /awsmaster/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
# 次に、コンテナのメインプロセス（DockerfileでCMDと設定されているもの）を実行します。
# exec は、現在のプロセスを、その引数を実行した結果のプロセスで置き換えます。
# つまり、exec "$@" は、コマンドライン引数で与えられたコマンドを、現在のプロセスがそれに置き換わるように実行します
exec "\$@"