;; path to local config
(add-to-list 'load-path
             (concat
              (file-name-as-directory user-emacs-directory) "site-lisp/"))

;; el-get
(setq el-get-sources
      '(el-get
      cc-mode))

(load-library "getelget.el")

;; disable tool bar
(tool-bar-mode 0)

;; set M-x mapping C-x C-m or C-c C-m
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; cc-mode
(setq c-default-style '((java-mode . "java") 
			(awk-mode . "awk") 
                        (other . "linux")
			))

(setq-default indent-tabs-mode  nil)
(setq tab-width 4
      c-basic-offset 4)
