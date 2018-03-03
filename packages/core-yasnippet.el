;;; core-yasnippet.el --- yasnippet setup
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

(use-package yasnippet
  :ensure t
  ;; :defer 2
  :diminish yas-minor-mode
  :mode ("\\.yasnippet" . snippet-mode)
  :init
  (yas-global-mode 1)
  :config
  (progn (defun set-yasnippet-fixed-indent ()
           (setq-local yas-indent-line 'fixed))
         (add-hook 'saltstack-mode-hook #'set-yasnippet-fixed-indent)
         (add-hook 'ansible- #'set-yasnippet-fixed-indent)
         (add-hook 'yaml-mode-hook #'set-yasnippet-fixed-indent)
         )
  )

;;; core-yasnippet.el ends here
