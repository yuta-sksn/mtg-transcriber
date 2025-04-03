#!/bin/bash

# タイムスタンプ付きファイル名を共通で使いたいので一度だけ生成
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
RAW_AUDIO="audio/recording-$TIMESTAMP.wav"
CLEANED_AUDIO="transcripts/cleaned-recording-$TIMESTAMP.wav"

# ステップ①：録音
./scripts/record.sh "$RAW_AUDIO"
if [ $? -ne 0 ]; then
  echo "❌ 録音に失敗しました"
  exit 1
fi

# ステップ②：音声フォーマット変換
./scripts/convert.sh "$RAW_AUDIO"
if [ $? -ne 0 ]; then
  echo "❌ 音声変換に失敗しました"
  exit 1
fi

# ステップ③：文字起こし
./scripts/transcribe.sh "$CLEANED_AUDIO"
if [ $? -ne 0 ]; then
  echo "❌ 文字起こしに失敗しました"
  exit 1
fi

echo "🎉 全処理が正常に完了しました！"
