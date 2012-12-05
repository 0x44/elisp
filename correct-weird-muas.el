(add-hook 'message-header-setup-hook
	  (lambda()
	    (goto-char (point-min))
	    (while (re-search-forward "\"\\(<\\(\\w\\|\\.\\)+@\\(\\w\\|\\.\\)+>\\)" nil t)
	      ;; Special thanks to NetEase Flash Mail.
	      (replace-match "\" \\1"))
	    (goto-char (point-min))
	    (while (re-search-forward " +" nil t)
	      ;; Remove unnecessary whitespaces.
	      (replace-match " "))
	    (goto-char (point-min))
	    (while (re-search-forward "\\(\u56de\\|\u7b54\\)\u590d: " nil t)
	      ;; Please just use "Re: ".
	      (replace-match ""))
	    (goto-char (point-min))))

(add-hook 'message-send-hook
	  (lambda()
	    (goto-char (point-min))
	    (while (re-search-forward "\"\\(<\\(\\w\\|\\.\\)+@\\(\\w\\|\\.\\)+>\\)" nil t)
	      ;; Special thanks to NetEase Flash Mail.
	      (replace-match "\" \\1"))
	    (goto-char (point-min))))
