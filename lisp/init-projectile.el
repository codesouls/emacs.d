(require-package 'projectile)
(require-package 'helm-projectile)

(projectile-global-mode)
(setq projectile-mode-line
      '(:eval (format " PJ[%s]" (projectile-project-name))))

(provide 'init-projectile)
