#! /bin/zsh -e

swift package --allow-writing-to-directory ./docs \
    generate-documentation --target SmoldotSwift --output-path ./docs \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path smoldot-swift
