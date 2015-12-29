  ;;; cedet minor-mode
 ;; this code is place at the top to overide the built in
 ;; cedet mode 

 ;; (load-file "~/.emacs.d/cedet/cedet-devel-load.el")

 ;; ;; Add further minor-modes to be enabled by semantic-mode.
 ;; ;; See doc-string of `semantic-default-submodes' for other things
 ;; ;; you can use here.
 ;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
 ;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
 ;; (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)
 ;; ;; Enable Semantic
 ;; ;(semantic-mode 1)

 ;; ;; Enable EDE (Project Management) features
 ;; ;(global-ede-mode 1)

 ;; ;(semantic-load-enable-excessive-code-helpers)

 ;; ;; hide-show block
 ;; (defun code-fold-hook () 
 ;;   (hs-minor-mode t)
 ;;   (local-set-key (kbd "C-c h") 'hs-hide-block)
 ;;   (local-set-key (kbd "C-c s") 'hs-show-block)
 ;;   (local-set-key (kbd "C-c C-h") 'hs-hide-all)
 ;;   (local-set-key (kbd "C-c C-s") 'hs-show-all)
 ;;   )
 ;; (add-hook 'c-mode-common-hook 'code-fold-hook)

 ;; (add-hook 'c-mode-common-hook
 ;; 	  (lambda ()
 ;; 	    (semantic-mode t)
 ;; 	    (global-ede-mode t)
 ;; 	    (semantic-load-enable-excessive-code-helpers)))

 ;;=========================================================================================

 ;;; this appends all subdir of .emacs.d to load-path variable (message-box load-path)
;;(add-to-list 'load-path "~/.emacs.d")
 ;; (cd "~/.emacs.d")
 ;;  (normal-top-level-add-subdirs-to-load-path)
 ;;  (cd "~/")

 ;;; R and python shell -- Windows only
 ;; (setq-default inferior-R-program-name "c:\\program files (x86)\\R\\R-2.11.1\\bin\\Rterm.exe")
 ;; (setq py-python-command "c:\\home\\pkg\\python26\\python.exe")
 (put 'narrow-to-region 'disabled nil)

 ;; setting package-repositories
 (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			    ("marmalade" . "http://marmalade-repo.org/packages/")
			    ("melpa" . "http://melpa.milkbox.net/packages/")))

  ;; basic initialization, (require) non-ELPA packages, etc.
(setq package-enable-at-startup nil)
(package-initialize) ;; (require) your ELPA packages, configure them as normal 
    


 ;;======================================================================
 ;;                 some global minor modes                             |
 ;;======================================================================

 ;;; icicles and colortheme and ido and doremi and  CEDET
 ;(require 'color-theme)
(color-theme-initialize)
(color-theme-solarized-light)
;;(require 'icicles)
;;(icy-mode 1)
;;(ido-mode t)

;;; company mode
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "C-n") 'company-select-next)
     (define-key company-active-map (kbd "C-p") 'company-select-previous)))
(global-set-key (kbd "C-<tab>") 'company-complete)

;;; flycheck mode
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;;; pdf-tools for viewing pdf (https://github.com/politza/pdf-tools)
(pdf-tools-install)

;;; yassnippet
(yas-global-mode 1)

(blink-cursor-mode 1)

;; (add-to-list 'load-path "~/.emacs.d/doremi-lib")
;; (require 'doremi-cmd)
;; (require 'zoom-frm)
;; (global-set-key [C-kp-add] 'zoom-in)
;; (global-set-key [C-kp-subtract] 'zoom-out)

(show-paren-mode t) ; highlight mathcing paren
 ;;; auto pair mode
(autopair-global-mode nil)

(setq default-tab-width 4)
(global-set-key (kbd "C-c i") 'indent-region)

;;; evil-mode and powerline 
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "f" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "o" 'other-window
  "s" 'save-buffer)
(evil-mode 1)
(require 'airline-themes)
(load-theme 'airline-light) 
(setq airline-helm-colors t)
(set-face-foreground 'minibuffer-prompt "white") ;;airline theme mess the minibuffer color-scheme
(set-face-background 'minibuffer-prompt "black")

;;; key-chord mode
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.2)
(setq key-chord-one-key-delay 0.2) ; 
;;Exit insert mode by pressing j and then j quickly
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
;;(key-chord-define evil-visual-state-map "jj" 'evil-normal-state)
;;(key-chord-define evil-insert-state-map "kk" 'evil-normal-state)
;; (key-chord-define-global "oo" 'other-window)
;; (key-chord-define-global "bb" 'helm-mini)
;; (key-chord-define-global "qq" 'kill-buffer)
;; (key-chord-define-global "ff" 'helm-find-files)


;;; helm-mode
(require 'helm)
(require 'helm-config)
;;(helm-autoresize-mode t)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl") 
(setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(require 'helm-eshell)
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))

;;visit semantic generated tags
(global-set-key (kbd "C-c h t") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-c h m") 'helm-man-woman) ; m for manual
(global-set-key (kbd "C-c h f") 'helm-find) ; m for manual
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c h r") 'helm-resume)

;;To enable man page at point
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)

(helm-mode t)

;;; projectile mode
;; (projectile-global-mode)
;; (setq projectile-completion-system 'helm)
;; (setq projectile-enable-caching t)
;; (helm-projectile-on)

;;(global-linum-mode t) ;; this hang emacs when opening a PDF


 ;;; autocomplete-mode ;; not using it, instead using company
(require 'auto-complete-config) 
;;(ac-config-default) 
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil) ;unsetting enter for completion
 ;(require 'auto-complete-auctex) ; autocomplete mode for 
 ;; select candidates with C-n\C-p when completion menu is displayed
(setq ac-use-menu-map t)
(define-key ac-menu-map "\M-n" 'ac-next)
(define-key ac-menu-map "\M-p" 'ac-previous)
(setq ac-use-quick-help t) ; enable tooltip when completing


 ;;; color-theme-cycling
(setq day-colors '(color-theme-aalto-light color-theme-aliceblue color-theme-black-on-gray
					    color-theme-katester color-theme-mistyday 
					    color-theme-vim-colors color-theme-robin-hood 
					    color-theme-emacs-nw))
 (setq night-colors '(color-theme-arjen color-theme-billw color-theme-blue-sea color-theme-calm-forest
					color-theme-charcoal-black color-theme-euphoria color-theme-matrix
					color-theme-subtle-hacker color-theme-clarity))
 (defun colors-day ()
   (interactive)
   (let ((doremi-color-themes day-colors))
     (doremi-color-themes+)))
 (defun colors-night ()
   (interactive)
   (let ((doremi-color-themes night-colors))
     (doremi-color-themes+)))

(setq tab-width 4) 
;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


;;======================================================================
;;                      python-mode.el 
;;======================================================================
;; setting ipython interpreter

 (setq
  python-shell-interpreter "ipython"
  python-shell-interpreter-args ""
  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
  python-shell-completion-setup-code
    "from IPython.core.completerlib import module_completion"
  python-shell-completion-module-string-code
    "';'.join(module_completion('''%s'''))\n"
  python-shell-completion-string-code
    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

 (defun python-shell-send-para-and-move ()
   "Send the current paragraph to the inferior python process."
   (interactive)
   (backward-paragraph)
   (let ((begin (point)))
     (forward-paragraph)
     (python-shell-send-region begin (point))))

 (defun python-shell-send-line-and-move ()
   "Send the current line and move to next line"
   (interactive)
   (move-beginning-of-line 1)
   (let ((begin (point)))
     (next-line)
     (python-shell-send-region begin (point))))

 (add-hook 'python-mode-hook
	   (lambda ()
	     (define-key python-mode-map (kbd "C-c C-f") 'python-shell-send-defun)
	     (define-key python-mode-map (kbd "C-c C-b") 'python-shell-send-buffer)
	     (define-key python-mode-map (kbd "C-c C-r") 'python-shell-send-region)
	     (define-key python-mode-map (kbd "C-c C-c") 'python-shell-send-para-and-move)
	     (define-key python-mode-map (kbd "C-c C-n") 'python-shell-send-line-and-move)))
(evil-leader/set-key-for-mode 'python-mode
  "cc" 'python-shell-send-para-and-move
  "cb" 'python-shell-send-buffer
  "cf" 'python-shell-send-defun)

;; jedi-minor mode for auto-completion and much more
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;;Path to directory to store all Python virtual environments.  A string.
(setq python-environment-directory "~/.python-environments")

;;==========================================================================================
 ;;; sml-mode
 (defun sml-execute-para-and-move ()
   "Send the current paragraph to the inferior sml process."
   (interactive)
   (save-excursion 
     (forward-paragraph)
     (let ((end (point)))
       (backward-paragraph)
       (sml-prog-proc-send-region (point) end)))
   (forward-paragraph))

 (add-hook 'sml-mode-hook
	   (lambda ()
	     (local-set-key "\C-cc" 'sml-execute-para-and-move)))
 ;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

 ;;;key bindings
 (global-set-key "\C-o" 'other-window)
					 ;(global-set-key (kbd "C-<tab>") 'next-buffer)
 (global-set-key (kbd "C-S-<tab>") 'previous-buffer)
 (global-set-key (kbd "C-z") 'undo)
 (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
 (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
 (global-set-key (kbd "S-C-<down>") 'shrink-window)
 (global-set-key (kbd "S-C-<up>") 'enlarge-window)
 (global-set-key "\C-xa" 'mark-whole-buffer)
 (add-hook 'dired-mode-hook
	   (lambda ()
	     (local-set-key "\C-o" 'other-window)))
 ;;;version control
 (setq version-control t)
 ;;(setq keep-old-versions 2)
 (setq kept-new-versions 2)
 ;;;Sunrise commander
; (require 'sunrise-commander)
 ;;(require 'sunrise-x-buttons)

 ;;;**********
 (blink-cursor-mode 0)
 (tool-bar-mode 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("f024aea709fb96583cf4ced924139ac60ddca48d25c23a9d1cd657a2cf1e4728" "e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" default)))
 '(exec-path
   (quote
	("/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/local/games" "/usr/local/libexec/emacs/24.5/x86_64-unknown-linux-gnu" "~/.local/bin")))
 '(org-agenda-files
   (quote
	("~/org/work.org" "~/org/remember.org" "~/org/gtd.org" "~/org/journal.org")))
 '(py-shell-name "ipython")
 '(safe-local-variable-values (quote ((Syntax . Common-Lisp))))
 '(scroll-bar-mode nil)
 '(x-select-enable-clipboard t))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
 ;;;unhighlight line
 (global-hl-line-mode 0)

 ;;; kill other window
 (defun kill-buffer-other-window()
   "kill the buffer in other window"
   (interactive)
   (other-window 1)
   (kill-buffer (nth 0 (buffer-list)))
   (other-window 1))
 (global-set-key "\C-q" 'kill-buffer-other-window) ; set it to \C-q
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;********************
 ;; (add-hook 'dired-mode-hook
 ;; (defun dired-up-directory-2 (&optional other-window)
 ;;   "Run Dired on parent directory of current directory.
 ;; Find the parent directory either in this buffer or another buffer.
 ;; Creates a buffer if necessary."
 ;;   (interactive "P")
 ;;   (set-buffer-modified-p nil)
 ;;   (let* ((dir (dired-current-directory))
 ;; 	 (up (file-name-directory (directory-file-name dir))))
 ;;     (or (dired-goto-file (directory-file-name dir))
 ;; 	;; Only try dired-goto-subdir if buffer has more than one dir.
 ;; 	(and (cdr dired-subdir-alist)
 ;; 	     (dired-goto-subdir up))
 ;; 	(progn
 ;; 	  (if other-window
 ;; 	      (dired-other-window up)
 ;; 	    (dired up))
 ;; 	  (dired-goto-file dir))))))
 ;; (add-hook 'dired-mode-hook
 ;; 	  (lambda()
 ;; 	    (local-set-key "^" 'dired-up-directory-2)))
 ;(dired-subdir-alist)

 ;;======================================================================
 ;;                 dired related functions
 ;;======================================================================
 (put 'dired-find-alternate-file 'disabled nil)
 ;; code to show and hide invisible files
 (defun dired-hide-line()
   (let ((start (progn 
		  (move-beginning-of-line 1)
		  (point)))
	 (end (progn
		(move-end-of-line 1)
		(point))))
     (facemenu-set-invisible start (+ 1 end))))
 (defun dired-hide-invisible-files ()
   (interactive)
   (setq buffer-read-only nil)
   (let ((nlines (count-lines (point-min) (point-max)))
	 (cur-line 1))
     (goto-char (point-min))
     (while (<= cur-line nlines)
       (setq file-name (dired-get-filename 'no-dir 1))
       (and  file-name 
	     (or (= (elt file-name 0) (elt "." 0))
		 (= (elt file-name 0) (elt "#" 0))
		 (= (elt file-name (1- (length file-name))) (elt "~" 0)))
	     (dired-hide-line)
	     (previous-line))
       (setq cur-line (+ 1 cur-line))
       (next-line)))
   (goto-char (point-min))
   (setq buffer-read-only t))
 (defun dired-show-invisible-files ()
   (interactive)
   (facemenu-remove-all (point-min) (point-max)))
 (defun dired-next-line-move-end-of-line ()
   (interactive)
   (next-line)
   (move-end-of-line 1))
 (defun dired-previous-line-move-end-of-line ()
   (interactive)
   (previous-line)
   (move-end-of-line 1))
 (add-hook 'dired-mode-hook
	   (lambda ()
	     (local-set-key "\C-ch" 'dired-hide-invisible-files)
	     (local-set-key "\C-cH" 'dired-show-invisible-files)
	     (local-set-key "n" 'dired-next-line-move-end-of-line)
	     (local-set-key "p" 'dired-previous-line-move-end-of-line)))         

 ;(require 'dired-details)
 ;(dired-details-install)

 ;; open a file with a default application and bind it to "\C-co"
 (defun dired-open-file-in-default-app ()
   (interactive)
   (dired-do-shell-command "xdg-open" :file-list (list (dired-get-filename))))
 (add-hook 'dired-mode-hook
	   (lambda ()
	     (local-set-key "\C-co" 'dired-open-file-in-default-app)
	     (local-set-key (kbd "C-c C-o") 'dired-open-file-in-default-app)))
 ;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

 ;;; common lisp: slime
 (add-to-list 'load-path "~/.emacs.d/slime/")
 (setq inferior-lisp-program "/usr/bin/sbcl")
 (require 'slime)
 ;(slime-setup '(slime-fancy)) ;;causing an error
 ;turning auto-pair mode off, not compatible with slime 
 (set-default 'autopair-dont-activate #'(lambda () (eq major-mode 'sldb-mode)))

 ;; tramp
 (setq tramp-default-method "ssh")

 ;; hide scroll-bar
 (menu-bar-no-scroll-bar)

 ;; ess 
(require 'ess-site)
; (setq ess-tracebug-prefix "\M-c")
; (setq ess-use-tracebug t)

 ;;some key bindings for ess
 (define-key comint-mode-map [(meta ?p)] 'comint-previous-matching-input-from-input)
 (define-key comint-mode-map [(meta ?n)] 'comint-next-matching-input-from-input)
 (setq ess-use-auto-complete t)

 ;; time at status bar
 (setq display-time-day-and-date nil)
 (display-time)

 ;; scheme mode
 (defun send-para-and-move (fn)
   "Send the current paragraph to the inferior process."
   (interactive)
   (backward-paragraph)
   (let ((begin (point)))
     (forward-paragraph)
     (funcall fn begin (point))))
 (defun geiser-eval-para-and-move ()
   (interactive)
   (send-para-and-move #'geiser-eval-region))
 (defun geiser-eval-definition-and-move ()
   (interactive)
   (geiser-eval-definition)
   (forward-paragraph))
 (defun geiser-eval-buffer ()
   (interactive)
   (geiser-eval-region (point-min) (point-max)))

 (add-hook 'scheme-mode-hook
	   (lambda ()
	     (local-set-key "\C-cc" 'geiser-eval-para-and-move)
	     (local-set-key "\C-cf" 'geiser-eval-definition-and-move)
	     (local-set-key "\C-cb" 'geiser-eval-buffer)
	     (local-set-key "\C-c<tab>" 'completion-at-point)
	     (local-set-key "\C-ci" 'geiser-doc-look-up-manual)))

 ;;====================================================================================================

 ;;======================================================================
 ;;                      octave mode
 ;;======================================================================

 (add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

 (defun octave-send-para-and-move ()
   "Send the current paragraph to the inferior python process."
   (interactive)
   (backward-paragraph)
   (let ((begin (point)))
     (forward-paragraph)
     (octave-send-region begin (point))))

 (defun octave-send-line-and-move ()
   "Send the current line and move to next line"
   (interactive)
   (move-beginning-of-line 1)
   (let ((begin (point)))
     (move-end-of-line 1)
     (octave-send-region begin (point)))
   (next-line))

 (add-hook 'octave-mode-hook
	   (lambda ()
	     (define-key octave-mode-map "\C-cf" 'octave-send-defun)
	     (define-key octave-mode-map "\C-cb" 'octave-send-show-buffer)
	     (define-key octave-mode-map "\C-cr" 'octave-send-region)
	     (define-key octave-mode-map "\C-cc" 'octave-send-para-and-move)
	     (define-key octave-mode-map "\C-cn" 'octave-send-line-and-move)))

 ;; ======================================================================
 ;;                               Ruby mode
 ;; ======================================================================
 (defun ruby-shell-send-para-and-move ()
   "Send the current paragraph to the inferior ruby process."
   (interactive)
   (backward-paragraph)
   (let ((begin (point)))
     (forward-paragraph)
     (ruby-send-region begin (point))))

 (defun ruby-shell-send-line-and-move ()
   "Send the current line and move to next line"
   (interactive)
   (move-beginning-of-line 1)
   (let ((begin (point)))
     (next-line)
     (ruby-send-region begin (point))))


 (add-hook 'enh-ruby-mode-hook
	   (lambda ()
	     (define-key ruby-mode-map "\C-cf" 'ruby-shell-send-defun)
	     (define-key ruby-mode-map "\C-cb" 'ruby-shell-send-buffer)
	     (define-key ruby-mode-map "\C-cr" 'ruby-shell-send-region)
	     (define-key ruby-mode-map "\C-cc" 'ruby-shell-send-para-and-move)
	     (define-key ruby-mode-map "\C-cn" 'ruby-shell-send-line-and-move)))
 ;;===============================================================================

 ;;==================================================
 ;;                       Org Mode
 ;;==================================================
 ;(setq org-journal-dir "~/work/journal")
 ;(setq org-todo-keywords
 ;     '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(setq calendar-date-style 'european)
(global-set-key "\C-col" 'org-store-link)
(global-set-key "\C-coc" 'org-capture)
;;(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-coa" 'org-agenda)
;; (global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cob" 'org-iswitchb)

;;integrate diary with org-mode
(setq org-agenda-include-diary t)

(org-babel-do-load-languages
 'org-babel-load-languages '((python . t) (R . t)))
;; setting default capture file
(setq org-default-notes-file "~/org/capture.org")

;; setting captuere templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
	 "* TODO %?\n  %i\n  %a")
	("r" "remember" entry (file "~/org/remember.org")
	 "* %?\nEntered on %U\n  %i\n  %a")
        ("o" "other" entry (file "~/org/capture.org")
	 "* %?\nEntered on %U\n  %i\n  %a")))
;;(setq org-startup-indented t) ;; clean view
;;=================================================================================

 ;; ace-jump mode
 (autoload
   'ace-jump-mode
   "ace-jump-mode"
   "Emacs quick move minor mode"
   t)
 ;; you can select the key you prefer to
 (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
 ;; enable a more powerful jump back function from ace jump mode
 (autoload
   'ace-jump-mode-pop-mark
   "ace-jump-mode"
   "Ace jump back:-)"
   t)
 (eval-after-load "ace-jump-mode"
   '(ace-jump-mode-enable-mark-sync))
 ;;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
 ;(ace-link-setup-default) ;bind o to go to 

;;; Hide show
(load-library "hideshow")
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'sh-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'ess-mode-hook 'hs-minor-mode)
;; redefining short keys
(add-hook 'hs-minor-mode-hook
	   (lambda ()
	     (define-key hs-minor-mode-map (kbd "C-c C-<tab>") 'hs-toggle-hiding)
		 ;;(define-key hs-minor-mode-map (kbd "C-c s") 'hs-show-all)
	     ;;(define-key hs-minor-mode-map (kbd "C-c h") 'hs-hide-all)
	     (define-key hs-minor-mode-map (kbd "C-c @ C-c") 'hs-hide-level)))

;; Hide the comments too when you do a 'hs-hide-all'
(setq hs-hide-comments nil)

;; Javascript (js2-modemode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Multiple-cursor
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; CUA mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; fonts-size - C-x C-+ to increase and C-x C-- to decrease font size
;;(set-default-font "Inconsolata 14")

;;; c-mode and cpp-mode
(require 'cc-mode)
(semantic-mode 1)
(semantic-add-system-include "/usr/include/")
;;(semantic-add-system-include "/usr/include/glib-2.0" 'c-mode)
;; above does not work, it's a bug, below is a workaround: http://sourceforge.net/p/cedet/mailman/message/30024135/
(add-hook 'c-mode-hook
	  '(lambda ()
	     (semantic-add-system-include "/usr/include/glib-2.0/" 'c-mode)))
;; compiling with glib
(require 'compile)
(add-hook 'c-mode-hook
           (lambda ()
	     (unless (file-exists-p "Makefile")
	       (set (make-local-variable 'compile-command)
                    ;; emulate make's .c.o implicit pattern rule, but with
                    ;; different defaults for the CC, CPPFLAGS, and CFLAGS
                    ;; variables:
                    ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
		    (let ((file (file-name-nondirectory buffer-file-name)))
                      (format "%s -std=c99 -o %s.o %s %s %s"
                              (or (getenv "CC") "gcc")
                              (file-name-sans-extension file)
							  file
                              (or (getenv "CPPFLAGS") "-DDEBUG=9")
                              (or (getenv "CFLAGS")
				  "-Wall $(pkg-config --cflags --libs glib-2.0)")))))))
(put 'erase-buffer 'disabled nil)

;;; helm-dash-docsets
;;(setq helm-dash-common-docsets '("Python2" "C" "C++" "Java"))
(setq helm-dash-browser-func 'w3m)
(defun py-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Python 2")))
(add-hook 'python-mode-hook 'py-doc)

(defun c-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("C")))
(add-hook 'c-mode-hook 'c-doc)

(defun cpp-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("C++")))
(add-hook 'c++-mode-hook 'c-doc)

(defun java-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Java")))
(add-hook 'java-mode-hook 'java-doc)




;;; w3m emacs-browser
;;(setq browse-url-browser-function 'w3m-browse-url) ;;sucks for c-doc, use chrome for a while.
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
;;(global-set-key "\C-xm" 'browse-url-at-point)
(setq w3m-use-cookies t) ;; use of cookies


;;; JAVA
(require 'eclim)
(require 'eclimd)
(global-eclim-mode)

(setq eclim-eclipse-dirs (expand-file-name "/opt/eclipse")
 	  eclim-executable (expand-file-name "/opt/eclipse/eclim")
 	  eclimd-executable (expand-file-name "/opt/eclipse/eclimd"))
;; 	  eclimd-default-workspace "~/javaws"
;; 	  help-at-pt-display-when-idle t
;; 	  help-at-pt-timer-delay 0.1)

(help-at-pt-set-timer)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(setq company-emacs-eclim-ignore-case t)
;;(setq eclimd-default-workspace "~/work/codes/java/eclim_workspace")
(setq eclimd-default-workspace "~/eclipse_workspace")

(defun my-java-prefs ()
  (setq-local helm-dash-docsets '("Java"))
  ;; by default it's activated in proper projects, for now I need it in
  ;; standalone files as well
  (eclim-mode 1)
  (setq tab-width 4
        c-electric-flag nil
        c-auto-newline nil)
  (local-set-key (kbd "C-c C-d C-d") 'eclim-java-show-documentation-for-current-element)
  (local-set-key (kbd "C-c C-d C-w") 'eclim-java-browse-documentation-at-point)
  (local-set-key (kbd "C-M-x") 'eclim-run-class)
  (local-set-key (kbd "C-c C-t C-t") 'eclim-run-test)
  (local-set-key (kbd "C-c <tab>") 'eclim-complete)
  (local-set-key (kbd "C-c C-t C-d") 'eclim-run-java-doc))

(add-hook 'java-mode-hook 'my-java-prefs)

;;; auctex mode
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; beamer class in org mode
(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))





