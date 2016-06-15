;;; init.el ---- Configuration init

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-package)
(require 'init-settings)

(require 'init-theme)
(require 'init-funcs)
(require 'init-keybindings)

(require 'init-company)
(require 'init-yasnippet)
(require 'init-heml)
(require 'init-projectile)

(require 'init-neotree)
(require 'init-powerline)
(require 'init-window-numbering)

(require 'init-magit)
(require 'init-flycheck)
(require 'init-which-key)

(require 'init-org)
(require 'init-markdown)

(require 'init-web)
(require 'init-javascript)
(require 'init-clojure)
(require 'init-rust)


(provide 'init)
