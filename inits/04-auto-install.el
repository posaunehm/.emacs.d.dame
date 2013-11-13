;;  -*- coding: utf-8-unix -*-
;; 01-basic.el
;;

;; auto-install
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
					;(auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))
