;;; init.el --- Config init

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;; Bootstrap config
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-utils)
;; (package-initialize)
(require 'init-elpa)

;;; Load configs for specific features and modes
(require 'init-settings)

(require 'init-defuncs)
(require 'init-keybindings)

(require 'init-company)
(require 'init-yasnippet)
(require 'init-helm)
(require 'init-projectile)

(require 'init-theme)
(require 'init-powerline)
(require 'init-neotree)
(require 'init-window-numbering)
(require 'init-undo-tree)

(require 'init-magit)
(require 'init-flycheck)
(require 'init-which-key)

(require 'init-orgmode)
(require 'init-markdown)

(require 'init-web)
(require 'init-javascript)
(require 'init-python)
(require 'init-go)

;;; Allow access from emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))


(provide 'init)
