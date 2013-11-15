;;  -*- coding: utf-8-unix -*-

;; windows specific setting
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932)
  (setq w32-lwindow-modifier 'super)
  )
