#!/bin/bash

set -e

./cerbero-uninstalled -c config/cross-android-universal.cbc bootstrap
./cerbero-uninstalled -c config/cross-ios-arm64.cbc bootstrap
./cerbero-uninstalled -c config/cross-ios-sim-universal.cbc bootstrap
./cerbero-uninstalled -c config/cross-tvos-arm64.cbc bootstrap
./cerbero-uninstalled -c config/cross-tvos-sim-universal.cbc bootstrap

./cerbero-uninstalled -c config/cross-android-universal.cbc fetch gstmse-rs
./cerbero-uninstalled -c config/cross-android-universal.cbc package gstreamer-1.0

./cerbero-uninstalled -c config/cross-ios-arm64.cbc fetch gstmse-rs
./cerbero-uninstalled -c config/cross-ios-arm64.cbc package gstreamer-1.0 --artifact=xcframework

./cerbero-uninstalled -c config/cross-ios-sim-universal.cbc fetch gstmse-rs
./cerbero-uninstalled -c config/cross-ios-sim-universal.cbc package gstreamer-1.0 --artifact=xcframework

./cerbero-uninstalled -c config/cross-tvos-arm64.cbc fetch gstmse-rs
./cerbero-uninstalled -c config/cross-tvos-arm64.cbc package gstreamer-1.0 --artifact=xcframework

./cerbero-uninstalled -c config/cross-tvos-sim-universal.cbc fetch gstmse-rs
./cerbero-uninstalled -c config/cross-tvos-sim-universal.cbc package gstreamer-1.0 --artifact=xcframework

./cerbero-uninstalled xcframework gstreamer-1.0 \
    --source gstreamer-1.0-1.*-ios-arm64.xcframework.tar.xz \
    --source gstreamer-1.0-1.*-ios-simulator-universal.xcframework.tar.xz \
    --source gstreamer-1.0-1.*-tvos-arm64.xcframework.tar.xz \
    --source gstreamer-1.0-1.*-tvos-simulator-universal.xcframework.tar.xz

rm -v \
    gstreamer-1.0-android-universal-1.*-runtime.tar.xz \
    gstreamer-1.0-1.*-ios-arm64.xcframework.tar.xz \
    gstreamer-1.0-1.*-ios-simulator-universal.xcframework.tar.xz \
    gstreamer-1.0-1.*-tvos-arm64.xcframework.tar.xz \
    gstreamer-1.0-1.*-tvos-simulator-universal.xcframework.tar.xz
