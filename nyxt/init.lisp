(define-configuration buffer
  ((default-modes (append '(vi-normal-mode) %slot-default%))))

;(defvar *my-search-engines*
;  (list
;   '("doi" "https://dx.doi.org/~a" "https://dx.doi.org/")
;   '("python3" "https://docs.python.org/3/search.html?q=~a" "https://docs.python.org/3")
;   '("google" "https://google.com/" "https://google.com/search?q=~a" "https://google.com/")))
;
;(define-configuration buffer
;  ((search-engines (append %slot-default%
;                           (mapcar (lambda (engine) (apply 'make-search-engine engine))
;                                   *my-search-engines*)))))
;https://www.google.com/search?q=github+aartaka+nyxt+config
