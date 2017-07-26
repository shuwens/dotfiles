;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
 "Configuration Layers declaration.
 You should not put any user code in this function besides modifying the variable
 values."
 (setq-default
  ;; Base distribution to use. This is a layer contained in the directory
  ;; `+distribution'. For now available distributions are `spacemacs-base'
  ;; or `spacemacs'. (default 'spacemacs)
  dotspacemacs-distribution 'spacemacs
  ;; List of additional paths where to look for configuration layers.
  ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
  dotspacemacs-configuration-layer-path '()
  ;; List of configuration layers to load. If it is the symbol `all' instead
  ;; of a list then all discovered layers will be installed.

  dotspacemacs-configuration-layers
  '(
    ;; ----------------------------------------------------------------
    ;; Example of useful layers you may want to use right away.
    ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
    ;; <M-m f e R> (Emacs style) to install them.
    ;; ----------------------------------------------------------------
    (auto-completion :variables
     auto-completion-return-key-behavior 'complete
     ;;auto-completion-tab-key-behavior 'cycle
     auto-completion-complete-with-key-sequence nil
     auto-completion-complete-with-key-sequence-delay 0.1
     auto-completion-private-snippets-directory nil
     auto-completion-enable-sort-by-usage t)
    yasnippet
    better-defaults
    gtags
    ;;---------------------
    ;;   For languages
    ;;---------------------
    emacs-lisp
    haskell
  scala
  python
  java
  (c-c++ :variables
   c-c++-enable-clang-support t
   c-c++-default-mode-for-headers 'c++-mode)
  git
  cscope
  markdown
  helm
  helm-gtags
  semantic
  dash
  org
  (shell :variables
   shell-default-shell 'eshell
   shell-default-height 30
   shell-default-position 'top)
  spell-checking
  syntax-checking
  ;; version-control
  )
  ;; List of additional packages that will be installed without being
  ;; wrapped in a layer. If you need some configuration for these
  ;; packages, then consider creating a layer. You can also put the
  ;; configuration in `dotspacemacs/user-config'.
  dotspacemacs-additional-packages '(igrep)
  ;; A list of packages and/or extensions that will not be install and loaded.
  dotspacemacs-excluded-packages '()
  ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
  ;; are declared in a layer which is not a member of
  ;; the list `dotspacemacs-configuration-layers'. (default t)
  dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
 "Initialization function.
 This function is called at the very startup of Spacemacs initialization
 before layers configuration.
 You should not put any user code in there besides modifying the variable
 values."
 ;; This setq-default sexp is an exhaustive list of all the supported
 ;; spacemacs settings.
 (setq-default
  ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
  ;; possible. Set it to nil if you have no way to use HTTPS in your
  ;; environment, otherwise it is strongly recommended to let it set to t.
  ;; This variable has no effect if Emacs is launched with the parameter
  ;; `--insecure' which forces the value of this variable to nil.
  ;; (default t)
  dotspacemacs-elpa-https t
  ;; Maximum allowed time in seconds to contact an ELPA repository.
  dotspacemacs-elpa-timeout 5
  ;; If non nil then spacemacs will check for updates at startup
  ;; when the current branch is not `develop'. (default t)
  dotspacemacs-check-for-update nil ;;t
  ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
  ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
  ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
  ;; unchanged. (default 'vim)
  dotspacemacs-editing-style 'emacs
  ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
  dotspacemacs-verbose-loading nil
  ;; Specify the startup banner. Default value is `official', it displays
 ;; the official spacemacs logo. An integer value is the index of text
 ;; banner, `random' chooses a random text banner in `core/banners'
 ;; directory. A string value must be a path to an image format supported
 ;; by your Emacs build.
 ;; If the value is nil then no banner is displayed. (default 'official)
 dotspacemacs-startup-banner 'official
 ;; List of items to show in the startup buffer. If nil it is disabled.
 ;; Possible values are: `recents' `bookmarks' `projects'.
 ;; (default '(recents projects))
 dotspacemacs-startup-lists '(recents projects)
 ;; Number of recent files to show in the startup buffer. Ignored if
 ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
 dotspacemacs-startup-recent-list-size 5
 ;; Default major mode of the scratch buffer (default `text-mode')
 dotspacemacs-scratch-mode 'text-mode
 ;; List of themes, the first of the list is loaded when spacemacs starts.
 ;; Press <SPC> T n to cycle to the next theme in the list (works great
     ;; with 2 themes variants, one dark and one light)
 dotspacemacs-themes '(doom-one
     spacemacs-dark
     spacemacs-light
     solarized-light
     solarized-dark
     leuven
     doom
     monokai
     zenburn)
 ;; If non nil the cursor color matches the state color in GUI Emacs.
 dotspacemacs-colorize-cursor-according-to-state t
 ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
 ;; size to make separators look not too crappy.
 dotspacemacs-default-font '("Source Code Pro"
     :size 16 ;; Arch is different from OS X! 
     :weight normal
     :width normal
     :powerline-scale 1.1)
 ;; The leader key
 dotspacemacs-leader-key "SPC"
 ;; The leader key accessible in `emacs state' and `insert state'
 ;; (default "M-m")
 dotspacemacs-emacs-leader-key "M-m"
 ;; Major mode leader key is a shortcut key which is the equivalent of
 ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
 dotspacemacs-major-mode-leader-key ","
 ;; Major mode leader key accessible in `emacs state' and `insert state'.
 ;; (default "C-M-m)
 dotspacemacs-major-mode-emacs-leader-key "C-M-m"
 ;; These variables control whether separate commands are bound in the GUI to
 ;; the key pairs C-i, TAB and C-m, RET.
 ;; Setting it to a non-nil value, allows for separate commands under <C-i>
 ;; and TAB or <C-m> and RET.
 ;; In the terminal, these pairs are generally indistinguishable, so this only
 ;; works in the GUI. (default nil)
 dotspacemacs-distinguish-gui-tab nil
 ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
 ;; The command key used for Evil commands (ex-commands) and
 ;; Emacs commands (M-x).
 ;; By default the command key is `:' so ex-commands are executed like in Vim
 ;; with `:' and Emacs commands are executed with `<leader> :'.
 dotspacemacs-command-key ":"
 ;; If non nil `Y' is remapped to `y$'. (default t)
 dotspacemacs-remap-Y-to-y$ t
 ;; Name of the default layout (default "Default")
 dotspacemacs-default-layout-name "Default"
 ;; If non nil the default layout name is displayed in the mode-line.
 ;; (default nil)
 dotspacemacs-display-default-layout nil
 ;; If non nil then the last auto saved layouts are resume automatically upon
 ;; start. (default nil)
 dotspacemacs-auto-resume-layouts nil
 ;; Location where to auto-save files. Possible values are `original' to
 ;; auto-save the file in-place, `cache' to auto-save the file to another
 ;; file stored in the cache directory and `nil' to disable auto-saving.
 ;; (default 'cache)
 dotspacemacs-auto-save-file-location 'cache
 ;; Maximum number of rollback slots to keep in the cache. (default 5)
 dotspacemacs-max-rollback-slots 5
 ;; If non nil then `ido' replaces `helm' for some commands. For now only
 ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
 ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
 dotspacemacs-use-ido nil
 ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
 dotspacemacs-helm-resize nil
 ;; if non nil, the helm header is hidden when there is only one source.
 ;; (default nil)
 dotspacemacs-helm-no-header nil
 ;; define the position to display `helm', options are `bottom', `top',
 ;; `left', or `right'. (default 'bottom)
 dotspacemacs-helm-position 'bottom
 ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
 ;; several times cycle between the kill ring content. (default nil)
 dotspacemacs-enable-paste-micro-state nil
 ;; Which-key delay in seconds. The which-key buffer is the popup listing
 ;; the commands bound to the current keystroke sequence. (default 0.4)
 dotspacemacs-which-key-delay 1.0  ;; 0.4
 ;; Which-key frame position. Possible values are `right', `bottom' and
 ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
 ;; right; if there is insufficient space it displays it at the bottom.
 ;; (default 'bottom)
 dotspacemacs-which-key-position 'right ;bottom
 ;; If non nil a progress bar is displayed when spacemacs is loading. This
 ;; may increase the boot time on some systems and emacs builds, set it to
 ;; nil to boost the loading time. (default t)
 dotspacemacs-loading-progress-bar nil ;;t
 ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
 ;; (Emacs 24.4+ only)
 dotspacemacs-fullscreen-at-startup t ;;nil
 ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
 ;; Use to disable fullscreen animations in OSX. (default nil)
 dotspacemacs-fullscreen-use-non-native nil
 ;; If non nil the frame is maximized when Emacs starts up.
 ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
 ;; (default nil) (Emacs 24.4+ only)
 dotspacemacs-maximized-at-startup t ;;nil
 ;; A value from the range (0..100), in increasing opacity, which describes
 ;; the transparency level of a frame when it's active or selected.
 ;; Transparency can be toggled through `toggle-transparency'. (default 90)
 dotspacemacs-active-transparency 90
 ;; A value from the range (0..100), in increasing opacity, which describes
 ;; the transparency level of a frame when it's inactive or deselected.
 ;; Transparency can be toggled through `toggle-transparency'. (default 90)
 dotspacemacs-inactive-transparency 90
 ;; If non nil unicode symbols are displayed in the mode line. (default t)
 dotspacemacs-mode-line-unicode-symbols t
 ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
 ;; scrolling overrides the default behavior of Emacs which recenters the
 ;; point when it reaches the top or bottom of the screen. (default t)
 dotspacemacs-smooth-scrolling t
 ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
 ;; derivatives. If set to `relative', also turns on relative line numbers.
 ;; (default nil)
 dotspacemacs-line-numbers nil
 ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
 ;; (default nil)
 dotspacemacs-smartparens-strict-mode t ;;nil
 ;; Select a scope to highlight delimiters. Possible values are `any',
 ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
     ;; emphasis the current one). (default 'all)
 dotspacemacs-highlight-delimiters 'all
 ;; If non nil advises quit functions to keep server open when quitting.
 ;; (default nil)
 dotspacemacs-persistent-server nil
 ;; List of search tool executable names. Spacemacs uses the first installed
 ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
 ;; (default '("ag" "pt" "ack" "grep"))
 dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now. (default nil)
 dotspacemacs-default-package-repository nil
 ;; Delete whitespace while saving buffer. Possible values are `all'
 ;; to aggressively delete empty line and long sequences of whitespace,
 ;; `trailing' to delete only the whitespace at end of lines, `changed'to
 ;; delete only whitespace for changed lines or `nil' to disable cleanup.
 ;; (default nil)
 dotspacemacs-whitespace-cleanup nil
 ))

(defun dotspacemacs/user-init ()
 "Initialization function for user code.
 It is called immediately after `dotspacemacs/init'.  You are free to put almost
 any user code here.  The exception is org related code, which should be placed
 in `dotspacemacs/user-config'."
 (add-hook 'prog-mode-hook
  (lambda ()
   (setq-default indent-tabs-mode t
    tab-width 8
    c-basic-offset )
   (setq indent-tabs-mode t
    tab-width 8
    c-basic-offset 8)))
 (add-hook 'python-mode-hook (lambda () (setq indent-tabs-mode t))) 
 ;;python-indent-offset 4

 (setq python-fill-column 80)
 )

(defun dotspacemacs/user-config ()
 "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
 layers configuration. You are free to put any user code."

 (use-package graphviz-dot-mode
  :defer t)
 (global-set-key (kbd "C-x ^") 'join-line)
 (global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
 ;; Start proced in a similar manner to dired
 (global-set-key (kbd "C-x p") 'proced)
 ;; Start eshell or switch to it if it's active.
 (global-set-key (kbd "C-x m") 'eshell)
 ;; Start a new eshell even if one is active.
 (global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

 ;; Help should search more than just commands
 (global-set-key (kbd "C-h a") 'apropos)
 ;; Should be able to eval-and-replace anywhere.
 (global-set-key (kbd "C-c e") 'eval-and-replace)
 ;; Magit rules!
(global-set-key (kbd "C-x g") 'magit-status)
;; This is a little hacky since VC doesn't support git add internally
;; (eval-after-load 'vc
    ;;  (define-key vc-prefix-map "i" '(lambda () (interactive)
        ;;                                   (if (not (eq 'Git (vc-backend buffer-file-name)))
          ;;                                       (vc-register)
          ;;                                     (shell-command (format "git add %s" buffer-file-name))
          ;;                                     (message "Staged changes.")))))
;; Activate occur easily inside isearch
;;(define-key isearch-mode-map (kbd "C-o")
    ;;  (lambda () (interactive)
      ;;    (let ((case-fold-search isearch-case-fold-search))
        ;;      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

;; c-c++
;; Bind clang-format-region to C-M-tab in all modes:
(global-set-key [C-M-tab] 'clang-format-region)
;; Bind clang-format-buffer to tab on the c++-mode only:
  (add-hook 'c++-mode-hook 'clang-format-bindings)
(defun clang-format-bindings ()
 (define-key c++-mode-map [tab] 'clang-format-buffer))

  ;; Org
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)

  ;; program shortcuts - s stands for windows key(super)
  ;;(global-set-key (kbd "s-b") 'browse-url)          ;; Browse (W3M)
  ;;(global-set-key (kbd "s-f") 'browse-url-firefox)  ;; Firefox...
  ;;(global-set-key (kbd "s-l") 'linum-mode)          ;; show line numbers in buffer
  ;;(global-set-key (kbd "s-r") 're-builder)          ;; build regular expressions
  ;; Super + uppercase letter signifies a buffer/file
  ;;(global-set-key (kbd "s-S")                       ;; scratch
      ;;                (lambda()(interactive)(switch-to-buffer "*scratch*")))
  ;;(global-set-key (kbd "s-E")                       ;; .emacs
      ;;                (lambda()(interactive)(find-file "~/emacs/dot-emacs.el")))
  ;; cycle through buffers
  (global-set-key (kbd "<C-tab>") 'bury-buffer)

  ;; use hippie-expand instead of dabbrev
  (global-set-key (kbd "M-/") 'hippie-expand)

  ;; spell check Bulgarian text
  ;;(global-set-key (kbd "C-c B")
      ;;                (lambda()(interactive)
        ;;                  (ispell-change-dictionary "bulgarian")
        ;;                  (flyspell-buffer)))
  ;; replace buffer-menu with ibuffer
  ;;(global-set-key (kbd "C-x C-b") 'ibuffer)

  ;; interactive text replacement
  (global-set-key (kbd "C-c C-r") 'iedit-mode)

  ;; swap windows
  (global-set-key (kbd "C-c s") 'swap-windows)

  ;; duplicate the current line or region
  (global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

  ;; rename buffer & visited file
  (global-set-key (kbd "C-c r") 'rename-file-and-buffer)

  ;; open an ansi-term buffer
  ;;(global-set-key (kbd "C-x t") 'visit-term-buffer)



  ;;(require 'setup-helm)
  ;;(require 'setup-helm-gtags)
  ;; Enable helm-gtags-mode
  (add-hook 'dired-mode-hook 'helm-gtags-mode)
  (add-hook 'eshell-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode)

  ;; setup google c style
  ;;(require 'google-c-style)
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)

  ;; (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
  ;; (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
  ;; (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
  ;; (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
  ;; (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  ;; (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(defun c-lineup-arglist-tabs-only (ignored)
 "Line up argument lists by tabs, not spaces"
 (let* ((anchor (c-langelem-pos c-syntactic-element))
        (column (c-langelem-2nd-pos c-syntactic-element))
        (offset (- (1+ column) anchor))
        (steps (floor offset c-basic-offset)))
  (* (max steps 1)
   c-basic-offset)))

  (add-hook 'c-mode-common-hook
   (lambda ()
    ;; Add kernel style
    (c-add-style
     "linux-tabs-only"
     '("linux" (c-offsets-alist
         (arglist-cont-nonempty
          c-lineup-gcc-asm-reg
          c-lineup-arglist-tabs-only))))))

  (add-hook 'c-mode-hook
   (lambda ()
    (let ((filename (buffer-file-name)))
     ;; Enable kernel mode for the appropriate files
     (when (and filename
            (string-match (expand-file-name "~/dev/chromebook/cras")
             filename))
      (setq indent-tabs-mode t)
      (c-set-style "linux-tabs-only")))))

  ;;; tmp -- this function resolve the Emacs25 warning.
(defun my-package-recompile()
 "Recompile all packages"
 (interactive)
 (byte-recompile-directory "~/.emacs.d/elpa" 0 t))

  ;;(global-unset-key (kbd "C-x C-c"))
  ;; I never use C-x C-c
  (defalias 'exit 'save-buffers-kill-emacs)

  ;; asm mode
  (require 'asm-mode)
  (add-hook 'asm-mode-hook (lambda ()
                            (setq indent-tabs-mode nil) ; use spaces to indent
                            (electric-indent-mode -1) ; indentation in asm-mode is annoying
                            (setq tab-stop-list (number-sequence 8 80 8))))

  (define-key asm-mode-map (kbd "<ret>") 'newline-and-indent)
  (define-key asm-mode-map (kbd "M-.") 'helm-gtags-select)

  )

  ;; Do not write anything past this comment. This is where Emacs will
  ;; auto-generate custom variable definitions.

  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (doom-one)))
 '(custom-safe-themes
   (quote
    ("a6e5edd129bc48c9540ab6ed4a76a2e4e0da6359e981a3ec0bffbeb4416d4cc9" default)))
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (doom-themes doom-theme yapfify winum uuidgen unfill py-isort org-projectile org-download mwim live-py-mode link-hint intero hlint-refactor hide-comnt helm-hoogle git-link fuzzy flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff goto-chg undo-tree eshell-z dumb-jump diminish company-ghci company-emacs-eclim column-enforce-mode shm noflet hindent haskell-snippets flycheck-haskell ensime sbt-mode scala-mode eclim company-ghc ghc haskell-mode company-cabal cmm-mode zeal-at-point helm-dash stickyfunc-enhance srefactor emacs-eclim disaster company-c-headers cmake-mode clang-format paradox hydra company-statistics adaptive-wrap xterm-color ws-butler window-numbering volatile-highlights vi-tilde-fringe toc-org spaceline powerline smooth-scrolling smeargle shell-pop restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-yapf popwin pip-requirements persp-mode pcre2el spinner page-break-lines orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide igrep ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gtags helm-gitignore request helm-flyspell helm-flx helm-descbinds helm-cscope xcscope helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md ggtags flycheck-pos-tip flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu eval-sexp-fu highlight eshell-prompt-extras esh-help elisp-slime-nav define-word cython-mode company-quickhelp pos-tip company-anaconda company clean-aindent-mode buffer-move bracketed-paste auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed anaconda-mode pythonic f dash s aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build use-package which-key bind-key bind-map evil spacemacs-theme))))

  
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
