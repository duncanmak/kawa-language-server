SOURCES = src/*.scm

run:
	CLASSPATH=jars/org.eclipse.lsp4j-0.2.1.jar:jars/language-server-commons-0.4.3.jar kawa $(SOURCES)
