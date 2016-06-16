;;; complete.el --- Auto completion

(require-package 'company)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; javascript
(require-package 'company-tern)

(add-to-list 'company-backends 'company-tern)


(provide 'init-complete)
