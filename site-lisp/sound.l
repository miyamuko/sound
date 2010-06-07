; -*- Mode: Lisp; Package: editor -*-

#|
= sound - wav �t�@�C�����Đ�����

* Author: MIYAMUKOK Katsuyuki ((<URL:mailto:miyamuko@gmail.com>))
* URL: ((<URL:http://miyamuko.s56.xrea.com/xyzzy/sound/intro.htm>))
* Version: 0.1


== ����

wav �t�@�C�����Đ����邽�߂̃V���v���ȃ��C�u�����ł�
(PlaySound API �� wrapper �ł�)�B

������ 1 �� wav �t�@�C�������Đ��ł��܂���B
�܂��A�ꎞ��~�Ȃǂ̐���@�\�͂���܂���B


== �C���X�g�[��

((<NetInstaller|URL:http://www7a.biglobe.ne.jp/~hat/xyzzy/ni.html>)) �ŃC���X�g�[�������ꍇ�� 4 �ȍ~���A
NetInstaller + (({ni-autoload})) ���g���Ă���l�� 5 �ȍ~�� OK �ł��B

(1) �� api.l ���K�v�Ȃ̂ŃC���X�g�[�����܂��B

    ((<URL:http://xyzzy.s53.xrea.com/wiki/index.php?%B3%C8%C4%A5lisp%2Fwinapi>))

(2) �A�[�J�C�u���_�E�����[�h���܂��B

    ((<URL:http://miyamuko.s56.xrea.com/xyzzy/archives/sound.zip>))

(3) �A�[�J�C�u��W�J���āA$XYZZY/site-lisp �z���Ƀt�@�C�����R�s�[���܂��B

(4) ~/.xyzzy �܂��� $XYZZY/site-lisp/siteinit.l �Ɉȉ��̃R�[�h��ǉ����܂��B

        ;; sound
        (require "sound")

(5) �ݒ�𔽉f�����邽�� xyzzy ���ċN�����Ă��������B

    ��siteinit.l �ɋL�q�����ꍇ�ɂ͍ă_���v���K�v�ł��B

(6) (sound-play "wav �t�@�C��") �� wav �t�@�C�����Đ��ł��܂��B


== ���t�@�����X

=== �p�b�P�[�W

�{���C�u�����̊֐��� sound �p�b�P�[�W (�ʖ� snd) �Œ�`����܂��B
�ȒP�ȃC���^�[�t�F�C�X�ƃA�v���I�Ȃ��̂� editor �Œ�`���� export ���Ă��܂��B

=== �֐�

�ȉ��̊֐��� editor �p�b�P�[�W���Œ�`���� export ����Ă��܂��B

--- sound-play sound &key async loop nodefault nostop nowait

    �w�肳�ꂽ sound ���Đ����܂��Bsound �ɂ͈ȉ��̒l���w��\�ł��B

    * wav �t�@�C���̃t�@�C���� (������)

      wav �t�@�C���̃t�@�C�������w�肵�čĐ����܂��B�����Ƃ���{�I�Ȏg�����ł��B

          ;; �`���C�����Đ�����B
          (sound-play "c:/WINDOWS/Media/chimes.wav")

      �Ȃ��A�Đ����Ɏ����I�Ɉȉ��̃p�X����������邽�߃f�B���N�g�����͏ȗ��ł���ꍇ������܂��B
      �ڍׂ� MSDN �� PlaySound �̐������Q�Ƃ��Ă��������B

      * �J�����g�f�B���N�g��
      * Windows �̃f�B���N�g��
      * Windows �̃V�X�e���f�B���N�g��
      * ���ϐ� PATH �ŋL�q����Ă���e�f�B���N�g��
      * �l�b�g���[�N�Ƀ}�b�v����Ă���f�B���N�g��

          ;; �`���C�����Đ����� (�f�B���N�g���ȗ�)�B
          (sound-play "chimes.wav")

    * �T�E���h���ʎq (�V���{�� or ������ or �萔)

      ��`�ς݂̃T�E���h���ʎq���w�肵�� wav �t�@�C�����Đ����܂��B

      �T�E���h���ʎq�̊m�F�� sound-show-alias �ōs�����Ƃ��ł��܂��B
      �T�E���h�̐ݒ�́u�R���g���[���p�l���v�́u�T�E���h�ƃI�[�f�B�I �f�o�C�X�v
      (XP �̏ꍇ) �Őݒ肵�܂��B

      �T�E���h���ʎq�̓V���{���E������E�萔���w��ł��܂��B
      �ȉ��̎w��͂��ׂē����ŁuWindows �̋N���v�����Đ����܂��B

      ex)
          (sound-play 'SystemStart)
          (sound-play :SystemStart)
          (sound-play "SystemStart")
          (sound-play winapi::SND_ALIAS_SYSTEMSTART)

      �Ȃ��AWin32 API �� PlaySound �ł� Windows �̃T�E���h���ʎq (Windows �̋N���� Windows �̃��O�I�t�Ȃ�)
      �̂ݎw��\�ł����Asound.l �ł͂��̑��̃v���O�����̃T�E���h���ʎq
      (���Ƃ��΁u�G�N�X�v���[���v�́u���ݔ�����ɂ���v('EmptyRecycleBin) �Ȃ�)
      ���w��\�ł��B

    * ��������ɓǂݍ��� wav �t�@�C�� (chunk)

      �t�@�C������T�E���h���ʎq�Ŏw�肷��Ɩ��� wav �t�@�C������������ɓǂݍ��݂܂��B
      �p�ɂɍĐ����� wav �̏ꍇ�A���O�Ƀ�������ɓǂݍ���ł����čĐ����邱�Ƃ��ł��܂��B

      wav �t�@�C���̃�������ւ̓ǂݍ��݂� snd::load-sound �𗘗p���܂��B

      ex)
          (defvar *chimes* (snd::load-sound "c:/WINDOWS/Media/chimes.wav"))
          (sound-play *chimes*)

    ���̑��̃L�[���[�h�����ōĐ����̓�����w��ł��܂��B

    : async
        �T�E���h��񓯊��Đ����܂��B
        ���̃I�v�V�������w�肷��ƍĐ��J�n��ɂ��̊֐��͂����ɐ����߂��܂��B

            (sound-play 'SystemStart :async t)

        �񓯊��Đ����̃T�E���h�� sound-stop �Œ�~�ł��܂��B

    : loop
        �T�E���h���J��Ԃ��Đ����܂��B
        :async t �������Ɏw�肵���Ƃ݂Ȃ���܂��B

    : nodefault
        �w�肳�ꂽ�T�E���h��������Ȃ������ꍇ�A����̃T�E���h�i��ʂ̌x�����j
        ���Đ������ɏI�����܂��B

    : nostop
        ���ɃT�E���h���Đ�����Ă���ꍇ�A�Ȃɂ������ɏI�����܂��B
        ���̃t���O���w�肵�Ȃ������ꍇ�A���ݍĐ�����Ă���T�E���h���~����
        �w�肳�ꂽ�V�����T�E���h���Đ����܂��B

    : nowait
        �h���C�o���r�W�[��Ԃ̏ꍇ�A�w�肳�ꂽ�T�E���h���Đ������ɑ����ɐ����Ԃ��܂��B

--- sound-play-async sound &key loop nodefault nostop nowait

    sound-play �̔񓯊��łł��Bwav �t�@�C���̍Đ��I����҂��܂���B

    (sound-play sound :async t) �Ɠ����ł��B

--- sound-stop

    ���ݍĐ����̃T�E���h���~���܂��B
    �ꎞ��~�ł͂Ȃ���~����̂ł�����x�Đ�����Ɛ擪����̍Đ��ɂȂ�܂��B

--- sound-show-alias

    �u�R���g���[���p�l���v�́u�T�E���h�ƃI�[�f�B�I �f�o�C�X�v (XP �̏ꍇ)
    �Őݒ肳��Ă���T�E���h�̈ꗗ��\�����܂��B

    ���s��)
        ��`�ς݂̃T�E���h���ʎq      ����                                    ���݂̐ݒ�
        ------------------------      ----                                    ----------

        ��Windows (.Default):
        .Default                      ����̃r�[�v��                          C:\WINDOWS\media\Windows XP Ding.wav
        AppGPFault                    �A�v���P�[�V���� �G���[                 (�Ȃ�)
        CCSelect                      �I��                                    (�Ȃ�)
        Close                         �A�v���P�[�V�����̏I��                  (�Ȃ�)
        CriticalBatteryAlarm          �o�b�e�����ՃA���[��                    C:\WINDOWS\media\Windows XP Battery Critical.wav
        DeviceConnect                 �f�o�C�X�̐ڑ�                          C:\WINDOWS\media\Windows XP Hardware Insert.wav


�ȉ��̊֐��� sound (snd) �p�b�P�[�W���Œ�`���Ă��܂��B

--- snd::load-sound filename
    �w�肳�ꂽ�t�@�C������������ɓǂݍ��݂܂��B
    �߂�l�̓T�E���h�t�@�C���� chunk �ƃt�@�C���T�C�Y�𑽒l�ŕԂ��܂��B

    �t�@�C����������Ȃ��ꍇ��ǂݍ��݂Ɏ��s�����ꍇ�� simple-error �� throw ���܂��B

    [����] sound-play �͂������̃p�X����w�肳�ꂽ�T�E���h�t�@�C�����������܂����A
    snd::load-sound �̓p�X�̌����͍s���܂���B

        (sound-play "chimes.wmv")      ;; => OK
        (snd::load-sound "chimes.wmv") ;; => NG (�t�@�C����������܂���)
        (snd::load-sound "c:/WINDOWS/Media/chimes.wav") ;; => OK

--- snd::alias-p alias-name

    �w�肳�ꂽ�T�E���h���ʎq�����݂���ꍇ non-nil ��Ԃ��܂��B
    ���݂��Ȃ��ꍇ�� nil ��Ԃ��܂��B

        (snd::alias-p 'SystemExit) ;; => t
        (snd::alias-p 'hoge)       ;; => nil

--- snd::alias-to-file alias-name

    �w�肳�ꂽ�T�E���h���ʎq�ɐݒ肳��Ă���T�E���h�t�@�C����Ԃ��܂��B
    �ݒ肳��Ă��Ȃ��ꍇ�� nil ��Ԃ��܂��B

        (snd::alias-to-file 'SystemExit)
        ;; => "C:\\WINDOWS\\media\\Windows XP Shutdown.wav"

--- snd::list-alias &key default-only

    �T�E���h���ʎq�̈ꗗ��Ԃ��܂��B
    :default-only t ���w�肵���ꍇ�AWindows �̃C�x���g�̂ݕԂ��܂��B

    �ȉ��̂悤�ȃ��X�g��Ԃ��܂��B

        ((�A�v�����ʎq1 "�A�v����1" ((�T�E���h���ʎq1 "�T�E���h��1" "�t�@�C����1")
                                     (�T�E���h���ʎq2 "�T�E���h��2" "�t�@�C����2")
                                       ; �J��Ԃ�
                                     ))
         (�A�v�����ʎq2 "�A�v����2" ((�T�E���h���ʎq1 "�T�E���h��1" "�t�@�C����1")
                                     (�T�E���h���ʎq2 "�T�E���h��2" "�t�@�C����2")
                                       ; �J��Ԃ�
                                     ))
           ; �J��Ԃ�
         )

=== �ϐ�

�Ȃ�


== �T���v���X�N���v�g

* xyzzy �I������ Windows �̃��O�I�t���̃T�E���h���Đ�����B

      (require "sound")
      (add-hook '*kill-xyzzy-hook*
                (lambda ()
                  (ignore-errors
                   (sound-play :WindowsLogoff :nowait t :nodefault t))))

* �������邽�тɁu�G�N�X�v���[���v�́u�i�r�Q�[�V�����J�n�v���̃T�E���h���Đ����܂��B

  �p�ɂɎ��s���邽�ߎ��O�� wav �t�@�C������������Ƀ��[�h���Ă��܂��B

      (require "sound")
      (let ((sound (snd::load-sound (snd::alias-to-file :Navigating))))
        (add-hook '*post-command-hook*
                  (lambda (&rest ignore)
                    (ignore-errors
                     (sound-play-async sound :nowait t :nostop t :nodefault t)))))


== ToDo

* SND_RESOURCE �܂��


== ���m�̃o�O�E��������

* ���s�\�t�@�C���̃��\�[�X���Đ��ł��邩�͂悭������܂���
  (�����Ă��܂���)�B


== �֘A����y�[�W

: api.l
    ((<URL:http://xyzzy.s53.xrea.com/wiki/index.php?%B3%C8%C4%A5lisp%2Fwinapi>))

: Microsoft Windows �� Web �y�[�W�ł̃I�[�f�B�I �v���O���~���O: �T�v
    ((<URL:http://www.microsoft.com/japan/msdn/directx/techart/audiooverview.asp>))

: PlaySound - MSDN
    ((<URL:http://www.microsoft.com/japan/msdn/library/default.asp?url=/japan/msdn/library/ja/jpmltimd/html/_win32_playsound.asp>))


== ���C�Z���X

sound �͏C�� BSD ���C�Z���X�Ɋ�Â��ė��p�\�ł��B

  Copyright (C) 2005 MIYAMUKO Katsuyuki. All rights reserved.

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
  ;; ���̂�����͎w����ԈႦ��� xyzzy ���Ɨ����邱�Ƃ�����̂�
  ;; ����ɐݒ肷��B
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
    (error "~a�̓f�o�C�X�t�@�C���ł�" filename))
  (when (file-directory-p filename)
    (error "~a�̓f�B���N�g���ł�" filename))
  (unless (valid-path-p filename)
    (error "~a\n�t�@�C���܂��̓f�B���N�g����������܂���" filename))
  (unless (file-exist-p filename)
    (error "~a\n�t�@�C����������܂���" filename))
  (let ((size (file-length filename))
        fh chunk readsize)
    (when (zerop size)
      (error "~a�͋�t�@�C���ł�" filename))
    (unwind-protect
        (progn
          (setf fh (CreateFile (si:make-string-chunk filename)
                               GENERIC_READ 0 0
                               OPEN_EXISTING FILE_ATTRIBUTE_NORMAL 0))
          (when (= fh INVALID_HANDLE_VALUE)
            (error "~a\n�t�@�C�����J���܂���ł���" filename))
          (setf chunk (si:make-chunk nil size))
          (setf readsize (si:make-chunk nil 4))
          (when (zerop (ReadFile fh chunk size readsize 0))
            (error "~a\n�t�@�C���̓ǂݍ��݂Ɏ��s���܂���" filename))
          (when (< (si:unpack-uint32 readsize 0) size)
            (error "~a\n�t�@�C�������ׂēǂݍ��߂܂���ł���" filename)))
      (when fh (CloseHandle fh)))
    (values chunk size)))

;; �K��̃T�E���h���ʎq�֘A

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
  (read-registry (format nil "AppEvents\\EventLabels\\~A" alias-name)
                 nil :current-user))

(defun get-app-label (app)
  (read-registry (format nil "AppEvents\\Schemes\\Apps\\~A" app)
                 nil :current-user))

(defun get-current-value (app alias-name)
  (read-registry (format nil "AppEvents\\Schemes\\Apps\\~A\\~A\\.Current" app alias-name)
                 nil :current-user))

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
        (format t fmt "��`�ς݂̃T�E���h���ʎq" "����" "���݂̐ݒ�")
        (format t fmt "------------------------" "----" "----------")
        (dolist (app (snd::list-alias))
          (format t "~%��~A (~A):~%" (cadr app) (string (car app)))
          (dolist (alias (caddr app))
            (format t fmt
                    (string (car alias))
                    (empty? (cadr alias) "")
                    (empty? (caddr alias) "(�Ȃ�)"))))))))

;;
;; End
;;