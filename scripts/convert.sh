#!/bin/bash

# 引数チェック
if [ -z "$1" ]; then
  echo "❌ 使い方: ./scripts/convert.sh <入力ファイルパス>"
  exit 1
fi

INPUT="$1"

# 出力ファイル名を作成（例: audio/recording-20240403-152300.wav → transcripts/cleaned-recording-20240403-152300.wav）
BASENAME=$(basename "$INPUT" .wav)
OUTPUT_DIR="transcripts"
OUTPUT="$OUTPUT_DIR/cleaned-$BASENAME.wav"

# 出力先ディレクトリがなければ作成
mkdir -p "$OUTPUT_DIR"

# 変換実行（16kHz / mono）
ffmpeg -i "$INPUT" -ac 1 -ar 16000 "$OUTPUT"

echo "🔧 音声変換完了: $OUTPUT"
