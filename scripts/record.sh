#!/bin/bash

OUTPUT="$1"
[ -z "$OUTPUT" ] && echo "❌ 出力ファイルパスが指定されていません" && exit 1

mkdir -p "$(dirname "$OUTPUT")"

echo "🎤 録音を開始します（Ctrl+Cで終了）"
ffmpeg -f avfoundation -i ":BlackHole 2ch" -ac 1 -ar 16000 "$OUTPUT"
echo "✅ 録音完了: $OUTPUT"
