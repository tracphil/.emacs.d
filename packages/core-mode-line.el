;;; core-mode-line.el --- mode-line configuration
;;
;; Copyright 2017 Tracy Phillips
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software Foundation,
;; Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA

;;; Commentary:
;; This file is for mode line customization

;;; Code:

;; (use-package powerline
;;   :ensure t
;;   :init
;;   (setq powerline-default-seperator 'wave)
;;   :config
;;   (require 'powerline)
;;   (powerline-default-theme)
;;   )

(use-package spaceline
  :ensure t
  :config
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main))))
  )

(use-package spaceline-config
  :ensure spaceline
  :config
  (setq powerline-height 18
        ns-use-srgb-colorspace nil
        powerline-default-separator 'wave
        spaceesspaceline-workspace-numbers-unicode t
        spaceline-window-numbers-unicode t
        spaceline-separator-dir-left '(right . right)
        spaceline-separator-dir-right '(left . left)
        spaceline-flycheck-bullet "❖ %s")
  (spaceline-install
   'main
   '((buffer-modified)
     ((remote-host buffer-id) :face highlight-face)
     (process :when active))
   '((selection-info :face region :when active)
     ((flycheck-error flycheck-warning flycheck-info) :when active)
     (which-function)
     (version-control :when active)
     (line-column)
     (global :when active)
     (major-mode)))
  (spaceline-emacs-theme)
  )

(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
;;; core-mode-line.el ends here
