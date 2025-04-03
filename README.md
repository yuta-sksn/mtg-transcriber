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

### 1. ダウンロード

```bash
git clone https://github.com/yuta-sksn/mtg-transcriber.git
cd mtg-transcriber
```

### 2. 仮想環境の作成と起動

```bash
python -m venv whisper-venv
source whisper-venv/bin/activate
```

### 3. 依存パッケージのインストール

```bash
pip install -r requirements.txt
```

### 4. ffmpeg と BlackHole のインストール (macOS)

- ffmpeg

```bash
brew install ffmpeg
```

- BlackHole (2ch)

https://existential.audio/blackhole/

### 5. 複数出力設定

普段メインで使ってる出力デバイスと、文字起こし用の仮想オーディオデバイスの複数に対して音声を出力する設定を行う。

1. mac の **Audio MIDI Setup** を開く。
2. + をクリックし、**Create Multi-Output Device** をクリック。
3. メインの出力先と "BlackHole 2ch" にチェックを入れる。
4. **System Settings** を開き、Output にて上記で作成したデバイスを選択する。

### 6. 実行権限を付与してパスを通す

- 実行権限付与

```bash
chmod +x bin/mtg-transcriber
```

- パスを通す

.zshrc, .bashrc などに以下を追加する。

```bash
export PATH="$HOME/path/to/mtg-transcriber/bin:$PATH"
```

## 使用方法

オンライン MTG やビデオ通話の時に

```bash
mtg-transcriber
```

を実行するだけ。
録音を辞める時は Ctrl + c を押す。

