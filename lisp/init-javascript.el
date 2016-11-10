;;; init-javascript.el --- Javascript config

;; js2-mode
(require-package 'json-mode)
(require-package 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

(setq-default js-indent-level 2)
(setq-default js2-basic-offset 2)

(setq js2-strict-missing-semi-warning nil)

;; tern
(require-package 'tern)
(require-package 'company-tern)

(add-hook 'js2-mode-hook
          (lambda ()
            (tern-mode t)
            (set (make-local-variable 'company-backends) '(company-tern))))

;; (add-to-list 'company-backends 'company-tern)

;; js2-refactor
;; (require-package 'js2-refactor)

;; (add-hook 'js2-mode-hook #'js2-refactor-mode)

;; (js2r-add-keybindings-with-prefix "C-c C-m")


(provide 'init-javascript)
