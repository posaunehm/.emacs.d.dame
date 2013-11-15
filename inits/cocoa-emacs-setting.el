;;  -*- coding: utf-8-unix -*-
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'meta)
(setq default-input-method "MacOSX")
(global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
(require 'ucs-normalize)
(set-file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'cp932)


;; load environment value
(load-file (expand-file-name "~/.emacs.d/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

