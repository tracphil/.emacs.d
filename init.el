;;; init.el --- bootstrap emacs
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

;; This is my Emacs init.el.  There are many like it, but this one is mine.

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar root-dir (file-name-directory load-file-name)
  "Emacs root configuration directory.")

(defvar core-dir (expand-file-name "core" root-dir)
  "Emacs core configuration directory.")

(defvar core-data-dir (expand-file-name "data" root-dir)
  "Local configuration data directory.")

(if (not (file-exists-p core-data-dir))
    (make-directory core-data-dir t))

(defvar core-packages-dir (expand-file-name "packages" root-dir)
  "Use-package configuration directory.")

(defvar core-utils-dir (expand-file-name "utilities" root-dir)
  "Emacs helper utilities.")

(defvar core-local-dir (expand-file-name "local" root-dir)
  "Local Emacs configuration data.")

(defvar core-vendor-dir (expand-file-name "vendor" root-dir)
  "Manual package installation directory.")

;; Taken directly from Emacs Prelude. Thanks Bozhidar Batsov!
(defun core-add-subfolders-to-load-path (parent-dir)
  "Add all PARENT-DIR subdirs to 'load-path'."
  (dolist (f (directory-files parent-dir))
  (let ((name (expand-file-name f parent-dir)))
    (when (and (file-directory-p name)
               (not (string-prefix-p "." f)))
      (add-to-list 'load-path name)
      (core-add-subfolders-to-load-path name)))))

(add-to-list 'load-path core-dir)
(add-to-list 'load-path core-packages-dir)

;; Vendor files are packages that are not available via MELPA, et al.
(core-add-subfolders-to-load-path (expand-file-name "vendor" root-dir))

;; Local configuration
(core-add-subfolders-to-load-path core-local-dir)

(require 'core)
(require 'core-shell)

;;; init.el ends here
