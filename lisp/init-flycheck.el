;;; init-flycheck.el --- Flycheck config

(require-package 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)


(provide 'init-flycheck)
