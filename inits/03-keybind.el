;;  -*- coding: utf-8-unix -*-
;; 04-keybind.el
;;

;; indent-regionを日本語キーボード用に設定
(global-set-key (kbd "C-M-¥") 'indent-region)

;; C-tでWindow切り替え
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;; C-,でundo
(global-set-key (kbd "C-,") 'undo)
(global-set-key (kbd "C-.") 'redo)


