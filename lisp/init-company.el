;;; init-company.el --- Auto completion

(require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)


(provide 'init-company)
