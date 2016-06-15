(require-package 'company)
(require-package 'company-tern)

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-tern)

(provide 'init-company)
