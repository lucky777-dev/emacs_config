;;; init.el starts here

;;;======================================================================
;;; Initialization
;;;======================================================================

(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("elpa" . "https://elpa.gnu.org/packages/")))
        
;; Initialize the packages, avoiding a re-initialization.

(unless (bound-and-true-p package--initialized)
  (setq package-enable-at-startup nil)
  (package-initialize))

;; Make sure `use-package' is available.

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure `use-package' prior to loading it.

(eval-and-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t)
  (setq use-package-compute-statistics nil)
  ;; The following is VERY IMPORTANT.  Write hooks using their real name
  ;; instead of a shorter version: after-init ==> `after-init-hook'.
  ;;
  ;; This is to empower help commands with their contextual awareness,
  ;; such as `describe-symbol'.
  (setq use-package-hook-name-suffix nil))

(eval-when-compile
  (require 'use-package))
  
(use-package diminish :ensure t :after use-package) ;; if you use :diminish
(use-package bind-key :ensure t :after use-package) ;; if you use any :bind variant

;;;======================================================================
;;; Emacs config
;;;======================================================================

(use-package emacs
    :config
    (fset 'yes-or-no-p 'y-or-n-p))                 ;; "y/n" instead of "yes/no" makes answering questions faster

;;;======================================================================
;;; Org config
;;;======================================================================

(use-package org
    :config
    (setq org-ellipsis " ⤵")
    (setq org-adapt-indentation nil)                ;; No auto Tab indentation
    ;;;(setq org-src-tab-acts-natively t)              ;; Active Tab indentation for src blocks
    (setq org-support-shift-select t))              ;; Active "Shift + arrow" to select text
    
(use-package org-bullets
    :ensure t
    :init
    (setq org-bullets-bullet-list
        '("◉" "◎" "⚫" "○" "•" "·" "."))
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
    
(eval-after-load "org"
  '(require 'ox-md nil t))

;;;======================================================================
;;; Spell Checking
;;;======================================================================

;; Requires aspell, aspell-en & aspell-fr to work

(use-package flyspell
  :ensure t
  :defer t
  :hook ((text-mode-hook . flyspell-mode)
         (prog-mode-hook . flyspell-prog-mode))
  
  :config
  (setq flyspell-issue-message-flag nil)
  (setq flyspell-issue-welcome-flag nil)
  (setq ispell-program-name "aspell")
  (setq ispell-dictionary "fr_FR")
  
  (defun refresh-flyspell-buffer(&rest _)
    "Refreshes flyspell for the entire buffer."
  (flyspell-buffer)))
  
  ;; Run refresh-flyspell-buffer() every time we change the dictionnary, select another buffer or load a new file
  
;;  (advice-add 'ispell-change-dictionary :after #'refresh-flyspell-buffer)
;;  (advice-add 'switch-to-buffer :after #'refresh-flyspell-buffer)
;;  (advice-add 'switch-to-buffer-other-windows :after #'refresh-flyspell-buffer)
;;  (advice-add 'switch-to-buffer-other-frame :after #'refresh-flyspell-buffer)
;;  (advice-add 'previous-buffer :after #'refresh-flyspell-buffer)
;;  (advice-add 'next-buffer :after #'refresh-flyspell-buffer)
;;  (advice-add 'find-file :after #'refresh-flyspell-buffer))

;; Syntax checking for GNU Emacs

(use-package flycheck
  :ensure t
  :defer t
  :config
  (setq flycheck-check-syntax-automatically '(mode-enabled save)) ; Check on save instead of running constantly
  :hook ((prog-mode-hook text-mode-hook) . flycheck-mode))

;;;======================================================================
;;; Latex PDF Config
;;;======================================================================

(use-package template
  :after org ox-latex
  :load-path (lambda () (concat user-emacs-directory "latex")))

(use-package ox-latex
  :defer t
  :after org
  :config
  (add-to-list 'org-latex-packages-alist
            '("AUTO" "polyglossia" t ("xelatex" "lualatex")))
  (setq
   org-latex-listings 'minted           ;; Enable minted color mode for src blocks
   org-latex-minted-options '(("linenos=true") ("bgcolor=luckylightgray") ("breaklines=true")))

  (setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f")))
  
;;;======================================================================
;;; Babel
;;;======================================================================

(use-package ob
  :after org
  :defer nil
  :defines (org-ditaa-jar-path org-plantuml-jar-path)
  :config
  (setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar"
        org-plantuml-jar-path "/usr/share/java/plantuml/plantuml.jar")
  (setq org-babel-load-languages
    '((latex . t)
      (python . t)
      (shell . t)
      (sql . t)
      (sqlite . t)
      (emacs-lisp . t)
      (java . t)
      (C . t)
      (js . t)
      (makefile . t)))
  
  (org-babel-do-load-languages
   'org-babel-load-languages
   org-babel-load-languages))
   
(use-package rustic
  :custom
  (rustic-format-on-save t)
  (rustic-indent-method-chain t)
  ;; The default is 'rls
  (rustic-lsp-server 'rust-analyzer))
   
;;;========================================
;;; Snippets
;;;========================================

(use-package yasnippet
  :ensure t
  :defer 3
  :config
  (yas-global-mode))

(use-package yasnippet-snippets
  :ensure t
  :defer t
  :after yasnippet)

;;; init.el ends here

;;;======================================================================
;;; Customization
;;;======================================================================
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(display-battery-mode t)
 '(doc-view-continuous t)
 '(package-selected-packages
   (quote
    (lsp-mode rustic gnu-elpa-keyring-update yasnippet-snippets yasnippet use-package flycheck diminish)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 143 :width normal))))
 '(org-ellipsis ((t (:foreground "dark gray" :underline nil))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "red"))))
 '(org-level-2 ((t (:inherit outline-2 :foreground "orange"))))
 '(org-level-3 ((t (:inherit outline-3 :foreground "yellow"))))
 '(org-level-4 ((t (:inherit outline-4 :foreground "green"))))
 '(org-level-5 ((t (:inherit outline-5 :foreground "deep sky blue"))))
 '(org-level-6 ((t (:inherit outline-6 :foreground "dark violet"))))
 '(org-level-7 ((t (:inherit outline-7 :foreground "dark gray"))))
 '(org-level-8 ((t nil))))
