;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 15 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Fira Code" :size 18))
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type :relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;;set directory
(setq org-directory "~/Notes/org")
(setq org-roam-directory (file-truename "~/Notes/roam"))
(setq org-roam-dailies-directory "Personal/journal/2025")

(setq org-roam-dailies-capture-templates
      '(("j" "journal" entry
         "* %?"
         :if-new (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n#+author: Minh Le\n"))))

(setq org-roam-capture-templates
      '(("d" "default" plain "%?"
         :if-new (file+head "${slug}.org"
                            "#+title: ${title}\n#+author: Minh Le\n#+create: %<%Y-%m-%d-%H:%M:%S>")
         :unnarrowed t)
        ("p" "personal") ;;Top-level key is for personal notes
         ("pl" "linux study" plain "%?"
          :if-new (file+head "Personal/Self-study/Linux/${slug}.org"
                             "#+title: ${title}\n#+author: Minh Le\n#+create: %<%Y-%m-%d-%H:%M:%S>")
          :unnarrowed t)
         ("pp" "people" plain "%?"
          :if-new (file+head "Personal/People-database/${slug}.org"
                             "#+title: ${title}\n#+author: Minh Le\n#+create: %<%Y-%m-%d-%H-%M-%S>\n#+Birthday: ${Birthday}\n#+Gender: ${Gender}\n#+email: ${email}\n* How do I know them\n* My observation\n")
          :unnarrowed t)
         ("pm" "math" plain "%?"
          :if-new (file+head "Personal/Self-study/Math/${slug}.org"
                             "#+title: ${title}\n#+author: Minh Le\n#+creat:%<%Y-%m-%d-%H-%M-%S>\n#+topic: ${topic}")
          :unnarrowed t)))
;; Whenever you reconfigure a ;;; config.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2025 DESKTOP-JN4GVOM
;;
;; Author: Minh Le
;; Maintainer: DESKTOP-JN4GVOM <minh@DESKTOP-JN4GVOM>
;; Created: September 03, 2025
;; Modified: September 03, 2025
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/minh/config
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:



(provide 'config)
;;; config.el ends here
;; make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;; The exceptions to this rule:
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq org-startup-with-latex-preview t)
(setq org-preview-latex-default-process 'dvisvgm)

;; Enable cdlatex in org-mode buffers
(add-hook 'org-mode-hook #'turn-on-org-cdlatex)

;; Enable cdlatex in LaTeX buffers
(add-hook 'LaTeX-mode-hook #'turn-on-cdlatex)

;;feeds for elfeed
(elfeed-goodies/setup)
(setq elfeed-goodies/entry-pane-size 0.5)
(setq elfeed-feeds (quote
                    (("https://www.reddit.com/r/archlinux.rss" reddit archlinux)
                     ("https://www.reddit.com/r/emacs.rss" reddit emacs)
                     ("https://www.reddit.com/r/FSAE.rss" reddit FSAE)
                     ("https://www.reddit.com/r/OpenFOAM.rss" reddit openfoam)
                     ("https://www.theguardian.com/world/rss" news guardian)
                     ("https://rss-bridge.org/bridge01/?action=display&amp;bridge=Formula1Bridge&amp;limit=10&amp;format=Mrss" news F1))))
