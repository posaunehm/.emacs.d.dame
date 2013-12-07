;;  -*- coding: utf-8-unix -*-

;;バックアップファイルの作成場所を変更
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
;;オートセーブファイルの作成場所を変更
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;;スタートページを非表示
(setq inhibit-startup-message t)

;;サーバーモードを有効に
(require 'server)
(unless (server-running-p)
  (server-start))

;;メニューを非表示
(menu-bar-mode 0)
(tool-bar-mode 0)

;;ファイル名の補完で大文字小文字の識別をしない
(setq completion-ignore-case t)

;;バッファをオートロードする
(global-auto-revert-mode 1)

;;メニューを非表示
(menu-bar-mode 0)

;;cua-mode (http://tech.kayac.com/archive/emacs-rectangle.html)
(cua-mode t)
(setq cua-enable-cua-keys nil) ;cua独自のkeyを無効化

;; add +x permission if it includes shebang
(add-hook 'after-save-hook 'my-chmod-script)
(defun my-chmod-script() (interactive) (save-restriction (widen)
							 (let ((name (buffer-file-name)))
							   (if (and (not (string-match ":" name))
								    (not (string-match "/\\.[^/]+$" name))
								    (equal "#!" (buffer-substring 1 (min 3 (point-max)))))
							       (progn (set-file-modes name (logior (file-modes name) 73))
								      (message "Wrote %s (chmod +x)" name)
								      ))
							   )))
;; redo
(require 'redo+)
