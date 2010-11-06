# About
CL-MECHANIZE is a [WWW::Mechanize] work-alike for Common Lisp
implemented as a thin wrapper on top of [Drakma].

This package is still in the early stages of development.

[WWW::Mechanize]: http://search.cpan.org/dist/WWW-Mechanize/lib/WWW/Mechanize.pm
[Drakma]: http://weitz.de/drakma

# Getting
`git clone git://github.com/joachifm/cl-mechanize.git cl-mechanize`

Use [QuickLisp] to easily install the dependencies.

[QuickLisp]: http://quicklisp.org/

# Usage

    $ cd cl-mechanize
    $ sbcl

    ;; Load system
    (require :asdf)
    (asdf:operate 'asdf:load-op :cl-mechanize)
    (in-packge :cl-mechanize-user)

    ;; Create browser object
    (defvar *browser* (make-instance 'browser)

    ;; Do a google search
    (fetch "http://www.google.com" *browser*)

    (let* ((page (browser-page *browser*))
           (search-form (car (page-forms page))))
      (setf (form-inputs search-form)
            '(("q" . "google")))
      (submit search-form *browser*)

      (let ((results (browser-page *browser*)))
        (format t "~A~%" (ppcre:all-matches-as-strings "<title>[a-z].*</title>"
                                                     (page-content results)))
        (dolist (link (page-links results))
          (format t "~A~%" (link-text link)))

        ;; Traverse the DOM
        (stp:do-recursively (n (page-dom results))
            ...)))
