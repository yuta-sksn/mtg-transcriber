#!/bin/bash

# 🔐 スクリプトのディレクトリを絶対パスで取得
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# タイムスタンプ付きファイル名
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
RAW_AUDIO="$SCRIPT_DIR/../audio/recording-$TIMESTAMP.wav"
CLEANED_AUDIO="$SCRIPT_DIR/../transcripts/cleaned-recording-$TIMESTAMP.wav"

# ステップ①：録音
"$SCRIPT_DIR/record.sh" "$RAW_AUDIO"
if [ $? -ne 0 ]; then
  echo "❌ 録音に失敗しました"
  exit 1
fi

# ステップ②：変換
"$SCRIPT_DIR/convert.sh" "$RAW_AUDIO"
if [ $? -ne 0 ]; then
  echo "❌ 音声変換に失敗しました"
  exit 1
fi

# ステップ③：文字起こし
"$SCRIPT_DIR/transcribe.sh" "$CLEANED_AUDIO"
if [ $? -ne 0 ]; then
  echo "❌ 文字起こしに失敗しました"
  exit 1
fi

echo "🎉 全処理が正常に完了しました！"
