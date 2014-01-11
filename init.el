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
(add-to-load-path "elisp" "conf" "public_repos" "elpa")



;;init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")


(require 'ess-site)
(require 'helm-R)

(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
(setq pandoc-binary "pandoc")


;;cmd-mode
(autoload 'cmd-mode "cmd-mode" "CMD mode." t)
(setq auto-mode-alist (append '(("\\.\\(cmd\\|bat\\)$" . cmd-mode))
			      auto-mode-alist))

;;; turn on syntax highlighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

;;; color-occur.el
(require 'color-moccur)
(setq moccur-split-word t) ;スペースで区切られた複数の単語にマッチさせる

;; ruby

;; rsense
(setq rsense-home (expand-file-name "~/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
 
;; C-c .で補完
(add-hook 'ruby-mode-hook
	 (lambda ()
	   (local-set-key (kbd "C-c .") 'ac-complete-rsense)))
;; auto-completeで自動補完
(add-hook 'ruby-mode-hook
	 (lambda ()
	   (add-to-list 'ac-sources 'ac-source-rsense-method)
	   (add-to-list 'ac-sources 'ac-source-rsense-constant)))
 
 
;; quickrun
(require 'quickrun)

;; direx:direx-modeのバッファをウィンドウ左辺に幅25でポップアップ
;; :dedicatedにtを指定することで、direxウィンドウ内でのバッファの切り替えが
;; ポップアップ前のウィンドウに移譲される
(push '(direx:direx-mode :position left :width 35 :dedicated t)
      popwin:special-display-config)

(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")
