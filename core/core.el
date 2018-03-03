;;; core.el --- Core file for Emacs Configuration.
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

;; quicken Emacs startup timet
(setq gc-cons-threshold 100000000)

;; Get current hostnname.
(defun insert-system-name ()
  "Get current workstation hostname."
  (interactive)
  (insert (format "%s" (system-name)))
  )

;; Get current system OS
(defun insert-system-os ()
  "Get current Operating System."
  (interactive)
  (insert (format "%s" system-type))
  )

(defun core/short-hostname ()
  "Get current workstation short hostname."
  (let* ((sys-name (system-name))
         (idx (string-match "\\." sys-name)))
    (if idx
        (substring sys-name 0 idx)
      sys-name))
  )

;; move custom.el to data directory
(setq custom-file (expand-file-name (concat "custom-" (core/short-hostname) ".el") core-data-dir))
(load custom-file 'noerror)

;; move ido.last to data directory
(setq ido-save-directory-list-file (expand-file-name (concat "ido-" (core/short-hostname) ".last") core-data-dir))

;; move places directory to data directory
(setq save-place-file (expand-file-name (concat "places-" (core/short-hostname)) core-data-dir))

;; move smex-items file to data directory
(setq smex-save-file (expand-file-name (concat "smex-items-" (core/short-hostname)) core-data-dir))

(defvar local-modules-dir (expand-file-name "modules" core-local-dir)
  "Emacs local modules directory.")

(if (not (file-exists-p local-modules-dir))
    (make-directory local-modules-dir t))

(defvar local-snippets-dir (expand-file-name "snippets" core-local-dir)
  "Emacs local snippets directory.")

(if (not (file-exists-p local-snippets-dir))
    (make-directory local-snippets-dir t))

(defvar local-vendor-dir (expand-file-name "vendor" core-local-dir)
  "Emacs local vendor directory.")

(if (not (file-exists-p local-vendor-dir))
    (make-directory local-vendor-dir t))

;; load local files
(mapc (lambda (local-file) (load local-file))
      (directory-files core-local-dir t "[^\.].*\.el$"))

;; don't create lock files
(setq create-lockfiles nil)

;; (defvar backup-dir (expand-file-name "backups" root-dir)
;;   "Emacs backup directory.")
;;
;; (if (not (file-exists-p backup-dir))
;;     (make-directory backup-dir t))
;;
;; (defvar autosave-dir (expand-file-name "autosave" root-dir)
;;   "Emacs autosave directory.")
;;
;; (if (not (file-exists-p autosave-dir))
;;     (make-directory autosave-dir t))
;;
;; ;; Don't clutter up directories with files~
;; (setq backup-directory-alist
;;       `(("." . ,backup-dir)))

;; Don't clutter with #files either
;; (setq auto-save-list-file-prefix nil)
;; (setq auto-save-file-name-transforms
;;       `((".*" ,(expand-file-name (concat root-dir "autosave")))))

;; disable backup
(setq backup-inhibited t)

;; disable auto save
(setq auto-save-default nil)

;; (setq make-backup-files t             ; don't make backups
;;       backup-by-copying t               ; don't clobber symlinks
;;       version-control t                 ; version numbers for backup files
;;       delete-old-versions t             ; delete excess backup files silently
;;       delete-by-moving-to-trash t
;;       kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
;;       kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
;;       auto-save-default t               ; auto-save every buffer that visits a file
;;       auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
;;       auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
;;       vc-make-backup-files t            ; Backup even when it's a version controlled project
;;       )

(require 'core-installer)
(require 'core-ux)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

(provide 'core)
;;; core.el ends here
