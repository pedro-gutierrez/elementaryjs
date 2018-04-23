(define (init)
  (list (list 'true)
        (list (list 'message "Hello there"))
        (list (list 'ui 'welcome_view))))

(define (encoders)
  (list (list 'welcome_view
              (list "h1" '() (list (list 'from 'message))))))

(define (update) '())

(define (decoders) '())

(define (effects)
  (list (list 'ui 'elementary-ui (list))))

(app init update decoders encoders effects)
