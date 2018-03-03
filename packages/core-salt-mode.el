;;; core-salt-mode.el --- salt-mode setup
;;
;; Copyright 2017 Tracy Phillips <tracphil@outlook.com>
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

;; (require 'yaml-mode)

;; (define-derived-mode saltstack-mode yaml-mode "Saltstack"
;;   "Minimal Saltstack mode, based on `yaml-mode'."
;;   (setq tab-width 2
;;         indent-tabs-mode nil))
;; 
;; (add-to-list 'auto-mode-alist '("\\.sls\\'" . saltstack-mode))
;; (add-to-list 'auto-mode-alist '("\\map.jinja\\'" . saltstack-mode))

(use-package salt-mode
  :ensure t
  )

;;; core-salt-mode.el ends here
