;;; emacs-format-file.el

;; http://www.cslab.pepperdine.edu/warford/BatchIndentationEmacs.html
;; https://gist.github.com/3910275

;; emacs -batch files-to-be-formatted --load emacs-format-file.el --funcall emacs-format-apache-conf

(defun emacs-format-apache-conf ()
  (if (< 1 (count-windows))
      (delete-other-windows (selected-window)))
  (catch 'tag
    (while t
      (apache-mode)
      (setq apache-indent-level 4)
      (untabify (point-min) (point-max))
      (replace-regexp " +" " ")
      (delete-trailing-whitespace)
      (indent-region (point-min) (point-max) nil)
      (if buffer-file-name
          (progn
            (write-file buffer-file-name)
            (kill-buffer (current-buffer)))
        (throw 'tag t)))))

(defun emacs-format-nginx-conf ()
  (if (< 1 (count-windows))
      (delete-other-windows (selected-window)))
  (catch 'tag
    (while t
      (nginx-mode)
      (setq nginx-indent-level 4)
      (setq nginx-indent-tabs-mode nil)
      (untabify (point-min) (point-max))
      (replace-regexp " +" " ")
      (delete-trailing-whitespace)
      (indent-region (point-min) (point-max) nil)
      (if buffer-file-name
          (progn
            (write-file buffer-file-name)
            (kill-buffer (current-buffer)))
        (throw 'tag t)))))
