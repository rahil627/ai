(define (render-markup text)
  (let ((markup-tags
         `((,(regexp #rx"\\[title\\](.*?)\\[/title\\]") . ,(format #f "\x1B[33;1m~a\x1B[0m"))
           (,(regexp #rx"\\[emphasis\\](.*?)\\[/emphasis\\]") . ,(format #f "\x1B[31;1m~a\x1B[0m")))))
    (let loop ((remaining text) (result ""))
      (cond
        ((null? remaining) result)
        ((pair? (car markup-tags))
         (let* ((tag (caar markup-tags))
                (replacement (cdar markup-tags))
                (match (regexp-exec tag remaining)))
           (if match
               (loop (cdr (cdr match))
                     (string-append result (string-replace match 0 replacement)))
               (loop (cdr markup-tags) result))))
        (else (loop (cdr markup-tags) result))))))

(define (main)
  (define input-filename "input.txt")
  (call-with-input-file input-filename
    (lambda (input-port)
      (let ((content (read-line input-port)))
        (display (render-markup content))
        (newline)))))

(main)
