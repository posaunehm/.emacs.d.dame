;;  -*- coding: utf-8-unix -*-
(when (require 'helm nil t)
  ;;key-binding表示マクロの変更
  (require 'helm-descbinds)
  (global-set-key (kbd "C-x C-a C-f") 'helm-for-files)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "M-x") 'helm-M-x)
  )

