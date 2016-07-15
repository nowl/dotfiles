;; auto syntax highlighting
(global-font-lock-mode 1)
(show-paren-mode t)
(set-variable 'truncate-lines 't)
(set-variable 'transient-mark-mode 't)

;; other stuff
(column-number-mode 1)
(global-set-key [(control x) (control g)] 'goto-line)
;(setq tab-stop-list '(0 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 \
	;		80 84 88 92 96 100))
(global-set-key "\e#" 'calc-dispatch)
(global-set-key [(f5)] 'kmacro-end-and-call-macro)
(global-set-key (kbd "C-c C-a") 'comment-or-uncomment-region)


;; colors
;(set-foreground-color "white")
;(set-background-color "black")
;(set-cursor-color "white")

;; melpa package index
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)


;; color-theme stuff
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-clarity)

;;(load-theme 'ample t)
(load-theme 'inkpot t)

;; packages I like
;;   color-theme
;;   python-mode
;;   magit

;; c stuff
(defun my-c-mode-common-hook ()
  ;; use BSD style for c code
  (c-set-style "bsd")
  (setq comment-style "extra-line")
  ;; was commented
  (setq c-basic-offset 4)
  (setq default-tab-width 4)
  ;(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 65 69 73 77 \
;			  81 85 89 93 97 101 105 109 113 117 121))
  ;;
  (font-lock-fontify-buffer)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; other stuff
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; makes the compilation window go away if there were no errors
;(setq compilation-finish-function
;      (lambda (buf str)
;	(if (string-match "exited abnormally" str)

	    ;; there were errors
;	    (message "compilation errors, press C-x ` to visit")

	  ;; no errors
;	  (run-at-time 0.25 nil 'delete-windows-on buf)
;	  (message "NO COMPILATION ERRORS!"))))

;; calc stuff
;(autoload 'calc-dispatch          "calc" "Calculator Options" t)
;(autoload 'full-calc              "calc" "Full-screen Calculator" t)
;(autoload 'full-calc-keypad       "calc" "Full-screen X Calculator" t)
;(autoload 'calc-eval              "calc" "Use Calculator from Lisp")
;(autoload 'defmath                "calc" nil t t)
;(autoload 'calc                   "calc" "Calculator Mode" t)
;(autoload 'quick-calc             "calc" "Quick Calculator" t)
;(autoload 'calc-keypad            "calc" "X windows Calculator" t)
;(autoload 'calc-embedded          "calc" "Use Calc from any buffer" t)
;(autoload 'calc-embedded-activate "calc" "Activate =>'s in buffer" t)
;(autoload 'calc-grab-region       "calc" "Grab region of Calc data" t)
;(autoload 'calc-grab-rectangle    "calc" "Grab rectangle of data" t)

(global-set-key (kbd "<C-return>") 'repeat)

; python stuff
(defun my-python-mode-hook ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil))
(add-hook 'python-mode-hook 'my-python-mode-hook)

;(require 'tramp)
;(setq tramp-default-method "plink")

(global-set-key (kbd "<M-/>") 'hippie-expand)

(ido-mode t)

(set-variable 'ido-enable-flex-matching t)

(set-variable 'org-hide-leading-stars t)

;(add-to-list 'load-path "c:/.emacs.d/ecb-2.32/")
;(require 'ecb)

(require 'org)
(global-set-key "\C-ca" 'org-agenda)

;; (when (load "flymake" t)
;;   (defun flymake-pylint-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "epylint" (list local-file))))
  
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pylint-init)))

;; slime stuff
;; (push "~/.emacs.d/slime/contrib" load-path)
;; (add-hook 'slime-load-hook (lambda () 
;; 			     (require 'slime-fuzzy)))
;; (push "~/.emacs.d/slime" load-path)
(require 'slime)
(slime-setup '(slime-fancy))

;; (add-hook 'lisp-mode-hook (lambda () (slime-mode t)
;; 				  (setq tab-width 4)
;; 				  (setq indent-tabs-mode nil)))
;; (add-hook 'inferior-lisp-mode-hook (lambda () 
;; 				     ;(inferior-slime-mode t)
;; 				     (setq tab-width 4)
;; 				     (setq indent-tabs-mode nil)))
(setf inferior-lisp-program "sbcl")
;; ;(setf inferior-lisp-program "java -cp /usr/share/clojure/clojure.jar:/usr/share/clojure/clojure-contrib.jar clojure.main")
;; (setf lisp-indent-function 'common-lisp-indent-function
;;       slime-complete-symbol-function 'slime-fuzzy-complete-symbol
;;       slime-startup-animation nil)
;; (slime-setup '(slime-fancy slime-asdf))

(global-set-key (kbd "<C-tab>") 'slime-fuzzy-complete-symbol)

(add-hook 'find-file-hook 'flymake-find-file-hook)

;;(set-face-attribute 'default nil :font "DejaVu Sans Mono-11")
(set-face-attribute 'default nil :font "Liberation Mono-11")

;; set default width and height
(if (window-system)
    (progn
      (set-frame-height (selected-frame) 54)
      (set-frame-width (selected-frame) 100)))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h a") 'helm-apropos)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("3038a172e5b633d0b1ee284e6520a73035d0cb52f28b1708e22b394577ad2df1" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; cedet
;; (setq package-enable-at-startup nil)
;; (package-initialize)

;; ;; Enable EDE (Project Management) features
;; (global-ede-mode 1)
;; (semantic-mode 1)
;; ;;(semantic-load-enable-excessive-code-helpers)      ; Enable prototype help and smart completion 
;; ;;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;; ;; Semantic
;; (global-semantic-idle-scheduler-mode)
;; (global-semantic-idle-completions-mode)
;; (global-semantic-decoration-mode)
;; (global-semantic-highlight-func-mode)
;; (global-semantic-show-unmatched-syntax-mode)

;; ;; CC-mode
;; (add-hook 'c-mode-common-hook '(lambda ()
;;         (setq ac-sources (append '(ac-source-semantic) ac-sources))
;; ))

;; ;; Autocomplete
;; (require 'auto-complete-config)
;; ;;(add-to-list 'ac-dictionary-directories (expand-file-name
;; ;;             "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict"))
;; ;;(setq ac-comphist-file (expand-file-name
;; ;;             "~/.emacs.d/ac-comphist.dat"))
;; (ac-config-default)


;; ;; helm gtags
;; ;;; Enable helm-gtags-mode
;; (add-hook 'c-mode-hook 'helm-gtags-mode)
;; (add-hook 'c++-mode-hook 'helm-gtags-mode)
;; (add-hook 'asm-mode-hook 'helm-gtags-mode)

;; ;; customize
;; (custom-set-variables
;;  '(helm-gtags-path-style 'relative)
;;  '(helm-gtags-ignore-case t)
;;  '(helm-gtags-auto-update t))

;; ;; key bindings
;; (eval-after-load "helm-gtags"
;;   '(progn
;;      ;;(define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
;;      ;;(define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
;;      (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
;;      ;;(define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
;;      ;;(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;;      ;;(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
;;      ;;(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))
;; ))

(global-set-key (kbd "<f9>") 'compile)
(global-set-key (kbd "<f10>") 'recompile)


(require 'flymake-lua)
(add-hook 'lua-mode-hook 'flymake-lua-load)


;; compile no query for command
(setq compilation-read-command nil)

;; Helper for compilation. Close the compilation window if
;; there was no error at all.
(defun compilation-exit-autoclose (status code msg)
  ;; If M-x compile exists with a 0
  (when (and (eq status 'exit) (zerop code))
	;; then bury the *compilation* buffer, so that C-x b doesn't go there
	(bury-buffer)
	;; and delete the *compilation* window
	(delete-window (get-buffer-window (get-buffer "*compilation*"))))
  ;; Always return the anticipated result of compilation-exit-message-function
  (cons msg code))
;; Specify my function (maybe I should have done a lambda function)
(setq compilation-exit-message-function 'compilation-exit-autoclose)




(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)

(require 'cc-mode)
;;(require 'semantic)

;;(global-semanticdb-minor-mode 1)
;;(global-semantic-idle-scheduler-mode 0)

;;(semantic-mode 1)
;;(global-semantic-idle-summary-mode 0)

(setq sr-speedbar-right-side nil)

;;(require 'icomplete)

(add-hook 'cider-mode-hook #'eldoc-mode)



;; (defun figwheel-repl ()
;;   (interactive)
;;   (run-clojure "lein figwheel"))

;; (add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)


(require 'clj-refactor)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

;; prevent namespace indentation in c++ mode
(defun my-c-setup ()
   (c-set-offset 'innamespace [0]))
(add-hook 'c++-mode-hook 'my-c-setup)


;; rust mode stuff
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(add-to-list 'exec-path "/home/nowl/.cargo/bin")

(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))

(setq racer-cmd "/home/nowl/.cargo/bin/racer")
(setq racer-rust-src-path "/home/nowl/dev/rust/src")

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
