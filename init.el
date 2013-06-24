;; getelget -- bootstrap el-get if necessary and load the specified packages
(setq el-get-sources 
      '(
        (:name color-theme 
               :after (progn 
                        (color-theme-initialize)
                        (color-theme-charcoal-black)))
        (:name cedet
               :after (progn 
                       ;(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))
                       ;(load-file "~/elisp/cedet/speedbar/speedbar.el")
                       ;(load-file "~/elisp/cedet/eieio/eieio.el")
                       ;(load-file "~/elisp/cedet/common/cedet.el")
                       ;(semantic-load-enable-code-helpers)
                       ;(semantic-load-enable-guady-code-helpers)
                       ;(semantic-load-enable-excessive-code-helpers)
                        (autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
                        (autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
                        (define-key-after (lookup-key global-map [menu-bar tools])
                          [speedbar]
                           '("Speedbar" . speedbar-frame-mode)
                          [calendar])
                        (setq semanticdb-search-system-databases t)
                        ;; make all the 'semantic.cache' files go somewhere sane
                        (setq semanticdb-default-save-directory "~/.emacs-meta/semantic.cache/")))
        (:name ecb
               :description "Emacs Code Browser"
               :type github
               :pkgname "alexott/ecb"
               :depends cedet
               :build `(("make" "CEDET=../cedet", 
                         (concat "EMACS=" (shell-quote-argument el-get-emacs))))
               :after (progn
                        (require 'ecb)
                        (custom-set-variables 
                         '(ecb-auto-activate t)             ;auto load ecb 
                         '(ecb-layout-name "left14")
                         '(ecb-layout-window-sizes (quote (("left2" (0.25 . 0.75) (0.25 . 0.25)))))
                         '(ecb-tip-of-the-day nil)
                         '(ecb-windows-height 0.5)
                         '(ecb-windows-width 0.25)
                         '(ecb-source-path (quote (("/" "/"))))
                         ;; 由于semantic idle反常占用CPU，所以添加以下设置
                         ;'(global-semantic-idle-scheduler-mode nil nil (semantic-idle))
                         ;'(global-semantic-idle-summary-mode nil nil (semantic-idle))
                         '(semantic-idle-scheduler-idle-time -1))))
        ))

(setq el-get-packages
      '(el-get
        color-theme
        ecb
        cedet))

(load-file 
 (concat (file-name-as-directory user-emacs-directory) "getelget.el"))

;; cc-mode
;(setq c-default-style '((java-mode . "java") 
;                        (awk-mode . "awk") 
;                        (other . "linux")))

;; normal setting
;;******************************************************************
;(set-frame-parameter nil 'fullscreen 'fullboth)            ;bfull screen on mac os x
(global-font-lock-mode t)                                   ;always turn on font-lock-mode
;(global-hl-line-mode 1)                                    ;high light current line 
(global-linum-mode 1)                                       ;turn on linum-mode
(setq linum-format "%4d|")                                  ;fomat line number
(setq column-number-mode t)                                 ;turn on column-number-mode    ;;TODO http://emacser.com/mode-line.htm
;(auto-image-file-mode t)                                   ;trun on image-file 
(setq auto-fill-mode t)                                     ;turn on auto fill mode        ;;TODO study
(setq fill-column 81)                                       ;set column value 
(show-paren-mode t)                  ; 显示括号匹配
;(menu-bar-mode -1)                  ; 隐藏菜单栏
(tool-bar-mode -1)                   ; hide tool bar
(scroll-bar-mode 0)                 ; 隐藏滚动条，因为可以使用鼠标滚轮了
;(mouse-avoidance-mode 'animate)      ; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
;(transient-mark-mode t)              ; 允许临时设置标记，See C-h f transient-mark-mode
;(setq mouse-yank-at-point t)        ; 支持中键粘贴
;(setq inhibit-startup-message t)    ; 关闭启动时闪屏
(setq visible-bell t)               ; 关闭出错时的提示声
(setq default-major-mode 'text-mode) ; 一打开就起用 text 模式
(display-time-mode 1)                ; 显示时间，格式如下：
(setq display-time-use-mail-icon t)  ;时间栏旁边启用邮件设置
(setq display-time-interval 10)      ;时间的变化频率
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq x-select-enable-clipboard t)   ; 支持emacs和外部程序的粘贴
;(setq default-fill-column 80)        ; 默认显示 80列就换行
(setq load-home-init-file t)
(fset 'yes-or-no-p 'y-or-n-p)        ; 以 y/n代表 yes/no
(setq-default indent-tabs-mode nil)
;(setq default-tab-width 4)
(setq tab-width 4)                   ; Tab缩进4个字符
(setq-default make-backup-files nil) ; 默认不要生成临时文件
(setq frame-title-format '("%b (⊙?⊙) If u're going through hell,keep going." buffer-file-name))   ; 指定窗口框架标题
(setq auto-save-default nil)         ;取消自动保存
(setq kill-ring-max 200)
;(setq-default cursor-type '(hbar . 1))     ;光标显示为一个数线
(setq track-eol t)                   ;當光標在行尾上下移動的時候，始終保持在行尾。 
(setq scroll-margin 3 scroll-conservatively 10000);防止頁面滾動時跳動  scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。


;; 自定义按键
;;******************************************************************
(global-set-key [C-f1] 'shell)                     ; F1进入shell
(global-set-key [C-f2] 'split-window-horizontally) ; F2水平分割窗口
(global-set-key [C-f3] 'delete-other-windows)      ; F3关闭其他窗口
(global-set-key [C-f4] 'delete-window)             ; F4关闭当前窗口
(global-set-key [C-f5] 'gdb)                       ; F5调试程序
(global-set-key [C-f6] 'split-window-vertically)   ; F6垂直分割窗口
;(global-set-key [C-f7] 'python-shell)              ; F7开启Python shell
;(global-set-key [C-f8] 'other-window)              ; F8窗口间跳转
;(global-set-key [C-f9] 'ecb-activate)              ; F9打开ecb
;(global-set-key [C-f10] 'ecb-deactivate)           ; F10关闭ecb
;(global-set-key [C-f11] 'speedbar)                 ; F11打开／关闭speedbar
;(global-set-key [C-f12] 'menu-bar-mode)            ; F12显示／隐藏菜单
(global-set-key [C-return] 'kill-this-buffer)      ; C-Return关闭当前buffer
;(global-set-key (kbd "C-SPC") 'nil)                ; 把C-Space留给中文输入法

; set M-x mapping C-x C-m or C-c C-m
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)


;; ecb
;;;; 各窗口间切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)
 
;;;; 隐藏和显示ecb窗口
(define-key global-map [(control -)] 'ecb-hide-ecb-windows)
(define-key global-map [(control =)] 'ecb-show-ecb-windows)
 
;;;; 使某一ecb窗口最大化
(define-key global-map (kbd "C-c 1") 'ecb-maximize-window-directories)
(define-key global-map (kbd "C-c 2") 'ecb-maximize-window-sources)
(define-key global-map (kbd "C-c 3") 'ecb-maximize-window-methods)
(define-key global-map (kbd "C-c 4") 'ecb-maximize-window-history)
;;;; 恢复原始窗口布局
(define-key global-map (kbd "C-c `") 'ecb-restore-default-window-sizes)

;; Mac OSX customizations
;;******************************************************************
;(normal-erase-is-backspace-mode t)

;; Encoding setting
;;******************************************************************
(set-language-environment 'utf-8)
(set-buffer-file-coding-system 'utf-8)           ;写文件的编码方式
(setq default-buffer-file-coding-system 'utf-8)  ;新建文件的编码方式
(set-terminal-coding-system 'utf-8)              ;终端的文件编码方式
(set-keyboard-coding-system 'utf-8)              ;键盘输入的编码方式
(setq file-name-coding-system 'utf-8)            ;读取或写入文件名的编码方式
