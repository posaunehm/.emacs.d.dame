;;  -*- coding: utf-8-unix -*-
;; init.el
;;

;; EMACS 23以前にはuser-emacs-directoryが存在しないので定義しておく
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))

;; load pathを再帰的に追加する関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;;loadpathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;;init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")


(require 'ess-site)
(require 'helm-R)





