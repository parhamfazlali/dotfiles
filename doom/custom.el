;;; custom.el --- custom configuration               -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Parham

;; Author: Parham <parham@Parhams-MacBook-Pro.local>
;; Keywords:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'"))

;; Enable mouse support
(unless window-system
  (menu-bar-mode -1)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))
(setq mouse-wheel-tilt-scroll t)

(with-eval-after-load 'treemacs
  ;; (treemacs-follow-mode t)
  (treemacs-git-mode 'deferred)
  (treemacs-filewatch-mode t)
  ;; (treemacs-fringe-indicator-mode 'always)
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

(setq default-frame-alist
      (append (list
               '(left   . 0.5)
               '(top    . 0.5)
               '(height . 40)
               '(width  . 90))))

;; If non-nil, cause imenu to see `doom-modeline' declarations.
;; This is done by adjusting `lisp-imenu-generic-expression' to
;; include support for finding `doom-modeline-def-*' forms.
;; Must be set before loading doom-modeline.
(setq doom-modeline-support-imenu t)

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 25)
(setq-default line-spacing 0.2)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:slant italic))))
 '(font-lock-keyword-face ((t (:slant italic)))))

(setq-hook! 'js2-mode-hook +format-with-lsp nil)
(setq-hook! 'web-mode-hook +format-with-lsp nil)

(setq-hook! 'ruby-mode-hook +format-with-lsp nil)
(setq-hook! 'ruby-mode-hook +format-with 'rubocop)

(setq projectile-completion-system 'ivy)
