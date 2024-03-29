;;  -*- coding: utf-8-unix -*-
;; 21-popwin.el
;;

(setq pop-up-windows nil)
(when (require 'popwin nil t)
  (setq anything-samewindow nil)
  (setq helm-samewindow nil)
  (setq display-buffer-function 'popwin:display-buffer)
  (push '("anything" :regexp t :height 0.5) popwin:special-display-config)
  (push '("helm" :regexp t :height 0.5) popwin:special-display-config)
  (push '("*Completions*" :height 0.4) popwin:special-display-config)
  (push '("*compilation*" :height 0.4 :noselect t :stick t) popwin:special-display-config)
  )
