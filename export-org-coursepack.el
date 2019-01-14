;; Script to export syllabus and all lectures of a semester Org file

(load-file "./Assets/.emacs.d/init.el")

(require 'org)
(require 'ox-latex)

(setq org-use-property-inheritance t)

(setq target-file "./Courses/Org-Coursepack/2018 Fall/2018 Fall.org")

;; Update lecture metadata
(with-current-buffer (find-file-noselect target-file)
  (progn
    ;; Update lecture metadata
    (beginning-of-buffer)
    (re-search-forward "CALL: org-coursepack-update-lecture-metadata")
    (org-ctrl-c-ctrl-c)

    (save-buffer)
    ))

;; Export syllabus
(with-current-buffer (find-file-noselect target-file)
  (progn
    (beginning-of-buffer)
    (re-search-forward ":EXPORT_FILE_NAME: ./Syllabus/Syllabus \(Section 1\)")
    (org-latex-export-to-pdf nil t)
    ;; (org-html-export-to-html nil t)
    ))

;; Export lectures
(with-current-buffer (find-file-noselect target-file)
  (progn
    (beginning-of-buffer)
    (while (re-search-forward ":EXPORT_FILE_NAME: ./Lectures/" nil nil)
      (progn
        (org-reveal-export-to-html nil t)
        (org-latex-export-to-pdf nil t)
        (org-rst-export-to-rst nil t)
        (forward-line 1)
        ))))

