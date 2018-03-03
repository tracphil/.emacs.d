;;; core-whitespace-mode.el --- whitespace-mode setup
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

(use-package whitespace
  :diminish (global-whitespace-mode
             whitespace-mode
             whitespace-newline-mode)
  :commands (whitespace-buffer
             whitespace-cleanup
             whitespace-mode)
  :init
  (setq whitespace-style '(face tabs lines-tail trailing))
  (global-whitespace-mode t)
  (setq whitespace-line-column 100)
  (setq whitespace-global-modes
	'(c-mode c++-mode lb-datalog-mode java-mode emacs-lisp-mode
		 shell-script-mode sh-mode python-mode ruby-mode
		 yaml-mode json-mode))
  (add-hook 'python-mode-hook
	    #'(lambda ()
		(set (make-local-variable 'whitespace-line-column) 80)))
  (add-hook 'java-mode-hook
	    #'(lambda ()
		(set (make-local-variable 'whitespace-line-column) 100)))
  )

;;; core-whitespace-mode.el ends here
