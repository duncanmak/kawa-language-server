(import (class com.palantir.ls.util Uris)
	(class org.eclipse.lsp4j InitializeParams)
	(class org.eclipse.lsp4j.services LanguageClient LanguageClientAware LanguageServer))

(module-name (kawa KawaLanguageServer))
(module-implements LanguageServer LanguageClientAware)
(module-compile-options main: #t)

(define (initialize params ::InitializeParams)
  (display "initialize")
  (display (Uris:getAbsolutePath (params:getRootPath))))

(define (shutdown)
  (display "shutdown"))

(define (exit)
  (display "exit"))

(define (connect client ::LanguageClient)
  (display "connect"))

(define (main args)
  (display "This is main"))

