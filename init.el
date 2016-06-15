;;; init.el --- Config init

;; Author: da07ng <me@gaodaojing.com>
;;

;; Path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Setting
(require 'init-package)
(require 'init-settings)

(require 'init-funcs)
(require 'init-keybindings)

(require 'init-company)
(require 'init-yasnippet)
(require 'init-heml)
(require 'init-projectile)

(require 'init-theme)
(require 'init-powerline)
(require 'init-neotree)
(require 'init-window-numbering)

(require 'init-magit)
(require 'init-flycheck)
(require 'init-which-key)

(require 'init-org)
(require 'init-markdown)

(require 'init-web)
(require 'init-javascript)
(require 'init-python)
(require 'init-clojure)
(require 'init-rust)


(provide 'init)
