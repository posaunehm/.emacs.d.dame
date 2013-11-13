;;  -*- coding: utf-8-unix -*-

(require 'tabbar)
(tabbar-mode 1)
 
;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)
 
;; グループ化しない
(setq tabbar-buffer-groups-function nil)
 
;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))
 
;; ウインドウからはみ出たタブを省略して表示
(setq tabbar-auto-scroll-flag nil)
 
;; タブとタブの間の長さ
(setq tabbar-separator '(1.5))
 
;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :background "gray72"
 :foreground "black"
 :height 1.0)
(set-face-attribute
 'tabbar-unselected nil
 :background "gray72"
 :foreground "black"
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "gray72"
 :foreground "#c82829"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 1.2)

;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
 '("scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
  "*Regexps matches buffer names always included tabs.")
(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
 
;; タブ移動キーバインド
(global-set-key (kbd "C-c C-f") 'tabbar-forward-tab)
(global-set-key (kbd "C-c C-b") 'tabbar-backward-tab)
 
;; タブモードのオン/オフをトグル
(global-set-key (kbd "M-4") 'tabbar-mode)
 
;; Sort tabbar buffers by name
 (defun tabbar-add-tab (tabset object &optional append_ignored)
  "Add to TABSET a tab with value OBJECT if there isn't one there yet.
 If the tab is added, it is added at the beginning of the tab list,
 unless the optional argument APPEND is non-nil, in which case it is
 added at the end."
  (let ((tabs (tabbar-tabs tabset)))
    (if (tabbar-get-tab object tabset)
        tabs
      (let ((tab (tabbar-make-tab object tabset)))
        (tabbar-set-template tabset nil)
        (set tabset (sort (cons tab tabs)
                          (lambda (a b) (string< (buffer-name (car a)) (buffer-name (car b))))))))))
