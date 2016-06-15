(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)

(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode textile-mode markdown-mode yaml-mode
                                    web-mode js2-mode js2-jsx-mode css-mode scss-mode json-mode
                                    python-mode go-mode clojure-mode rust-mode lisp-mode))
  (add-to-list 'ac-modes mode))
