(in-package :cl-user)

(defpackage :cl-mechanize
  (:use :cl)
  (:nicknames :browser :mechanize :net.browser)
  (:export #:*user-agent*
           ;; Classes
           #:browser
           #:browser-user-agent
           #:browser-cookie-jar
           #:browser-history
           #:browser-page
           #:browse-status
           #:form
           #:form-name
           #:form-action
           #:form-method
           #:form-inputs
           #:link
           #:link-text
           #:link-uri
           #:link-tag
           #:link-attrs
           #:page
           #:page-uri
           #:page-links
           #:page-forms
           #:page-dom
           #:page-content
           ;; Methods
           #:fetch
           #:submit
           #:follow))

(defpackage :cl-mechanize-user
  (:use :cl :cl-mechanize)
  (:nicknames :browser-user :mechanize-user :net.browser-user))
