;;; evil-flycheck.el --- flycheck buffer when entering normal state

;; Copyright (c) 2015 Alex Murray <alexmurray@fastmail.fm>
;;
;; Author: Alex Murray <alexmurray@fastmail.fm>
;; URL: https://github.com/alexmurray/evil-flycheck
;; Keywords: evil flycheck
;; Version: 0.1
;; Package-Requires: ((flycheck "0.23") (evil "1.0.9"))

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Integration of flycheck with evil

;; Adds automatic flychecking when entering normal state and provides the
;; `evil-normal-state' option for `flycheck-check-syntax-automatically'

;;; Code:

(require 'evil)
(require 'flycheck)

(defun evil-flycheck-handle-evil-normal-state-entry ()
  "Handle switching to normal state in evil."
  (flycheck-buffer-automatically 'evil-normal-state))

(add-to-list 'flycheck-check-syntax-automatically 'evil-normal-state)

(add-to-list 'flycheck-hooks-alist
             '(evil-normal-state-entry-hook . evil-flycheck-handle-evil-normal-state-entry))

(provide 'evil-flycheck)

;;; evil-flycheck.el ends here
