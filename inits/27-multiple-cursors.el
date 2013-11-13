;;  -*- coding: utf-8-unix -*-
;; multiple-cursors
(when (require 'multiple-cursors nil t) 
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))


;; expand-region
(when (require 'expand-region nil t) 
  (global-set-key (kbd "C-@") 'er/expand-region)
  (global-set-key (kbd "C-M-@") 'er/contract-region))
