#!/bin/bash

# 引数チェック
if [ -z "$1" ]; then
  echo "❌ 使い方: ./scripts/transcribe.sh <音声ファイルパス>"
  exit 1
fi

INPUT="$1"

# 仮想環境のパス（必要に応じて変更してね）
VENV_PATH="./whisper-venv"

# 仮想環境の存在チェック
if [ ! -d "$VENV_PATH" ]; then
  echo "❌ 仮想環境が見つかりません: $VENV_PATH"
  exit 1
fi

# 仮想環境を有効化
source "$VENV_PATH/bin/activate"

# Whisper 実行
whisper "$INPUT" --language Japanese --model medium --output_dir transcripts

echo "📄 文字起こし完了！transcripts/ に出力されました。"
