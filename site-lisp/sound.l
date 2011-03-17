; -*- Mode: Lisp; Package: editor -*-

#|
= sound - wav ファイルを再生する

* Author: MIYAMUKOK Katsuyuki ((<URL:mailto:miyamuko@gmail.com>))
* URL: ((<URL:http://miyamuko.s56.xrea.com/xyzzy/sound/intro.htm>))
* Version: 0.1


== 説明

wav ファイルを再生するためのシンプルなライブラリです
(PlaySound API の wrapper です)。

同時に 1 つの wav ファイルしか再生できません。
また、一時停止などの制御機能はありません。


== インストール

((<NetInstaller|URL:http://www7a.biglobe.ne.jp/~hat/xyzzy/ni.html>)) でインストールした場合は 4 以降を、
NetInstaller + (({ni-autoload})) を使っている人は 5 以降で OK です。

(1) の api.l が必要なのでインストールします。

    ((<URL:http://xyzzy.s53.xrea.com/wiki/index.php?%B3%C8%C4%A5lisp%2Fwinapi>))

(2) アーカイブをダウンロードします。

    ((<URL:http://miyamuko.s56.xrea.com/xyzzy/archives/sound.zip>))

(3) アーカイブを展開して、$XYZZY/site-lisp 配下にファイルをコピーします。

(4) ~/.xyzzy または $XYZZY/site-lisp/siteinit.l に以下のコードを追加します。

        ;; sound
        (require "sound")

(5) 設定を反映させるため xyzzy を再起動してください。

    ※siteinit.l に記述した場合には再ダンプが必要です。

(6) (sound-play "wav ファイル") で wav ファイルを再生できます。


== リファレンス

=== パッケージ

本ライブラリの関数は sound パッケージ (別名 snd) で定義されます。
簡単なインターフェイスとアプリ的なものは editor で定義して export しています。

=== 関数

以下の関数は editor パッケージ内で定義され export されています。

--- sound-play sound &key async loop nodefault nostop nowait

    指定された sound を再生します。sound には以下の値が指定可能です。

    * wav ファイルのファイル名 (文字列)

      wav ファイルのファイル名を指定して再生します。もっとも基本的な使い方です。

          ;; チャイムを再生する。
          (sound-play "c:/WINDOWS/Media/chimes.wav")

      なお、再生時に自動的に以下のパスが検索されるためディレクトリ名は省略できる場合があります。
      詳細は MSDN の PlaySound の説明を参照してください。

      * カレントディレクトリ
      * Windows のディレクトリ
      * Windows のシステムディレクトリ
      * 環境変数 PATH で記述されている各ディレクトリ
      * ネットワークにマップされているディレクトリ

          ;; チャイムを再生する (ディレクトリ省略)。
          (sound-play "chimes.wav")

    * サウンド識別子 (シンボル or 文字列 or 定数)

      定義済みのサウンド識別子を指定して wav ファイルを再生します。

      サウンド識別子の確認は sound-show-alias で行うことができます。
      サウンドの設定は「コントロールパネル」の「サウンドとオーディオ デバイス」
      (XP の場合) で設定します。

      サウンド識別子はシンボル・文字列・定数を指定できます。
      以下の指定はすべて同じで「Windows の起動」音を再生します。

      ex)
          (sound-play 'SystemStart)
          (sound-play :SystemStart)
          (sound-play "SystemStart")
          (sound-play winapi::SND_ALIAS_SYSTEMSTART)

      なお、Win32 API の PlaySound では Windows のサウンド識別子 (Windows の起動や Windows のログオフなど)
      のみ指定可能ですが、sound.l ではその他のプログラムのサウンド識別子
      (たとえば「エクスプローラ」の「ごみ箱を空にする」('EmptyRecycleBin) など)
      も指定可能です。

    * メモリ上に読み込んだ wav ファイル (chunk)

      ファイル名やサウンド識別子で指定すると毎回 wav ファイルをメモリ上に読み込みます。
      頻繁に再生する wav の場合、事前にメモリ上に読み込んでおいて再生することができます。

      wav ファイルのメモリ上への読み込みは snd::load-sound を利用します。

      ex)
          (defvar *chimes* (snd::load-sound "c:/WINDOWS/Media/chimes.wav"))
          (sound-play *chimes*)

    その他のキーワード引数で再生時の動作を指定できます。

    : async
        サウンドを非同期再生します。
        このオプションを指定すると再生開始後にこの関数はすぐに制御を戻します。

            (sound-play 'SystemStart :async t)

        非同期再生中のサウンドは sound-stop で停止できます。

    : loop
        サウンドを繰り返し再生します。
        :async t も同時に指定したとみなされます。

    : nodefault
        指定されたサウンドが見つからなかった場合、既定のサウンド（一般の警告音）
        を再生せずに終了します。

    : nostop
        既にサウンドが再生されている場合、なにもせずに終了します。
        このフラグを指定しなかった場合、現在再生されているサウンドを停止して
        指定された新しいサウンドを再生します。

    : nowait
        ドライバがビジー状態の場合、指定されたサウンドを再生せずに即座に制御を返します。

--- sound-play-async sound &key loop nodefault nostop nowait

    sound-play の非同期版です。wav ファイルの再生終了を待ちません。

    (sound-play sound :async t) と同じです。

--- sound-stop

    現在再生中のサウンドを停止します。
    一時停止ではなく停止するのでもう一度再生すると先頭からの再生になります。

--- sound-show-alias

    「コントロールパネル」の「サウンドとオーディオ デバイス」 (XP の場合)
    で設定されているサウンドの一覧を表示します。

    実行例)
        定義済みのサウンド識別子      説明                                    現在の設定
        ------------------------      ----                                    ----------

        ■Windows (.Default):
        .Default                      既定のビープ音                          C:\WINDOWS\media\Windows XP Ding.wav
        AppGPFault                    アプリケーション エラー                 (なし)
        CCSelect                      選択                                    (なし)
        Close                         アプリケーションの終了                  (なし)
        CriticalBatteryAlarm          バッテリ消耗アラーム                    C:\WINDOWS\media\Windows XP Battery Critical.wav
        DeviceConnect                 デバイスの接続                          C:\WINDOWS\media\Windows XP Hardware Insert.wav


以下の関数は sound (snd) パッケージ内で定義さています。

--- snd::load-sound filename
    指定されたファイルをメモリ上に読み込みます。
    戻り値はサウンドファイルの chunk とファイルサイズを多値で返します。

    ファイルが見つからない場合や読み込みに失敗した場合は simple-error を throw します。

    [注意] sound-play はいくつかのパスから指定されたサウンドファイルを検索しますが、
    snd::load-sound はパスの検索は行いません。

        (sound-play "chimes.wmv")      ;; => OK
        (snd::load-sound "chimes.wmv") ;; => NG (ファイルが見つかりません)
        (snd::load-sound "c:/WINDOWS/Media/chimes.wav") ;; => OK

--- snd::alias-p alias-name

    指定されたサウンド識別子が存在する場合 non-nil を返します。
    存在しない場合は nil を返します。

        (snd::alias-p 'SystemExit) ;; => t
        (snd::alias-p 'hoge)       ;; => nil

--- snd::alias-to-file alias-name

    指定されたサウンド識別子に設定されているサウンドファイルを返します。
    設定されていない場合は nil を返します。

        (snd::alias-to-file 'SystemExit)
        ;; => "C:\\WINDOWS\\media\\Windows XP Shutdown.wav"

--- snd::list-alias &key default-only

    サウンド識別子の一覧を返します。
    :default-only t を指定した場合、Windows のイベントのみ返します。

    以下のようなリストを返します。

        ((アプリ識別子1 "アプリ名1" ((サウンド識別子1 "サウンド名1" "ファイル名1")
                                     (サウンド識別子2 "サウンド名2" "ファイル名2")
                                       ; 繰り返し
                                     ))
         (アプリ識別子2 "アプリ名2" ((サウンド識別子1 "サウンド名1" "ファイル名1")
                                     (サウンド識別子2 "サウンド名2" "ファイル名2")
                                       ; 繰り返し
                                     ))
           ; 繰り返し
         )

=== 変数

なし


== サンプルスクリプト

* xyzzy 終了時に Windows のログオフ時のサウンドを再生する。

      (require "sound")
      (add-hook '*kill-xyzzy-hook*
                (lambda ()
                  (ignore-errors
                   (sound-play :WindowsLogoff :nowait t :nodefault t))))

* 何かするたびに「エクスプローラ」の「ナビゲーション開始」時のサウンドを再生します。

  頻繁に実行するため事前に wav ファイルをメモリ上にロードしています。

      (require "sound")
      (let ((sound (snd::load-sound (snd::alias-to-file :Navigating))))
        (add-hook '*post-command-hook*
                  (lambda (&rest ignore)
                    (ignore-errors
                     (sound-play-async sound :nowait t :nostop t :nodefault t)))))


== ToDo

* SND_RESOURCE まわり


== 既知のバグ・制限事項

* 実行可能ファイルのリソースを再生できるかはよく分かりません
  (試していません)。


== 関連するページ

: api.l
    ((<URL:http://xyzzy.s53.xrea.com/wiki/index.php?%B3%C8%C4%A5lisp%2Fwinapi>))

: Microsoft Windows と Web ページでのオーディオ プログラミング: 概要
    ((<URL:http://www.microsoft.com/japan/msdn/directx/techart/audiooverview.asp>))

: PlaySound - MSDN
    ((<URL:http://www.microsoft.com/japan/msdn/library/default.asp?url=/japan/msdn/library/ja/jpmltimd/html/_win32_playsound.asp>))


== ライセンス

sound は修正 BSD ライセンスに基づいて利用可能です。

  Copyright (C) 2005,2011 MIYAMUKO Katsuyuki. All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:

  1 Redistributions of source code must retain the above copyright notice,
  this list of conditions and the following disclaimer as the first lines
  of this file unmodified.

  2 Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  SUCH DAMAGE.
|#

(provide "winapi/sound")

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "foreign")
  (require "wip/winapi")
  (require "api"))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (find-package "sound")
    (defpackage "sound"
      (:nicknames "snd")
      (:use "lisp" "editor" "winapi"))))

(in-package "winapi")
(eval-when (:compile-toplevel :load-toplevel :execute)

  (c:*define-c-macro BYTE (x) `(logand ,x #xff))

  ;; MMSystem.h

  (c:*define SND_SYNC            #x0000)  ;; play synchronously (default)
  (c:*define SND_ASYNC           #x0001)  ;; play asynchronously
  (c:*define SND_NODEFAULT       #x0002)  ;; silence (!default) if sound not found
  (c:*define SND_MEMORY          #x0004)  ;; pszSound points to a memory file
  (c:*define SND_LOOP            #x0008)  ;; loop the sound until next sndPlaySound
  (c:*define SND_NOSTOP          #x0010)  ;; don't stop any currently playing sound

  (c:*define SND_NOWAIT      #x00002000)  ;; don't wait if the driver is busy
  (c:*define SND_ALIAS       #x00010000)  ;; name is a registry alias
  (c:*define SND_ALIAS_ID    #x00110000)  ;; alias is a predefined ID
  (c:*define SND_FILENAME    #x00020000)  ;; name is file name
  (c:*define SND_RESOURCE    #x00040004)  ;; name is resource name or atom
  (c:*define SND_PURGE           #x0040)  ;; purge non-static events for task
  (c:*define SND_APPLICATION     #x0080)  ;; look for application specific association

  (c:*define SND_ALIAS_START 0)

  (c:*define-c-macro sndAlias (ch0 ch1)
    `(+ SND_ALIAS_START (logior (BYTE (char-code ,ch0))
                                (ash (BYTE (char-code ,ch1)) 8))))

  (c:*define SND_ALIAS_SYSTEMASTERISK        (sndAlias #\S #\*))
  (c:*define SND_ALIAS_SYSTEMQUESTION        (sndAlias #\S #\?))
  (c:*define SND_ALIAS_SYSTEMHAND            (sndAlias #\S #\H))
  (c:*define SND_ALIAS_SYSTEMEXIT            (sndAlias #\S #\E))
  (c:*define SND_ALIAS_SYSTEMSTART           (sndAlias #\S #\S))
  (c:*define SND_ALIAS_SYSTEMWELCOME         (sndAlias #\S #\W))
  (c:*define SND_ALIAS_SYSTEMEXCLAMATION     (sndAlias #\S #\!))
  (c:*define SND_ALIAS_SYSTEMDEFAULT         (sndAlias #\S #\D))

  ;; BOOL WINAPI PlaySoundA(IN LPCSTR pszSound, IN HMODULE hmod, IN DWORD fdwSound);
  ;; http://www.microsoft.com/japan/msdn/library/default.asp?url=/japan/msdn/library/ja/jpmltimd/html/_win32_playsound.asp
  (c:*define-dll-entry BOOL PlaySound (LPCSTR HMODULE DWORD)
    "winmm.dll" "PlaySoundA"))

;; ----------------------------------------------------------------------

(in-package "sound")

(defmacro set-flag (value bit flag-value)
  `(if ,flag-value
       (logior ,value ,bit)
     ,value))

(defmacro set-flag! (place bit flag-value)
  `(setf ,place (set-flag ,place ,bit ,flag-value)))

(defun play-sound (sound &key
                         sync async loop
                         nodefault nostop nowait
                         alias alias-id filename memory resource
                         application
                         purge)
  (let ((sound-flags 0))
    (set-flag! sound-flags SND_SYNC sync)
    (set-flag! sound-flags SND_ASYNC async)
    (set-flag! sound-flags SND_LOOP loop)

    (set-flag! sound-flags SND_NODEFAULT nodefault)
    (set-flag! sound-flags SND_NOSTOP nostop)
    (set-flag! sound-flags SND_NOWAIT nowait)

    (set-flag! sound-flags SND_ALIAS alias)
    (set-flag! sound-flags SND_ALIAS_ID alias-id)
    (set-flag! sound-flags SND_FILENAME filename)
    (set-flag! sound-flags SND_MEMORY memory)
    (set-flag! sound-flags SND_RESOURCE resource)

    (set-flag! sound-flags SND_APPLICATION application)
    (set-flag! sound-flags SND_PURGE purge)
    ;; play!
    (not (zerop (play-sound-internal sound 0 sound-flags)))))

(defun play-sound-internal (sound &optional (hmod 0) (sound-flags 0))
  ;; このあたりは指定を間違えると xyzzy ごと落ちることがあるので
  ;; 勝手に設定する。
  (cond ((or (stringp sound) (symbolp sound))
         ;; SND_FILENAME or SND_ALIAS or SND_RESOURCE?
         (PlaySound (si:make-string-chunk (or (alias-to-file sound)
                                              sound))
                    hmod
                    (set-flag sound-flags SND_ALIAS (symbolp sound))))
        ((integerp sound)
         ;; SND_ALIAS_ID
         (PlaySound sound hmod (set-flag sound-flags SND_ALIAS_ID t)))
        ((eq (type-of sound) 'system:chunk)
         ;; SND_MEMORY
         (PlaySound sound hmod (set-flag sound-flags SND_MEMORY t)))
        (t
         ;; ?
         (PlaySound sound hmod sound-flags))))

(defun load-sound (filename)
  (setq filename (namestring filename))
  (if (file-exist-p filename)
      (setq filename (truename filename)))
  (when (special-file-p filename)
    (error "~aはデバイスファイルです" filename))
  (when (file-directory-p filename)
    (error "~aはディレクトリです" filename))
  (unless (valid-path-p filename)
    (error "~a\nファイルまたはディレクトリが見つかりません" filename))
  (unless (file-exist-p filename)
    (error "~a\nファイルが見つかりません" filename))
  (let ((size (file-length filename))
        fh chunk readsize)
    (when (zerop size)
      (error "~aは空ファイルです" filename))
    (unwind-protect
        (progn
          (setf fh (CreateFile (si:make-string-chunk filename)
                               GENERIC_READ 0 0
                               OPEN_EXISTING FILE_ATTRIBUTE_NORMAL 0))
          (when (= fh INVALID_HANDLE_VALUE)
            (error "~a\nファイルを開けませんでした" filename))
          (setf chunk (si:make-chunk nil size))
          (setf readsize (si:make-chunk nil 4))
          (when (zerop (ReadFile fh chunk size readsize 0))
            (error "~a\nファイルの読み込みに失敗しました" filename))
          (when (< (si:unpack-uint32 readsize 0) size)
            (error "~a\nファイルをすべて読み込めませんでした" filename)))
      (when fh (CloseHandle fh)))
    (values chunk size)))

;; 規定のサウンド識別子関連

(defun alias-p (alias-name)
  (not (null (find alias-name (list-alias-name)
                   :test #'string-equal))))

(defun alias-to-file (alias-name)
  (when (and alias-name
             (string-not-equal alias-name "")
             (or (symbolp alias-name) (stringp alias-name)))
    (caddr (find alias-name (mapcan #'caddr (list-alias))
                 :key #'car
                 :test #'string-equal))))

(defun list-alias (&key default-only)
  (mapcar (lambda (app)
            (list app (get-app-label app)
                  (mapcar (lambda (alias-name)
                            (list alias-name
                                  (get-alias-label alias-name)
                                  (get-current-value app alias-name)))
                          (list-app-alias app))))
          (list-apps :default-only default-only)))

(defun list-alias-name ()
  (list-registry-key "AppEvents\\EventLabels" :current-user))

(defun list-apps (&key default-only)
  (if default-only
      (list (intern ".Default"))
    (mapcar #'intern (sort (list-registry-key "AppEvents\\Schemes\\Apps" :current-user)
                           #'string-lessp))))

(defun list-app-alias (app)
  (mapcar #'intern (sort (list-registry-key (format nil "AppEvents\\Schemes\\Apps\\~A" app)
                                            :current-user)
                         #'string-lessp)))

(defun get-alias-label (alias-name)
  (ignore-errors
   (read-registry (format nil "AppEvents\\EventLabels\\~A" alias-name)
                  nil :current-user)))

(defun get-app-label (app)
  (ignore-errors
   (read-registry (format nil "AppEvents\\Schemes\\Apps\\~A" app)
                  nil :current-user)))

(defun get-current-value (app alias-name)
  (ignore-errors
   (read-registry (format nil "AppEvents\\Schemes\\Apps\\~A\\~A\\.Current" app alias-name)
                  nil :current-user)))

;; ----------------------------------------------------------------------
(in-package "editor")

(export '(sound-play
          sound-play-async
          sound-stop
          sound-show-alias))

(defun sound-play (sound &key async loop nodefault nostop nowait)
  (snd::play-sound sound
                   :async (if loop t async) :loop loop
                   :nodefault nodefault :nostop nostop :nowait nowait))

(defun sound-play-async (sound &key loop nodefault nostop nowait)
  (sound-play sound
              :async t :loop loop
              :nodefault nodefault :nostop nostop :nowait nowait))

(defun sound-stop ()
  (snd::play-sound 0 :purge t))

(defun sound-show-alias ()
  (interactive)
  (labels ((empty? (str default)
             (if (or (null str)
                     (string= str ""))
                 default
               str)))
    (let ((fmt "~29@A ~39@A ~A~%"))
      (with-output-to-temp-buffer ("*Sound Alias*")
        (format t fmt "定義済みのサウンド識別子" "説明" "現在の設定")
        (format t fmt "------------------------" "----" "----------")
        (dolist (app (snd::list-alias))
          (format t "~%■~A (~A):~%" (cadr app) (string (car app)))
          (dolist (alias (caddr app))
            (format t fmt
                    (string (car alias))
                    (empty? (cadr alias) "")
                    (empty? (caddr alias) "(なし)"))))))))

;;
;; End
;;
