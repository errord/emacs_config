(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))

;;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "White" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "Monaco")))))


(setq column-number-mode t)

;; --- linux kernel ---                                                                                           
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8))

(setq auto-mode-alist (cons '("/home/error.d/resource/src/linux.*/.*\\.[ch]$" . linux-c-mode)
                            auto-mode-alist))

;; -- F10被占用，绑定到f9
(define-key global-map (kbd "<f9>") 'menu-bar-open)

;; --- 绑定跳行快捷键 ---
(define-key global-map (kbd "C-x g") 'goto-line)
;; --- 绑定调整窗口大小快捷键 ---
(define-key global-map (kbd "C-x >") 'enlarge-window)
(define-key global-map (kbd "C-x <") 'shrink-window)
;; --- 选择区域加量 ---
(transient-mark-mode t)
;; --- 显示匹配的括号 ---
(show-paren-mode t)
;; --- 不生成备份文件 ---
(setq make-backup-files nil)

(add-to-list 'load-path "/home/error.d/.emacs.d/thrift" t)
(require 'thrift-mode)

(put 'downcase-region 'disabled nil)

;; erlang
;;(add-to-list 'load-path "/home/error.d/Work/opensource/erlang/otp/lib/tools/emacs")
;;(require 'erlang-start)

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))


(setq erlang-root-dir "/usr/local/lib/erlang")
(add-to-list 'exec-path "/usr/local/lib/erlang/bin")
(setq erlang-man-root-dir "/usr/local/lib/erlang/man")


;; org-mode
(add-to-list 'auto-mode-alist '("\\.org?$" . org-mode))

;; yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins")
(require 'yasnippet-bundle)
(setq yas/root-directory "~/.emacs.d/snippets") 
(yas/load-directory yas/root-directory)

;; pymacs
;;(autoload 'pymacs-apply "pymacs")
;;(autoload 'pymacs-call "pymacs")
;;(autoload 'pymacs-eval "pymacs" nil t)
;;(autoload 'pymacs-exec "pymacs" nil t)
;;(autoload 'pymacs-load "pymacs" nil t)

;;(autoload 'python-mode "python-mode" "Python Mode." t)
;;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;(setq pymacs-load-path '("/Library/Python/2.6/site-packages/rope"
;;			 "/Library/Python/2.6/site-packages/ropemode"))


;;(require 'pycomplete)

;;(pymacs-load "ropemacs" "rope-")
;;(setq ropemacs-enable-autoimport t)

(defun load-ropemacs ()
  "load ropemacs"
  (interactive)
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-enable-autoimport t)
  (ropemacs-mode))

;; auto-complete
(add-to-list 'load-path "/home/error.d/.emacs.d")
(require 'auto-complete-settings)


;; cedet
(defun load-cedet ()
  "load cedet"
  (interactive)
  (load-file "/home/error.d/.emacs.d/cedet-1.0pre6/common/cedet.el"))

;; ecb
(defun load-ecb ()
  "load ecb"
  (interactive)
  (load-cedet)
  (add-to-list 'load-path "/home/error.d/.emacs.d/ecb-2.40")
  (require 'ecb)
  (ecb-activate))

;; 自动启动ecb，并且不显示每日提示
;;(setq ecb-auto-activate t
;;      ecb-tip-of-the-day nil)


;; ess
(load-file "/home/error.d/.emacs.d/ess-13.09/lisp/ess-site.el")
(require 'ess-site)

;; mysql
(setq sql-mysql-program "mysql5")
(setq sql-user "root")
(setq sql-password "")
(setq sql-server "localhost")
(setq sql-mysql-options '("-C" "-t" "-f" "-n"))

;; git
(add-to-list 'load-path "/home/error.d/.emacs.d/git-emacs")
(require 'git-emacs)

;; ipython
(require 'ipython)
(setq ansi-color-for-comint-mode t)
;; start ipython
(defun ipython-start ()
  "start ipython"
  (interactive)
  (py-shell))


;; ;; pylint
;; (when (load "flymake" t)
;; (defun flymake-pylint-init ()
;; (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                  'flymake-create-temp-inplace))
;;      (local-file (file-relative-name
;;                   temp-file
;;                   (file-name-directory buffer-file-name))))
;; (list "epylint" (list local-file))))

;; (add-to-list 'flymake-allowed-file-name-masks
;;          '("\\.py\\'" flymake-pylint-init)))

;; (add-hook 'python-mode-hook
;;      (lambda ()
;;           (flymake-mode)
;;           (local-set-key (kbd "\C-c e")
;;                       'flymake-display-err-menu-for-current-line)
;;           (local-set-key (kbd "\C-c `") 'flymake-goto-next-error)))


(define-key global-map (kbd "C-x g") 'goto-line)

;; go mode
(require 'go-mode-load)


;; scala
(add-to-list 'load-path "/home/error.d/.emacs.d/scala")
(require 'scala-mode-auto)
(add-hook 'scala-mode-hook
	'(lambda ()
		(yas/minor-mode-on)
            	))

;; php
(autoload 'php-mode "~/.emacs.d/plugins/php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

