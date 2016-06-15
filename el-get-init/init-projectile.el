(require 'projectile)

(projectile-global-mode)
(setq projectile-mode-line
      '(:eval (format " PJ[%s]" (projectile-project-name))))
