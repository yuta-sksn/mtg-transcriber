# MTG 自動で文字起こしするよ⭐️

## 概要

会議音声を自動で文字起こし・変換する CLI ツール。
Whisper を使ってローカル環境で処理します。

## 使用ツール

- [Python 3.11.11](https://www.python.org/downloads/release/python-31111/) (Whisper が安定動作するバージョン)
- [openai-whisper](https://github.com/openai/whisper) (ローカルで動作する文字起こしエンジン)
- [ffmpeg](https://ffmpeg.org/) (音声の録音・変換)
- [BlackHole](https://github.com/ExistentialAudio/BlackHole) (macOS の仮想オーディオデバイス)

## セットアップ

```bash
python -m venv whisper-venv
source whisper-venv/bin/activate
pip install -r requirements.txt

