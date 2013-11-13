;;  -*- coding: utf-8-unix -*-
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
    "~/.emacs.d/elisp/ac-dict")
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(ac-config-default)
