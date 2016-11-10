;;; init-projectile.el --- Project management

(require-package 'projectile)

(setq projectile-keymap-prefix (kbd "C-c C-p"))

(setq projectile-mode-line
      '(:eval (format " P[%s]" (projectile-project-name))))

(projectile-global-mode)


(provide 'init-projectile)
