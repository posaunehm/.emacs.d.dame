;;  -*- coding: utf-8-unix -*-
;; 02-display.el
;;

;; set-goal-columnコマンドをdisableに
(put 'set-goal-column 'disabled nil)
;; 行番号を表示
(line-number-mode t)
;; カラム番号も表示
(column-number-mode t)


;;現在行をハイライト
(global-hl-line-mode)  
(setq hl-line-face 'underline)

;;jaspace-mode
;;空白やタブ文字を強調表示
(when (require 'jaspace nil t))

;;scratchの初期メッセージをなしに
(setq initial-scratch-message "")

;; フォントの設定
(when (>= emacs-major-version 23) 
  (set-face-attribute 'default nil :family "Yutapon coding Regular" :height 140)
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Yutapon coding Regular"))
  )

;; color-theme
(load-theme 'manoj-dark t)
(enable-theme 'manoj-dark)
