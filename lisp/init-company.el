;;; init-company.el --- Auto completion

(require-package 'company)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)


(provide 'init-company)
