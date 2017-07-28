(import (class com.palantir.ls.util Uris)
	(class java.nio.file Path Paths)
	(class java.util.concurrent CompletableFuture)
	(class org.eclipse.lsp4j InitializeParams InitializeResult)
	(class org.eclipse.lsp4j.services
	       LanguageClient LanguageClientAware LanguageServer TextDocumentService WorkspaceService))

(define-simple-class KawaLanguageServer
  (LanguageServer LanguageClientAware)
  (*workspace-root*        type: Path)
  (*workspace-service*     type: WorkspaceService)
  (*text-document-service* type: TextDocumentService)

  ((*init* text-document-service workspace-service window-Service)
   (set! *text-document-service* text-document-service)
   (set! *workspace-service* workspace-service)
  )

  ((initialize params ::InitializeParams)
   (set! *workspace-root*
	 (((Paths:get (params:getRootPath)):toAbsolutePath):normalize))
   (let ((result (InitializeResult)))
     (CompletableFuture:completedFuture result)))

  ((shutdown)
   (display "shutdown"))

  ((exit)
   (display "exit"))

  ((connect client ::LanguageClient)
   (display "connect"))
)


(define (main args)
  (display "This is main"))

