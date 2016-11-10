;;; init-go.el --- Go config

(require-package 'go-mode)

(require-package 'company-go)

(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-go))
            (add-hook 'before-save-hook 'gofmt-before-save)))


(provide 'init-go)
