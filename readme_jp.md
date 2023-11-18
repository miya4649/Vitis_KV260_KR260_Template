# AMD (Xilinx) Vitis unified IDEで簡単に開発を始めるためのベアメタル・アプリケーション・テンプレート・プロジェクト

## このスクリプトについて

これはAMD (Xilinx) Kria KV260, KR260で開発を始めるためのテンプレート・プロジェクト生成スクリプトです。各ボード向けの最小限の構成がセットアップされ、サンプルとしてLチカ(rtl_top.v)が実装されます。

rtl_top.vをトップにしてHDLをコーディングするだけで開発を始められます。

PSの構成変更や外部ポートへの配線はVivadoのブロックデザインで行います。

## 使用方法

デフォルトではKV260用のプロジェクトが生成されます。KR260の場合は、vivado.tclの「set board_type kv260」を「set board_type kr260」に書き換えます。

### 周辺回路の準備

ボードのPMOD J2ポートに以下のように抵抗とLEDを接続します。

(ピン番号はボード上、回路図上に記載されている番号とします。)

PMOD_J2_Pin1 --- 抵抗330Ω --- (+)LED(-) --- PMOD_J2_Pin9(GND)

ボードとホストPCをUSBケーブルで接続し、電源を入れます。

### makeを使った方法

Linuxのターミナルで

$ source Vitisのインストールパス/settings64.sh

(例: $ source /opt/Xilinx/Vitis/2023.2/settings64.sh )

$ cd このディレクトリのパス

$ make vivado

(Vivadoプロジェクトの作成)

$ make vivado-run

(Synthesis, Implement, Export HW)

$ make vitis

(Vitis Unified IDEのプロジェクト作成、ビルド)

もしくは

$ make

(上記の3つを一気に行います)

Vitis Unified IDEを起動し、

File: Open Workspaceで

(このディレクトリ)/vitis_workspace を選択してOK

View: Flow を選択して表示、

FLOW: Component で Project_1_appを選択、

FLOW: Run で実行します。

### VivadoのTcl Consoleを使った方法

Vivadoを起動してメニュー: Window: Tcl Consoleで

pwd

(カレントディレクトリを確認)

cd このディレクトリのパス

source vivado.tcl

(Vivadoプロジェクト生成スクリプトを実行)

source vivado-run.tcl

(Synthesis, Implement, Export HW実行)

これでVivadoのプロジェクトがproject_1ディレクトリ以下に生成され、ビットストリーム生成、ビットストリーム付きのXSAファイルのエクスポートが行われます。

### Vitis Unified IDE の場合

Vitis Unified IDEのTerminalで、

$ pwd

(カレントディレクトリを確認)

$ cd このディレクトリのパス

(このディレクトリに移動)

$ vitis -s vitisnew.py

(Vitisプロジェクト生成スクリプトを実行。ビルドも自動実行される)

File: Open Workspaceで

(このディレクトリ)/vitis_workspace を選択してOK

View: Flow を選択して表示、

FLOW: Component で Project_1_appを選択、

FLOW: Run で実行します。

### Vitis Classic IDE の場合

Vitis Classic IDEを起動してXSCT Consoleで

xsct% pwd

(カレントディレクトリを確認)

xsct% cd このディレクトリのパス

(このディレクトリに移動)

xsct% source vitis.tcl

(Vitisプロジェクト生成スクリプトを実行。ビルドも自動実行される)

アプリケーションプロジェクトのアイコンを右クリックしてRun Asで

Single Application Debugを選択、New launch configurationをクリックして

Target Setupタブを開きUse FSBL flow for initializationをオフにして

Apply, Runで実行します。

詳しくは以下のサイトを参照してください。

Xilinx (AMD) VitisでVivadoのXSAファイルからアプリケーション・プロジェクトを作成する方法 (Stand alone, Bare metal編)

http://cellspe.matrix.jp/zerofpga/memo00001.html

## 補足事項

### RTLのサブモジュールの更新について

rtl_top.v の下位モジュールのソースコードのみを修正した時、Vivado上で更新情報が正常に取得されない場合があります。その場合、rtl_top.v にコメントの追加等でダミーの修正を行うとVivadoで捕捉されて「Refresh Changed Modules」が表示されるのでそれをクリックするとソースツリーの再読込とリセットが行われます。

例: // rev. 1 (2, 3, ...)

## ライセンスについて

このスクリプトやソースコードはパブリックドメインとします。
