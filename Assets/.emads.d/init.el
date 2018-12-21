;; Activate Org ELPA archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; list the packages you want
(setq package-list
      '(org-plus-contrib ox-reveal))

;; activate all the packages
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Export related settings
;; LaTeX Export 
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

;; beamer export
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


;; support slideonly and handoutonly tags
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
