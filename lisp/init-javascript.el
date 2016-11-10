;;; init-javascript.el --- Javascript config

;; js2-mode
(require-package 'json-mode)
(require-package 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

(setq-default js-indent-level 2
              js2-basic-offset 2)

(after-load 'js2-mode
  ;; Disable js2 mode's syntax error highlighting by default...
  (setq-default js2-mode-show-parse-errors nil
                js2-mode-show-strict-warnings nil)
  ;; ... but enable it if flycheck can't handle javascript
  (autoload 'flycheck-get-checker-for-buffer "flycheck")
  (defun disable-js2-checks-if-flycheck-active ()
    (unless (flycheck-get-checker-for-buffer)
      (set (make-local-variable 'js2-mode-show-parse-errors) t)
      (set (make-local-variable 'js2-mode-show-strict-warnings) t)))
  (add-hook 'js2-mode-hook 'disable-js2-checks-if-flycheck-active)

  (add-hook 'js2-mode-hook
            (lambda ()
              (setq mode-name "JS2")))

  (after-load 'js2-mode
    (js2-imenu-extras-setup)))

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
