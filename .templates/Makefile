TEXSRC = textemplate
OUTPUT = textemplate

all:
	latexmk --xelatex $(TEXSRC).tex 

cleanup:
	latexmk -C

clean: cleanup
	rm -rf $(OUTPUT).pdf
