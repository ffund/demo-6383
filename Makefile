all: example.ipynb

clean:
	rm example.ipynb

SNIPPETS := fabric-snippets/fab-config.md fabric-snippets/reserve-resources-site.md fabric-snippets/extend.md fabric-snippets/configure-resources.md fabric-snippets/draw-topo-site.md fabric-snippets/log-in.md fabric-snippets/delete-slice.md
example.ipynb: $(SNIPPETS) custom-snippets/intro.md custom-snippets/exp-define.md custom-snippets/more-instruction.md
	pandoc --wrap=none \
				-i custom-snippets/intro.md \
				fabric-snippets/fab-config.md \
				custom-snippets/exp-define.md  \
				fabric-snippets/reserve-resources-site.md fabric-snippets/extend.md \
				fabric-snippets/configure-resources.md \
				fabric-snippets/draw-topo-site.md fabric-snippets/log-in.md \
				custom-snippets/more-instruction.md \
				fabric-snippets/delete-slice.md \
				-o example.ipynb  

