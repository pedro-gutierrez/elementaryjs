;; A sample Elementary app

;; The init function returns a specification of the initial 
;; state of our application. An init spec is very similar to 
;; an update spec. It is made of three parts:
;;
;; 1. A condition (always 'true)
;; 2. A model spec
;; 3. A list of commands to be triggered. Each 
;;      command is defined by an effect and an encoder
;;
(define (init)
  (list (list 'true)
        (list (list 'message "Hello!"))
        (list (list 'ui 'welcome_view))))

;; The encoders function returns a specification of 
;; the different kinds of data to be sent by our application
;; to side effects as commands.
;;
;; In the following example, we defined two encoders
;; (actually, two views) to be sent to the UI for rendering.
;;
(define (encoders)
  (list 
    (list 'welcome_view
              (list "div" '() 
                    (list 
                        (list "h3" '() (list (list 'from 'message)))
                        (list "button" 
                                (list (list 'onclick 'say_it_louder))
                                (list (list "Say it louder"))))))

    (list 'louder_view 
              (list "div" '() 
                    (list 
                        (list "h1" '() (list (list 'from 'message))))))))


;;
;; The decoders function return the list of specifications
;; of the data expected by our application, from side effects. Each
;; decoder defines the input data structure and the message to
;; to map to that data.
;;
;;
(define (decoders) 
  (list (list 'speak_up
              (list 'object 
                    (list (list 'effect 'ui)
                          (list 'event 'say_it_louder))))))

;;
;; The update function is the heart of our application logic.
;; It describes the state machine that mutates the internal model 
;; and triggers new commands to be sent to side effects.
;;
(define (update)
  (list (list 'speak_up 
            (list (list (list 'true) 
                  (list (list 'message "Hello again!!!")) 
                  (list (list 'ui 'louder_view)))))))

;; The effects function return the spec of the side effects
;; required by our application in order to work properly. Side effects
;; are plugins that will be loaded by the Elementary core, according to the 
;; settings given to each one of them.
;;
;; Here we are only using the elementary-ui effect, but real world
;; applications will have more (http, websockets, local storage, media access, etc...).
;;
(define (effects)
  (list (list 'ui 'elementary-ui (list))))

;; This is the standard call that bootstraps our app. All the specifications
;; defined above get compiled by the code. As your can see, application logic is expressed 
;; in terms of pure functions. Side effects are isolated and the 
;; interface is clearly defined in terms of encoders and decoders.
(app init update decoders encoders effects)
