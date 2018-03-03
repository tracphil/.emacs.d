;;; core-neo-tree.el --- neo-tree setup
;;
;; Copyright 2017 Tracy Phillips <reavon@yahoo.com>
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

;;; Code:

(use-package neotree
  :ensure t
  :diminish neotree-mode
  :init
  (progn
    (setq-default neo-smart-open t)
    (setq-default neo-dont-be-alone t)
    )
  :config
  (progn
    (setq neo-theme (if (display-grayscale-p) 'icons 'nerd)) ;; classic, nerd, ascii, arrow
    (setq neo-vc-integration '(face char))
    (global-set-key [f8] 'neotree-toggle)
    ;; load neotree on startup
    ;;(when (display-graphic-p)
    ;;  (defun neotree-startup ()
    ;;	(interactive)
    ;;	(neotree-show)
    ;;	(call-interactively 'other-window))
    ;;  (if (daemonp)
    ;;	  (add-hook 'server-switch-hook #'neotree-startup)
    ;;	(add-hook 'after-init-hook #'neotree-startup)
    ;;	)
    ;;  )
    )
  )

;;; core-neo-tree.el ends here
