;; ===========================================
;; FileName: .emacs.d
;; Author: DaoJing Gao(@Gaucs)
;; Email: me@gaodaojing.com
;; Site: http://gaodaojing.com
;; Version: 1.2
;; ===========================================

;; (add-to-list 'load-path "~/.emacs.d")
;; (add-to-list 'load-path "~/.emacs.d/conf")

;; Basic {{{
  ;; (load "basic")

  ;; 设置个人信息
  (setq user-full-name "DaoJing Gao")
  (setq user-mail-address "me@gaodaojing.com")

  ;; 初始化设置
  (setq-default inhibit-startup-screen t)
  (setq-default initial-scratch-message nil)
  (setq-default initial-major-mode 'emacs-lisp-mode)

  ;;禁用工具栏
  (tool-bar-mode 0)

  ;;禁用菜单栏，F10 开启关闭菜单
  (menu-bar-mode 0)

  ;; 显示行号
  (global-linum-mode t)

  ;; 显示匹配的括号
  (show-paren-mode t)

  ;; 设置时间格式
  (display-time-mode 1)
  (setq-default display-time-24hr-format t)
  (setq-default display-time-day-and-date nil)

  ;; 在状态栏显示行列号
  (setq-default line-number-mode t)
  (setq-default column-number-mode t)

  ;; 关闭烦人的出错时的提示声
  (setq-default visible-bell t)

  ;; 使用 "y/n" 代替 "yes/no"
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; 制表符
  (setq-default tab-width 2)
  (setq-default indent-tabs-mode nil)
  (setq x-stretch-cursor t)

  ;; 立即在回显区显示按键
  (setq-default echo-keystrokes -1)

  ;; 在保存之前删除行末空白
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;;设置默认读入文件编码
  (prefer-coding-system 'utf-8)

  ;;设置写入文件编码
  (setq default-buffer-file-coding-system 'utf-8)

  ;; 总是以一个换行符结束文件
  (setq-default require-final-newline t)

  ;; 由菜单修改配置的东西将会保存在 custom-file 里
  (setq-default custom-file "~/.emacs.d/.custom-file.el")
  (if (file-exists-p custom-file) (load custom-file))

  ;; 备份设置
  (setq-default make-backup-file t)
  (setq version-control t)
  (setq kept-old-versions 2)
  (setq kept-new-versions 5)
  (setq delete-old-versions t)
  (setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
  (setq backup-by-copying t)

  ;; 支持emacs和外部程序的粘贴
  (setq-default x-select-enable-clipboard t)

  ;; 括号匹配时显示另外一边的括号，而不是跳转到另一个括号
  (when (fboundp 'show-paren-mode)
    (show-paren-mode t)
    (setq-default show-paren-style 'parentheses))

  ;; 光标靠近时，鼠标不动
  (mouse-avoidance-mode 'none)

  ;; 禁止光标和屏幕闪烁
  (when (fboundp 'blink-cursor-mode)
    (blink-cursor-mode -1)
    (setq-default visible-bell nil))

  ;; 不要在鼠标点击的那个地方插入剪贴板内容
  (setq-default mouse-yank-at-point t)

  ;; 递归使用 minibuffer
  (setq-default enable-recursive-minibuffers t)

  ;; 在标题栏显示 buffer 的名字
  (setq-default frame-title-format '(buffer-file-name "%f" ("%b")))

  ;; 加载默认的库，default.el
  (setq-default inhibit-default-init t)

  ;; 并且使 text-mode 每 80 个字符自动缩进
  (add-hook 'text-mode-hook 'turn-on-auto-fill)
  (setq-default fill-column 80)

  ;; 比较差异文件时启动 -u 模式
  (setq-default diff-switches "-u")

  ;; 显示行尾的空白字符
  (setq-default show-trailing-whitespace 1)

  ;; 提示文件结尾的空行
  (setq-default indicate-empty-lines 1)

  ;; ibuffer
  (defalias 'list-buffers 'ibuffer)

  ;; 取消原本不开启的命令
  (put 'narrow-to-region 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  (put 'scroll-left 'disabled nil)
  (put 'narrow-to-page 'disabled nil)
  (put 'erase-buffer 'disabled nil)

  ;; 字体配置
  (set-face-attribute
   'default nil :font "Inconsolata 15")

  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft YaHei" :size 15)))
;; }}}


;; Initialise el-get {{{

  (require 'package)
  (package-initialize)

  ;(setq el-get-user-package-directory "~/.emacs.d/el-get-init-files/")
  (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
      (url-retrieve-synchronously
        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (let (el-get-master-branch)
        (goto-char (point-max))
        (eval-print-last-sexp))))

  ;; personal recipes
  (setq el-get-sources
        '((:name el-get :branch "master")))

  ;; my package
  (setq my-packages
        (append
          '(el-get
            org-mode
            tomorrow-theme
            auto-complete
            yasnippet
            neotree
            autopair
            tabbar-ruler
            helm

            markdown-mode

            web-mode
            ;; slim-mode
            js2-mode
            coffee-mode
            jshint-mode
            json-mode
            ;; scss-mode
            less-css-mode

            python
            pyvenv
            pymacs
            rope
            ropemacs
            ropemode
            py-autopep8

            go-mode
            go-autocomplete

            ;; rust-mode

            ;; ruby-mode
            ;; ruby-end
            ;; inf-ruby
            ;; ruby-compilation
            ;; yaml-mode
            ;; rvm
            ;; rinari
	    )

         (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

  (el-get 'sync my-packages)


  ;; my packages setting
  ;; (load "plugin")

  ;; theme
  (require 'color-theme-tomorrow)
  (color-theme-tomorrow--define-theme night-eighties)

  ;; auto-complete
  (require 'auto-complete)
  (require 'auto-complete-config)
  (ac-config-default)

  (define-key ac-menu-map "\C-n" 'ac-next)
  (define-key ac-menu-map "\C-p" 'ac-previous)

  (dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode
                  go-mode python-mode ruby-mode
                  html-mode js2-mode coffee-mode css-mode sass-mode scss-mode less-css-mode json-mode
                  lisp-mode textile-mode markdown-mode yaml-mode))
   (add-to-list 'ac-modes mode))

  ;; yasnippet
  (require 'yasnippet)
  (yas/global-mode 1)
  (yas/minor-mode-on)

  ;; neotree
  (require 'neotree)
  (global-set-key [f4] 'neotree-toggle)

  ;; autopair
  (require 'autopair)
  (autopair-global-mode)

  ;; tabbar-ruler
  (setq tabbar-ruler-global-tabbar t) ; If you want tabbar
  ;; (setq tabbar-ruler-global-ruler t) ; if you want a global ruler
  (require 'tabbar-ruler)

  (global-set-key (kbd "<M-up>") 'tabbar-backward-group)
  (global-set-key (kbd "<M-down>") 'tabbar-forward-group)
  (global-set-key (kbd "<M-left>") 'tabbar-backward)
  (global-set-key (kbd "<M-right>") 'tabbar-forward)

  ;; helm
  (require 'helm-config)

  ;; web-mode
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ftl\\'" . web-mode))

  ;; pymacs
  (require 'pymacs)

  ;; Rope
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-enable-autoimport t)

  ;; pep8
  (require 'py-autopep8)
  (add-hook 'before-save-hook 'py-autopep8-before-save)

  ;; ;; ruby-mode
  ;; (autoload 'ruby-mode "ruby-mode" nil t)
  ;; (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  ;; (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  ;; (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
  ;; (add-hook 'ruby-mode-hook '(lambda ()
  ;;                              (setq ruby-deep-arglist t)
  ;;                              (setq ruby-deep-indent-paren nil)
  ;;                              (setq c-tab-always-indent nil)
  ;;                              (require 'inf-ruby)
  ;;                              (require 'ruby-compilation)))

  ;; ;; rhtml
  ;; (add-to-list 'auto-mode-alist '("\\.eco$" . rhtml-mode))

  ;; ;; rinari
  ;; (global-rinari-mode)

;; }}}


;; Keybind {{{
  ;; (load "dekey")

  ;; set mark keymap
  (global-set-key (kbd "M-SPC") 'set-mark-command)

  ;; set goto-line
  (define-key ctl-x-map "l" 'goto-line)

  ;; org-mode
  (setq org-export-date-timestamp-format "%Y-%m-%d")

  (setq org-publish-project-alist
           '(("orgblog"
               :base-directory "~/Dropbox/Blog/org/"
               :base-extension "org"
               :publishing-directory "~/Dropbox/Blog/html/"
               ;; :publishing-directory "/ssh:root@gaodaojing.com:/data/wwwroot/gaodaojing.com/"
               :publishing-function org-html-publish-to-html
               :headline-levels 4
               :section-numbers nil
               :with-toc nil
               :auto-sitemap t
               :sitemap-filename "sitemap.org"
               :sitemap-title "Archive" ;
               :sitemap-sort-files chronologically
               :sitemap-sort-folders last
               :sitemap-file-entry-format "「%d」 -  %t"
               :makeindex t
               :author "Gaucs"
               :email "me@gaodaojing.com"
               :language "zh_CN"
               :html-doctype "html5"
               :html-head "<link rel=\"stylesheet\" href=\"assets/styles/style.css\" type=\"text/css\"/>"
               :html-preamble "
<div id=\"header\">
  <div class=\"container\">
    <h1 id=\"brand\"><a href=\"/\">浮世</a></h1>
    <nav id=\"nav\" role=\"navigation\">
      <a href=\"/\">Home</a>
      <a href=\"/archive.html\">Archive</a>
      <a href=\"/about.html\">About</a>
    </nav>
  </div>
</div>"
               :html-postamble "
  <div id=\"post_meta\">
    <p class=\"date\">Last Updated: %d</p>
  </div>
  <div id=\"post_discuss\">
    <div id=\"disqus_thread\"></div>
  </div>
  <script type=\"text/javascript\">
  /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
  var disqus_shortname = 'gaucs'; // required: replace example with your forum shortname

  /* * * DON'T EDIT BELOW THIS LINE * * */
  (function() {
      var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
      dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
      (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
  })();
  </script>
  <noscript>Please enable JavaScript to view the <a href=\"http://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>
  <div id=\"footer\"><p class=\"copyright\">Powered by Emacs & Org mode</p></div>
               "
               :html-head-include-default-style nil
               :html-head-include-scripts nil)

              ("images"
               :base-directory "~/Dropbox/Blog/assets/images/"
               :base-extension "jpg\\|gif\\|png"
               :publishing-directory "~/Dropbox/Blog/html/assets/images/"
               ;; :publishing-directory "/ssh:root@gaodaojing.com:/data/wwwroot/gaodaojing.com/images/"
               :publishing-function org-publish-attachment)

              ("styles"
               :base-directory "~/Dropbox/Blog/assets/styles/"
               :base-extension "css"
               :publishing-directory "~/Dropbox/Blog/html/assets/styles/"
               ;; :publishing-directory "/ssh:root@gaodaojing.com:/data/wwwroot/gaodaojing.com/styles/"
               :publishing-function org-publish-attachment)

              ("scripts"
               :base-directory "~/Dropbox/Blog/assets/scripts/"
               :base-extension "js"
               :publishing-directory "~/Dropbox/Blog/html/assets/scripts/"
               ;; :publishing-directory "/ssh:root@gaodaojing.com:/data/wwwroot/gaodaojing.com/scripts/"
               :publishing-function org-publish-attachment)
              ("website" :components ("orgblog" "images" "styles" "scripts"))))

;; }}}


;; Defunction {{{
  ;; (load "defun")

  ;; {{{
  ;; 修改"M-;"注释方式
  ;; 在没有激活的区域，注释/反注释当前行，当在行尾的时候才在行尾加注释
  (defun emacs-comment-dwim-line (&optional arg)
    "Replacement for the comment-dwim command.
  If no region is selected and current line is not blank and we are not at the end of the line,
  then comment current line.
  Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
    (interactive "*P")
    (comment-normalize-vars)
    (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
        (comment-or-uncomment-region (line-beginning-position) (line-end-position))
      (comment-dwim arg)))
  (global-set-key "\M-;" 'emacs-comment-dwim-line)
  ;; }}}

  ;; {{{
  ;; 修改"Alt-w"，当没有激活的区域时就复制当前整行
  ;; Smart copy, if no region active, it simply copy the current whole line
  (defadvice kill-line (before check-position activate)
    (if (member major-mode
                '(emacs-lisp-mode scheme-mode lisp-mode
                                  c-mode c++-mode objc-mode js-mode
                                  latex-mode plain-tex-mode))
        (if (and (eolp) (not (bolp)))
            (progn (forward-char 1)
                   (just-one-space 0)
                   (backward-char 1)))))

  (defadvice kill-ring-save (before slick-copy activate compile)
    "When called interactively with no active region, copy a single line instead."
    (interactive (if mark-active (list (region-beginning) (region-end))
                   (message "Copied line")
                   (list (line-beginning-position)
                         (line-beginning-position 2)))))

  (defadvice kill-region (before slick-cut activate compile)
    "When called interactively with no active region, kill a single line instead."
    (interactive
     (if mark-active (list (region-beginning) (region-end))
       (list (line-beginning-position)
             (line-beginning-position 2)))))

  ;; Copy line from point to the end, exclude the line break
  (defun emacs-copy-line (arg)
    "Copy lines (as many as prefix argument) in the kill ring"
    (interactive "p")
    (kill-ring-save (point)
                    (line-end-position))
    ;; (line-beginning-position (+ 1 arg)))
    (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

  (global-set-key (kbd "M-k") 'emacs-copy-line)
  ;; }}}

;; }}}
