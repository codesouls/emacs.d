;;; init-projectile.el --- Project management

(require-package 'projectile)

(projectile-global-mode)
(setq projectile-mode-line
      '(:eval (format " P[%s]" (projectile-project-name))))


(provide 'init-projectile)
