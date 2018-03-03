;;; core-installer.el --- core-installer setup
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

(require 'package)

;; explicitly use package archives that are listed below
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)

;; add melpa (current) to package sources
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; add org-mode package sources
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; The directory to install packages
(setq package-user-dir (expand-file-name "elpa" root-dir))

;; This must come before configurations of installed packages
;; DO NOT remove this line
(package-initialize)

;; bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

(eval-when-compile
  (require 'use-package))

;; diminish minor modes from the mode line
(use-package diminish
  :ensure t
  :diminish (visual-line-mode . "ω")
  :diminish hs-minor-mode
  :diminish abbrev-mode
  :diminish auto-fill-function
  :diminish subword-mode)

(use-package bind-key
  :ensure t)

;; packages
(mapc (lambda (package-file) (load package-file))
      (directory-files core-packages-dir t "^[^\.].*\.el$"))

(provide 'core-installer)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; core-installer.el ends here
