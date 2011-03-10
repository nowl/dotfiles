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

;; colors
(set-foreground-color "white")
(set-background-color "black")
(set-cursor-color "white")

;; color-theme stuff
(setq load-path (append load-path (list "~/.emacs.d/color-theme-6.6.0")))
(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

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
(autoload 'calc-dispatch          "calc" "Calculator Options" t)
(autoload 'full-calc              "calc" "Full-screen Calculator" t)
(autoload 'full-calc-keypad       "calc" "Full-screen X Calculator" t)
(autoload 'calc-eval              "calc" "Use Calculator from Lisp")
(autoload 'defmath                "calc" nil t t)
(autoload 'calc                   "calc" "Calculator Mode" t)
(autoload 'quick-calc             "calc" "Quick Calculator" t)
(autoload 'calc-keypad            "calc" "X windows Calculator" t)
(autoload 'calc-embedded          "calc" "Use Calc from any buffer" t)
(autoload 'calc-embedded-activate "calc" "Activate =>'s in buffer" t)
(autoload 'calc-grab-region       "calc" "Grab region of Calc data" t)
(autoload 'calc-grab-rectangle    "calc" "Grab rectangle of data" t)

(global-set-key (kbd "<C-return>") 'repeat)

(setq load-path (append load-path (list "~/.emacs.d/")))

; python stuff
(load "~/.emacs.d/pythonmode/python-mode-1.0/python-mode.elc")
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


;; lua
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(setq-default indent-tabs-mode nil)



;; magit
(add-to-list 'load-path "~/.emacs.d/magit")
(require 'magit)

(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "epylint" (list local-file))))
  
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))

;; actionscript
(setq auto-mode-alist (cons '("\\.as$" . actionscript-mode) auto-mode-alist))
(autoload 'actionscript-mode "actionscript-mode-connors" "Actionscript mode." t)

;; slime stuff
(push "~/.emacs.d/slime/contrib" load-path)
(add-hook 'slime-load-hook (lambda () 
			     (require 'slime-fuzzy)))
(push "~/.emacs.d/slime" load-path)
(require 'slime)
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)
				  (setq tab-width 4)
				  (setq indent-tabs-mode nil)))
(add-hook 'inferior-lisp-mode-hook (lambda () 
				     ;(inferior-slime-mode t)
				     (setq tab-width 4)
				     (setq indent-tabs-mode nil)))
(setf inferior-lisp-program "sbcl")
;(setf inferior-lisp-program "java -cp /usr/share/clojure/clojure.jar:/usr/share/clojure/clojure-contrib.jar clojure.main")
(setf lisp-indent-function 'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      slime-startup-animation nil)
(slime-setup '(slime-fancy slime-asdf))

(global-set-key (kbd "<C-tab>") 'slime-fuzzy-complete-symbol)

;; clojure-mode
(add-to-list 'load-path "~/.emacs.d/clojure-mode")
(setq auto-mode-alist (cons '("\\.clj$" . clojure-mode) auto-mode-alist))
(autoload 'clojure-mode "clojure-mode" "Clojure mode." t)

;; ;; swank-closure
;; (add-to-list 'load-path "~/.emacs.d/swank-clojure")
;; (setf swank-clojure-jar-path "/usr/share/clojure/clojure.jar"
;;       swank-clojure-extra-classpaths '("/usr/share/clojure/clojure-contrib.jar"))
;; ;;(setq swank-clojure-binary "~/bin/clojure")
;; (require 'swank-clojure)