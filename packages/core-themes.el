;;; core-themes.el --- core themes setup
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

;;; Code:

;;(use-package gruvbox-theme
;;  :ensure t
;;  :config
;;  (load-theme 'gruvbox-dark-hard)
;;  )

;; (use-package material-theme
;;  :config
;;  (load-theme 'material t)
;;  )

(use-package gotham-theme
  :ensure t
  :config
  (load-theme 'gotham t)
  (custom-theme-set-faces
   'gotham
   '(sh-heredoc ((t (:foreground "MistyRose4" :weight normal))))
   '(mmm-default-submode-face ((t (:background "black"))))
   )
  )

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   (load-theme 'doom-one t)
;;   (doom-themes-neotree-config)
;;   (doom-themes-org-config)
;;   )

;; (use-package atom-one-dark-theme
;;   :ensure t
;;   :config
;;   (load-theme 'atom-one-dark t)
;;   )

;; (use-package spacemacs-common
;;   :ensure spacemacs-theme
;;   :config
;;   (load-theme 'spacemacs-dark t)
;;   )

;; (use-package dracula-theme
;;   :ensure t
;;   :config
;;   (load-theme 'dracula t)
;;   )

;;; core-themes.el ends here
