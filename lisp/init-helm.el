;;; init-helm.el --- Helm config

(require-package 'helm)

(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

;; projectile support
(require-package 'helm-projectile)


(provide 'init-helm)
