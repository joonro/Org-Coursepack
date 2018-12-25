;; * Package settings
;; ** Activate Org ELPA archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; activate all the packages
(package-initialize)

                                        ; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; ** Make sure essential packages are installed
;; list the packages you want
(setq package-list
      '(org-plus-contrib ox-reveal htmlize))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; * Org-Coursepack settings
;; ** General settings
;; *** Allow remembering risky variables 
(advice-add 'risky-local-variable-p :override #'ignore)

;; *** org-global-prop-value
;; Source: https://emacs.stackexchange.com/questions/21713
(defun org-global-props (&optional property buffer)
  "Get the plists of global org properties of current buffer."
  (unless property (setq property "PROPERTY"))
  (with-current-buffer (or buffer (current-buffer))
    (org-element-map (org-element-parse-buffer)
        'keyword (lambda (el) (when (string-match
                                     property (org-element-property :key el)) el)))))

(defun org-global-prop-value (key)
  "Get global org property KEY of current buffer."
  (org-element-property :value (car (org-global-props key))))

;; ** General Export Settings
;; *** set the default export scope to subtree
(setf org-export-initial-scope 'subtree)

;; *** bind f5 to keyboard macro of export-last-subtree
(fset 'export-last-subtree
      "\C-u\C-c\C-e")

(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "<f5>") 'export-last-subtree)))

;; ** LaTeX Export 
(eval-after-load 'ox '(require 'ox-koma-letter))

(eval-after-load 'ox '(add-to-list 'org-latex-classes
                                   '("koma-article"
                                     "\\documentclass{scrartcl}"
                                     ("\\section{%s}" . "\\section*{%s}")
                                     ("\\subsection{%s}" . "\\subsection*{%s}")
                                     ("\\subsubsection{%s}"
                                      . "\\subsubsection*{%s}")
                                     ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                     ("\\subparagraph{%s}"
                                      . "\\subparagraph*{%s}"))) )

(require 'ox-latex)

(setq org-latex-listings 'minted)

(add-to-list 'org-latex-minted-langs '(python "python"))
(add-to-list 'org-latex-minted-langs '(ipython "python"))

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; *** custom timestamp for syllabus
(defun org-export-filter-timestamp-remove-brackets (timestamp backend info)
  "removes relevant brackets from a timestamp"
  (cond
   ((org-export-derived-backend-p backend 'latex)
    (replace-regexp-in-string "[<>]\\|[][]" "" timestamp))
   ((org-export-derived-backend-p backend 'html)
    (replace-regexp-in-string "&[lg]t;\\|[][]" "" timestamp))))

(eval-after-load 'ox '(add-to-list
                       'org-export-filter-timestamp-functions
                       'org-export-filter-timestamp-remove-brackets))

;; *** beamer export
(eval-after-load 'ox

  ;; update the list of LaTeX classes and associated header (encoding, etc.)
  ;; and structure
  '(add-to-list 'org-latex-classes
                `("beamer"
                  ,(concat "\\documentclass[presentation]{beamer}\n"
                           "[DEFAULT-PACKAGES]"
                           "[PACKAGES]"
                           "[EXTRA]\n")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(require 'ox-beamer)

;; ** reveal.js export
(require 'ox-reveal)

;; ** Other export functionalities
;; *** ignore headlines of subtrees with :ignore: tag in export
(require 'ox-extra)
(ox-extras-activate '(ignore-headlines))

;; *** support slideonly and handoutonly tags
(defun org/parse-headings (backend)
  "Remove every headline with certain tags in the
  current buffer. BACKEND is the export back-end being used, as
  a symbol.

  "

  (if (member backend '(latex rst))
      (org-map-entries
       (lambda ()
         (progn
           (org-narrow-to-subtree)
           (org-cut-subtree)
           (widen)
           ))
       "+slideonly"))

  (if (member backend '(reveal beamer))
      (org-map-entries
       (lambda ()
         (progn
           (org-narrow-to-subtree)
           (org-cut-subtree)
           (widen)
           ))
       "+handoutonly"))

  )

(add-hook 'org-export-before-parsing-hook 'org/parse-headings)

;; *** Subtrees with :newpage: tag will be exported on a new page
(defun org/get-headline-string-element  (headline backend info)
  "Return the org element representation of an element.

  Won't work on ~verb~/=code=-only headers"
  (let ((prop-point (next-property-change 0 headline)))
    (if prop-point (plist-get (text-properties-at prop-point headline) :parent))))

(defun org/ensure-latex-clearpage (headline backend info)
  (when (org-export-derived-backend-p backend 'latex)
    (let ((elmnt (org/get-headline-string-element headline backend info)))
      (when (member "newpage" (org-element-property :tags elmnt))
        (concat "\\clearpage\n" headline)))))

(eval-after-load 'ox '(add-to-list
                       'org-export-filter-headline-functions
                       'org/ensure-latex-clearpage))

;; *** Special blocks
(defun string/starts-with (string prefix)
  "Return t if STRING starts with prefix."
  (and (string-match (rx-to-string `(: bos ,prefix) t) string) t))

(defun my/process-NOTES-blocks (text backend info)
  "Filter NOTES special blocks in export."
  (cond
   ((eq backend 'latex)
    (if (string/starts-with text "\\begin{NOTES}") ""))
   ((eq backend 'rst)
    (if (string/starts-with text ".. NOTES::") ""))
   ((eq backend 'html)
    (if (string/starts-with text "<div class=\"NOTES\">") ""))
   ((eq backend 'beamer)
    (let ((text (replace-regexp-in-string "\\\\begin{NOTES}" "\\\\note{" text)))
      (replace-regexp-in-string "\\\\end{NOTES}" "}" text)))
   ))

(eval-after-load 'ox '(add-to-list
                       'org-export-filter-special-block-functions
                       'my/process-NOTES-blocks))

(defun my/process-mdframed-blocks (text backend info)
  "Filter mdframed special blocks in export."
  (cond
   ((org-export-derived-backend-p backend 'rst)
    (replace-regexp-in-string ".. mdframed::" ".. note::" text t t))
   ))

(eval-after-load 'ox '(add-to-list
                       'org-export-filter-special-block-functions
                       'my/process-mdframed-blocks))

;; * Convenience settings
;; ** Use standard keybindings
;; CUA mode: https://www.emacswiki.org/emacs/CuaMode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; ** Org mode keybindings
;; http://orgmode.org/manual/Conflicts.html
(setq org-replace-disputed-keys t)

(eval-after-load "org"
  '(progn
     (setq org-support-shift-select t)

     ;; restore shift + arrow keybindings for reading date 
     (define-key org-read-date-minibuffer-local-map (kbd "S-<up>")
       (lambda () (interactive)
         (org-eval-in-calendar '(calendar-backward-week 1))))
     (define-key org-read-date-minibuffer-local-map (kbd "S-<down>")
       (lambda () (interactive)
         (org-eval-in-calendar '(calendar-forward-week 1))))
     (define-key org-read-date-minibuffer-local-map (kbd "S-<left>")
       (lambda () (interactive)
         (org-eval-in-calendar '(calendar-backward-day 1))))
     (define-key org-read-date-minibuffer-local-map (kbd "S-<right>")
       (lambda () (interactive)
         (org-eval-in-calendar '(calendar-forward-day 1))))))

;; ** Allow to type just "y" instead of "yes" when you exit.
(fset 'yes-or-no-p 'y-or-n-p)

;; ** disable ding sound
(setq visible-bell t)
