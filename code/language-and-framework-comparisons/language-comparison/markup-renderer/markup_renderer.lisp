(defparameter *markup-tags*
  `((,(regex "[[]title[]](.*?)[/title]") "\033[33;1m\\1\033[0m") ; Yellow bold text
    (,(regex "[[]emphasis[]](.*?)[/emphasis]") "\033[31;1m\\1\033[0m"))) ; Red bold text

(defun render-markup (text)
  (loop for (tag . replacement) in *markup-tags*
        do (setf text (cl-ppcre:regex-replace-all tag text replacement)))
  text)

(defun main ()
  (let ((input-filename "input.txt"))
    (handler-case
        (with-open-file (file input-filename)
          (let ((content (read-line file nil)))
            (format t "~a~%" (render-markup content))))
      (file-error ()
        (format t "File '~a' not found.~%" input-filename)))))

(main)
